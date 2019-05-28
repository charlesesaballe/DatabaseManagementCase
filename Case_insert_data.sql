--INSERTING SOME ROWS TO TABLES

INSERT INTO Venue (venueName, capacity) VALUES
('small room', 80),
('big room', 400)

SELECT * FROM Venue;

INSERT INTO Event (eventName, eventDate, price, venueId) VALUES
('Christmas Concert', '2017-12-18', 6.50, 1),
('Saara Aalto: Live', '2018-01-12', 85, 2),
('ZZ Top in Kuru', '2018-01-19', 38.60, 2),
('Michael Flatley: Evolution of Dance', '2018-07-20', 27, 2),
('Adele: Finland Tour', '2018-03-01', 120.95, 2),
('The Three Musketeers', '2017-12-20', 20, 1)

SELECT * FROM Event;

INSERT INTO Performance (performanceName, type) VALUES
('Classic Christmas Carols', 'Music'),
('Finnish Christmas Songs Medley', 'Music'),
('Saara Aalto Xfactor Songs', 'Music'),
('River dance', 'Dance'),
('The Three Musketeers 2017', 'Theater'),
('Adele Hits', 'Music'),
('La Futura', 'Music')

SELECT * FROM Performance;

INSERT INTO Artist (artistName, contactInfo, specialRequest) VALUES
('Saara Aalto', '0449801234', 'vegetarian'),
('Adele', 'bookings@adele.com', 'no pork'),
('Kuru Children Choir', '050123456', 'none'),
('ZZ Top', 'zz@top.com', 'gluten free options, meat'),
('Michael Flatley', 'dance@flatley.com', 'lemon water'),
('Helsinki Theater Company', 'bookings@htc.fi', 'gluten free options, vegan options')

SELECT * FROM Artist;

INSERT INTO Performance_Artist (performanceId, artistId) VALUES
(1,3),
(2,3),
(3,1),
(3,5),
(4,5),
(5,6),
(6, 2),
(7,4)

SELECT * FROM Performance_Artist;

INSERT INTO Event_Performance (eventId, performanceId) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 7),
(4, 4),
(5, 6),
(6, 5)

SELECT * FROM Event_Performance;

--Insert Booking

INSERT INTO Booking (eventId, bookingDate, ticketQuantity, bookingStatus, memo) VALUES
(4, '2017-12-01', 5, 'Booked', '0501111111'),
(4, '2017-12-02', 6, 'Booked', '0501111112'),
(5, '2017-12-03', 10, 'Booked', '0501111113'),
(5, '2017-12-04', 2, 'Booked', '0501111114'),
(5, '2017-12-05', 15, 'Booked', '0501111115'),
(2, '2017-12-06', 18, 'Booked', '0501111116'),
(1, '2017-12-07', 8, 'Booked', '0501111117'),
(3, '2017-12-08', 5, 'Booked', '0501111118'),
(6, '2017-11-09', 10, 'Booked', '0501111119')

SELECT * FROM Booking;

--Insert Ticket