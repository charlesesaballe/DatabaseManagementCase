--CREATING TABLES

CREATE TABLE Venue
(
	venueId INTEGER NOT NULL IDENTITY,
	venueName VARCHAR(50) NOT NULL,
	capacity INTEGER NOT NULL,
	CONSTRAINT PK_Venue PRIMARY KEY (venueId),
	CONSTRAINT UQ_Venue_venueName UNIQUE (venueName)
)

CREATE TABLE Event
(
	eventId INTEGER NOT NULL IDENTITY,
	eventName VARCHAR(50) NOT NULL,
	eventDate DATE NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	venueId INTEGER NOT NULL,
	eventStatus VARCHAR(10),
	CONSTRAINT PK_Event PRIMARY KEY (eventId),
	CONSTRAINT FK_Event_Venue FOREIGN KEY (venueId) REFERENCES Venue (venueId),
	CONSTRAINT CHK_Event_eventStatus CHECK (eventStatus IN ('Cancelled'))
)

CREATE TABLE Performance
(
	performanceId INTEGER NOT NULL IDENTITY,
	performanceName VARCHAR(50) NOT NULL,
	type VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Performance PRIMARY KEY (performanceId),
	CONSTRAINT CHK_Performance_type CHECK (type IN ('Theater', 'Dance', 'Music', 'Opera', 'Musical Theater', 'Others'))
)

CREATE TABLE Artist
(
	artistId INTEGER NOT NULL IDENTITY,
	artistName VARCHAR(50) NOT NULL,
	contactInfo VARCHAR(50) NOT NULL,
	specialRequest VARCHAR(200),
	CONSTRAINT PK_Artist PRIMARY KEY (artistId)
)

CREATE TABLE Performance_Artist
(
	performanceId INTEGER NOT NULL,
	artistId INTEGER NOT NULL,
	CONSTRAINT PK_PerformanceArtist PRIMARY KEY (performanceId, artistId),
	CONSTRAINT FK_PerformanceArtist_Performance FOREIGN KEY (performanceId) REFERENCES Performance (performanceId),
	CONSTRAINT FK_PerformanceArtist_Artist FOREIGN KEY (artistId) REFERENCES Artist (artistId)
)

CREATE TABLE Event_Performance
(
	eventId INTEGER NOT NULL,
	performanceId INTEGER NOT NULL,
	CONSTRAINT PK_EventPerformance PRIMARY KEY (eventId, performanceId),
	CONSTRAINT FK_EventPerformance_Event FOREIGN KEY (eventId) REFERENCES Event (eventId),
	CONSTRAINT FK_EventPerformance_Performance FOREIGN KEY (performanceId) REFERENCES Performance (performanceId)
)

CREATE TABLE Booking
(
	bookingId INTEGER NOT NULL IDENTITY,
	eventId INTEGER NOT NULL,
	bookingDate DATE NOT NULL,
	ticketQuantity INTEGER NOT NULL,
	bookingStatus VARCHAR(10) NOT NULL,
	memo VARCHAR(50),
	CONSTRAINT PK_Booking PRIMARY KEY (bookingId),
	CONSTRAINT FK_Booking_Event FOREIGN KEY (eventId) REFERENCES Event (eventId),
	CONSTRAINT CHK_Booking_bookingStatus CHECK (bookingStatus IN ('Booked', 'Paid'))
)

CREATE TABLE Ticket
(
	ticketId INTEGER NOT NULL,
	bookingID INTEGER NOT NULL,
	isRefunded VARCHAR(50),
	CONSTRAINT PK_Ticket PRIMARY KEY (ticketId, bookingId),
	CONSTRAINT FK_Ticket_Booking FOREIGN KEY (bookingId) REFERENCES Booking (bookingId),
	CONSTRAINT CHK_Ticket_isRefunded CHECK (isRefunded IN ('Yes'))
)