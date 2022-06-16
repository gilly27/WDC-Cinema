CREATE TABLE users (
    userID varchar(20)  NOT NULL,
    firstName varchar(20) NOT NULL,
    lastName varchar(20) NOT NULL,
    email NOT NULL,
    passwordHash NOT NULL,
);

CREATE TABLE screenings (
    screeningID
    startTime datetime
    endTime datetime
    movieID
    seatID
    userID
);

CREATE TABLE movies (
    movieName
);

CREATE seats (
    available
    seatRow
    seatNumber
);