--CREATING INDEX

CREATE INDEX ix_eventDate ON Event (eventDate);

CREATE INDEX ix_bookingDate ON Booking (bookingDate);

CREATE INDEX ix_bookingStatus ON Booking (bookingStatus);

CREATE INDEX ix_artistName ON Artist (artistName);