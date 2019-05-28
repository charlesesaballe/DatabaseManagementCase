# DatabaseManagementCase
Case project for the Data Management and Databases course

## THE CASE: Kuru Culture Club
The Kuru Culture Club is an association organizing concerts, dance and theatre performances and other cultural events. So far, tickets have been sold in person at Kuru Library. Now the Kuru Culture Club is keen on offering Internet pages, where clients could see upcoming events and book tickets. When a client makes a booking he/she should get a unique booking number. The booked tickets should still be purchased at Kuru Library within three days from booking.

### Further details
* The Kuru Culture Club has two venues to hold its events. The smaller room accommodates 80 people, the larger one – up to 400 people. 
* It is possible that other venues may become available in the future.
* The seats are not numbered, but the fire safety regulations do not allow any overbooking.
* All tickets to a certain event are sold at the same price.
* Different events may be priced differently.
* An event can include performances from various artists.
* Popular performers visit Kuru often. The Kuru Culture Club has an extensive registry of artists – Finnish and foreign – with their contact information and special requests for catering and refreshments.
* The booked tickets are identified and purchased by booking number.
* A booking can only contain tickets to one event.
* A booking can be cancelled, unless it has already been already purchased (payed for).
* The number of tickets in a booking can be changed, unless the tickets are already purchased.
* Once the tickets are purchased, they can neither be changed nor refunded (except for event cancellation).
* If the event is cancelled, the client can receive a refund of the amount paid for the ticket. The refund is given in person at Kuru Library.
* All the tickets included in the same booking must be purchased at the same time.
* Client information is not stored in the database. Client can add telephone number to the booking memo field to help find the booked tickets in case of a loss of the booking number.

### Requirements
The new application should help to complete the tasks (user transactions) listed below:
1. Booking a ticket
2. Cancelling a ticket booking
3. Changing the number of tickets in a booking
4. Changing the status of booking to sold when tickets are purchased (the booking is payed for)
5. Removing the unpurchased bookings from the database after three days from booking
6. Removing the unpurchased bookings of the past events from the database
7. Cancelling an event (in extreme exceptional cases)
8. Refunding a client in case of a cancelled event.

Examples of the queries (user transactions) the new application should support are the following:
1. What events are coming up next month?
2. What theatre performances are coming up this month?
3. What is Saara Aalto's2 phone number?
4. When will ZZ Top3 perform in Kuru and what are their special requests for catering?
5. How many tickets have been sold to Michael Flatley's4 dance performance ''River dance" that takes place on 20.7.2018?
6. How many tickets are there left for Adele’s concert on 1.3.2018?
7. How much money has the Kuru Culture Club got from sold tickets this year?
