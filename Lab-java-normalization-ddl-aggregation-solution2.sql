### Exercise 2
CREATE DATABASE lab_java_normalization_ddl2;

USE lab_java_normalization_ddl2;


CREATE TABLE airline(id int primary key AUTO_INCREMENT,
                     customer_id int NOT NULL,
                     booking_id int not null,
                     flight_id int not null,
                     aircraft_id int not null,
                     status_id int not null,
                     mileage_id int not null,
                     total_mileage_id int not null,
                     total_seat_id int not null,
                     FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
                     FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
                     FOREIGN KEY (flight_id) REFERENCES flight(flight_id),
                     FOREIGN KEY (aircraft_id) REFERENCES aircraft(aircraft_id),
                     FOREIGN KEY (status_id) REFERENCES status(status_id),
                     FOREIGN KEY (mileage_id) REFERENCES mileage(mileage_id),
                     FOREIGN KEY (total_mileage_id) REFERENCES total_mileage(total_mileage_id),
                     FOREIGN KEY (total_seat_id) REFERENCES total_seat(total_seat_id)
);

CREATE TABLE customer(
                         customer_id int primary key,
                         customer_name varchar(30),
                         status varchar(20),
                         total_mileage int not null
);

CREATE TABLE booking(
                        booking_id int primary key,
                        customer_id int,
                        flight_number varchar(10)
);

CREATE TABLE flight(
                       flight_id int PRIMARY KEY,
                       flight_number varchar(15),
                       flight_mileage int
);

CREATE TABLE aircraft(
                         aircraft_id int primary key,
                         aircraft_name varchar(20),
                         total_aircraft_seats int not null
);

CREATE TABLE status(
                       status_id int primary key,
                       status varchar(10)
);

CREATE TABLE mileage(
                        mileage_id int primary key,
                        mileage_number int not null
);

CREATE TABLE total_mileage(
                              total_mileage_id int PRIMARY KEY,
                              total_mileage int
);

CREATE TABLE total_seat(
                           total_seat_id int PRIMARY KEY,
                           total_seat int
);

INSERT INTO airline VALUES
                        (1, 1, 1, 1, 1, 2, 1, 1, 1),
                        (2, 1, 1, 1, 1, 2, 1, 1, 1),
                        (3, 1, 1, 1, 1, 2, 1, 1, 1),
                        (4, 1, 1,1, 1,  2,  1, 1,1),
                        (5, 1, 1, 1, 1, 2, 1, 1, 1),
                        (6,2,  2, 2,2, 3, 2, 2, 2),
                        (7,3,  2,2, 2, 1, 2, 3, 3),
                        (8,3,  3, 3, 3, 1, 3,3, 3),
                        (9,3,  4, 4, 3, 1, 4,3, 3),
                        (10,4, 1, 1, 1, 3, 1, 4, 1),
                        (11,4, 1, 1, 1, 3, 1, 4, 1),
                        (12, 4, 5, 5, 1, 3, 5, 4,1),
                        (13, 5, 1, 1, 1, 2, 1, 5, 1),
                        (14, 5, 2, 2, 2, 2, 2, 5, 1),
                        (15, 6, 4, 4, 3, 2, 4, 6, 3),
                        (16, 7, 4, 4, 3, 1, 4, 7, 3),
                        (17, 8, 4, 4, 3, 2, 4, 8, 3);

INSERT INTO customer VALUES (1, 'Agustine Riviera', 'Silver', 115235),
                            (2, 'Alaina Sepulvida','None', 6008 ),
                            (3, 'Tom Jones','Gold', 205767),
                            (4, 'Sam Rio', 'None', 2653),
                            (5, 'Jessica James', 'Silver',127656),
                            (6, 'Ana Janco', 'Silver', 136773),
                            (7, 'Jennifer Cortez', 'Gold', 300582),
                            (8, 'Christian Janco', 'Silver',14642 );

INSERT INTO status VALUES (1, 'Gold'),
                          (2, 'Silver'),
                          (3, 'None');

INSERT INTO mileage VALUES (1, 135),
                           (2, 4370),
                           (3, 2078),
                           (4, 1765),
                           (5, 531);

INSERT INTO total_mileage VALUES (1, 115235),
                                 (2, 6008),
                                 (3, 205767),
                                 (4, 2653),
                                 (5, 127656),
                                 (6, 136773),
                                 (7, 300582),
                                 (8, 14642);

INSERT INTO booking VALUES (1, 1, 'DL143'),
                           (2, 2, 'DL122'),
                           (3, 3, 'DL53'),
                           (4, 4, 'DL222'),
                           (5, 5, 'DL37');


INSERT INTO flight VALUES(1, 'DL143',  135),
                         (2, 'DL122', 4370),
                         (3, 'DL53',  2078),
                         (4, 'DL222', 1765),
                         (5, 'DL37',  531);

INSERT INTO aircraft VALUES(1, 'Boeing 747',400),
                           (2, 'Airbus 330',236),
                           (3, 'Boeing 777',264);

INSERT INTO total_seat VALUES(1, 400),
                             (2, 236),
                             (3, 264);


# SELECT * FROM booking;
# SELECT * FROM airline;

## EXERCISE 3
SELECT COUNT(DISTINCT flight_number) FROM flight;
SELECT AVG(flight_mileage) FROM flight;
SELECT AVG(total_aircraft_seats) FROM aircraft;
SELECT status, AVG(total_mileage) FROM customer GROUP BY status;
SELECT status, MAX(total_mileage) FROM customer GROUP BY status;
SELECT COUNT(*) FROM aircraft WHERE aircraft_name LIKE '%Boeing%';
SELECT * FROM flight WHERE flight_mileage BETWEEN 300 AND 2000;
SELECT c.status, AVG(flight_mileage)
FROM booking b
         JOIN customer c ON b.customer_id = c.customer_id
         JOIN flight f ON b.flight_number = f.flight_number
GROUP BY c.status;

SELECT a.aircraft_name, COUNT(*) AS total_bookings
FROM booking b
         JOIN customer c ON b.booking_id = c.customer_id
         JOIN flight f ON b.flight_number = f.flight_number
         JOIN aircraft a ON f.flight_id = a.aircraft_id
WHERE c.status = 'Gold'
GROUP BY a.aircraft_name
ORDER BY total_bookings DESC
    LIMIT 1;