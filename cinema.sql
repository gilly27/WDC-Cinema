CREATE TABLE customers (
    customer_id INTEGER NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) DEFAULT NULL,
    password_hash NOT NULL,
    PRIMARY KEY (userID)
);

CREATE TABLE bookings (
    booking_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    customer_id INTEGER UNSIGNED NOT NULL
    screening_id INTEGER UNSIGNED NOT NULL,
    seat_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id), ON DELETE CASCADE
    FOREIGN KEY(screening_id) REFERENCES screenings(screening_id),
    FOREIGN KEY(seat_id) REFERENCES seats(seat_id)
);

CREATE TABLE screenings (
    screening_id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    movie_id SMALLINT NOT NULL
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id)
);

CREATE seats (
    seat_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    available TINYINT UNSIGNED NOT NULL,
    seat_row VARCHAR(1) NOT NULL,
    seat_number TINYINT UNSIGNED NOT NULL
    screening_id INTEGER UNSIGNED NOT NULL,
    FOREIGN KEY(screening_id) REFERENCES screenings(screening_id)
);

CREATE TABLE movies (
    movie_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    movie_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (movie_id)
);

/*TEST INPUTS*/

INSERT INTO customer (customer_id, first_name, last_name, email, password_hash)
(1, 'Edward', 'Gilchrist', 'Ed@email.com', 'password'),
(2, 'John', 'Smith', 'John@email.com', 'password'),
(2, 'Jane', 'Doe', 'Jane@email.com', 'password');

INSERT INTO bookings (booking_id, customer_id, screening_id, seat_id)
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 1, 3),
(1, )
