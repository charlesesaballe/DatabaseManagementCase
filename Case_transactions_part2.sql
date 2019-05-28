--9.Events coming up next month
Select * from Event
select * from Artist
select * from Ticket
select * from Performance
select * from Booking




Select eventName,eventDate from Event
where eventDate between '2018-01-11' and '2018-02-11'

--10 Perfomance coming up this month
select eventName,eventDate
from Event
Join Event_Performance on (Event_Performance.eventId=Event.eventId)
join Performance on (Performance.performanceId=Event_Performance.performanceId)
Where MONTH(eventDate) = MONTH(GETDATE()) and type ='Theater';

--11 What is Saara AALto's phone number?
Select artistName,contactInfo
from Artist
where artistName = 'Saara Aalto';

--12 When will ZZ TOP perform in Kuru and what their special requests for catering
Select eventName,eventDate,specialRequest,artistName
from Event
Join Event_Performance on (Event_Performance.eventId=Event.eventId)
Join Performance_Artist on (Performance_Artist.performanceId=Event_Performance.performanceId)
Join Artist on (Artist.artistId = Performance_Artist.artistId)
where Artist.artistName = 'ZZ TOP';

--13 How many tickets have been sold to Michael Flatley's dance perfomance "River dance" that takes place on 20.7.2018 
Select count(*) as "Number of tickets sold",artistName,performanceName,eventDate
from Ticket
join Booking on (Booking.bookingId=Ticket.bookingID)
join Event on (Event.eventId=Booking.eventId)
Join Event_Performance on (Event_Performance.eventId=Event.eventId)
join Performance on (Performance.performanceId =Event_Performance.performanceId)
Join Performance_Artist on (Performance_Artist.performanceId=Performance.performanceId)
Join Artist on (Artist.artistId = Performance_Artist.artistId)
Group by artistName,performanceName,eventDate
Having eventDate = '2018-07-20' and performanceName='River dance' and artistName='Michael Flatley'
 
 --14 How many tickets are there left for Adele's concert on 1.3.2018?
 select(400-COUNT(ticketId)) as "Number of tickets left", Event.eventDate,Performance.type,Artist.artistName
 from Ticket
join Booking on (Booking.bookingId=Ticket.bookingID)
join Event on (Event.eventId=Booking.eventId)
Join Event_Performance on (Event_Performance.eventId=Event.eventId)
join Performance on (Performance.performanceId =Event_Performance.performanceId)
Join Performance_Artist on (Performance_Artist.performanceId=Performance.performanceId)
Join Artist on (Artist.artistId = Performance_Artist.artistId)
Group by artistName,eventDate,type
having artistName='Adele' and eventDate ='2018-03-01' and type ='Music'

--15 How much money has the Kuru Culture got from sold tickets this year?
select Sum(price*Booking.ticketQuantity) as 'This year revenue' 
from event
join Booking on(booking.eventId= event.eventId)
where YEAR(eventDate) = 2017 and bookingStatus='Paid'
group by YEAR(eventDate) 

