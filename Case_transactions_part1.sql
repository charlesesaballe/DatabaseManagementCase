--1) Booking tickets--
--First, let's see the tickets booked so far for different events and their max capacity--
SELECT Event.eventId, eventName, Venue.capacity, 
SUM(Booking.ticketQuantity) AS 'Tickets booked so far',
(Venue.capacity-SUM(Booking.ticketQuantity)) AS 'Number of free places'
FROM Event
JOIN Venue ON (Venue.venueId = Event.venueId)
JOIN Booking ON (Booking.eventId = Event.eventId)
GROUP BY Event.eventId, eventName, Venue.capacity

--Second, let's book 70 tickets for event 1 – Christmas Concert.--
--And check the result in tables--
BEGIN TRANSACTION;
INSERT INTO Booking (eventId, bookingDate, ticketQuantity, bookingStatus, memo) VALUES
(1, '2017-12-11', 70, 'Booked', '0413682916')
SELECT * FROM Booking
ROLLBACK;
--It works--

--2) Cancelling a booking
DELETE FROM Booking WHERE bookingId = '13'
SELECT * FROM Booking

--3) Chanching ticket amount in booking
--making a booking with 10 tickets--
INSERT INTO Booking (eventId, bookingDate, ticketQuantity, bookingStatus, memo) VALUES
(1, '2017-12-11', 10, 'Booked', '0413682916')
SELECT * FROM Booking
SELECT * FROM Ticket

--modifying to 5--
UPDATE Booking SET ticketQuantity = '5' WHERE bookingId = '14'
SELECT * FROM Booking

--4) changing status of booking
UPDATE Booking SET bookingStatus = 'Paid' WHERE bookingId = '14'
SELECT * FROM Booking

--5) Removing outdated bookings--
SELECT bookingId, DAY(bookingDate), DAY(SYSDATETIME()), (DAY(SYSDATETIME())-DAY(bookingDate)) FROM Booking
ORDER BY bookingId
SELECT * FROM Booking

BEGIN TRANSACTION;
DELETE FROM Booking WHERE (DAY(SYSDATETIME())-DAY(bookingDate)) > 3
SELECT *, (DAY(SYSDATETIME())-DAY(bookingDate)) AS 'days past since booking' FROM Booking
ROLLBACK;
SELECT * FROM Booking

--6) removing unpurchased bookings of past events
SELECT *, CONVERT(date,SYSDATETIME()) AS 'current date' FROM Event
SELECT * FROM Event
WHERE eventDate < CONVERT(date,SYSDATETIME())

--Let's create two events that happened in the past--
BEGIN TRANSACTION;
INSERT INTO Event (eventName, eventDate, price, venueId) VALUES
('HH Graduation', '2017-05-30', 5, 1),
('Rolling Stones COncert', '2016-06-24', 115, 2)
SELECT * FROM Event
BEGIN TRANSACTION;
INSERT INTO Event_Performance (eventId, performanceId) VALUES
(7, 1),
(8, 2)
SELECT * FROM Event_Performance;

--Let's now add some bookings to those events--
BEGIN TRANSACTION;
INSERT INTO Booking (eventId, bookingDate, ticketQuantity, bookingStatus, memo) VALUES
(7, '2017-05-15', 5, 'Booked', '0413682917'),
(7, '2017-05-12', 6, 'Paid', '0413682918'),
(8, '2016-06-03', 10, 'Booked', '0413682919'),
(8, '2016-06-04', 2, 'Paid', '0413682915')
SELECT * FROM Booking

--removing unpaid bookings--
BEGIN TRANSACTION;
DELETE FROM Booking
WHERE bookingStatus = 'Booked' AND eventId IN (SELECT eventId FROM Event
WHERE eventDate < CONVERT(date,SYSDATETIME()))

ROLLBACK;

SELECT * FROM Booking
JOIN Event ON (Event.eventId = Booking.eventId)
WHERE bookingStatus = 'Booked' AND eventDate < CONVERT(date,SYSDATETIME())


--7) Cancelling an event
BEGIN TRANSACTION;
UPDATE Event SET eventStatus = 'Cancelled' WHERE eventId = '5'
SELECT * FROM Event