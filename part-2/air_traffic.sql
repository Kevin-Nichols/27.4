-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (
  airline_id SERIAL PRIMARY KEY,
  airline_name TEXT
);

CREATE TABLE cities (
  city_id SERIAL PRIMARY KEY,
  city_name TEXT
);

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY,
  country_name TEXT
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airlines (airline_id),
  from_city_id INT REFERENCES cities (city_id),
  from_country_id INT REFERENCES countries (country_id),
  to_city_id INT REFERENCES cities (city_id),
  to_country_id INT REFERENCES countries (country_id)
);

INSERT INTO airlines (airline_name) VALUES ('United');
INSERT INTO airlines (airline_name) VALUES ('British Airways');
INSERT INTO airlines (airline_name) VALUES ('Delta');
INSERT INTO airlines (airline_name) VALUES ('TUI Fly Belgium');
INSERT INTO airlines (airline_name) VALUES ('Air China');
INSERT INTO airlines (airline_name) VALUES ('American Airlines');
INSERT INTO airlines (airline_name) VALUES ('Avianca Brasil');

INSERT INTO cities (city_name) VALUES ('Washington DC');
INSERT INTO cities (city_name) VALUES ('Seattle');
INSERT INTO cities (city_name) VALUES ('Tokyo');
INSERT INTO cities (city_name) VALUES ('London');
INSERT INTO cities (city_name) VALUES ('Los Angeles');
INSERT INTO cities (city_name) VALUES ('Las Vegas');
INSERT INTO cities (city_name) VALUES ('Mexico City');
INSERT INTO cities (city_name) VALUES ('Paris');
INSERT INTO cities (city_name) VALUES ('Casablanca');
INSERT INTO cities (city_name) VALUES ('Dubai');
INSERT INTO cities (city_name) VALUES ('Beijing');
INSERT INTO cities (city_name) VALUES ('New York');
INSERT INTO cities (city_name) VALUES ('Charlotte');
INSERT INTO cities (city_name) VALUES ('Cedar Rapids');
INSERT INTO cities (city_name) VALUES ('Chicago');
INSERT INTO cities (city_name) VALUES ('New Orleans');
INSERT INTO cities (city_name) VALUES ('Sao Paolo');
INSERT INTO cities (city_name) VALUES ('Santiago');

INSERT INTO countries (country_name) VALUES ('United States');
INSERT INTO countries (country_name) VALUES ('Japan');
INSERT INTO countries (country_name) VALUES ('United Kingdom');
INSERT INTO countries (country_name) VALUES ('Mexico');
INSERT INTO countries (country_name) VALUES ('France');
INSERT INTO countries (country_name) VALUES ('Morocco');
INSERT INTO countries (country_name) VALUES ('UAE');
INSERT INTO countries (country_name) VALUES ('China');
INSERT INTO countries (country_name) VALUES ('Brazil');
INSERT INTO countries (country_name) VALUES ('Chile');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),

  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),

  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),

  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),

  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),

  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),

  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),

  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),

  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),

  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);