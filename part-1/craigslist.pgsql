DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE regions(
    region_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    region_pref INTEGER REFERENCES regions (region_id)
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    category_id INTEGER REFERENCES categories (category_id),
    user_id INTEGER REFERENCES users (user_id),
    location TEXT,
    region_id INTEGER REFERENCES regions (region_id)
);

INSERT INTO categories (name) VALUES ('guitars');
INSERT INTO categories (name) VALUES ('bicycles');
INSERT INTO categories (name) VALUES ('electronics');

INSERT INTO regions (name) VALUES ('charleston');


INSERT INTO users (username, password, region_pref) VALUES ('Whac', 'guitarguy14', 1);
INSERT INTO users (username, password, region_pref) VALUES ('MTBFreak', 'rubbersidedown', 1);

INSERT INTO posts (title, description, category_id, user_id, location, region_id) VALUES ('2008 Gibson Les Paul', 'Lightly played, one scratch on the back.', 1, 1, 'Mount Pleasant', 1);
INSERT INTO posts (title, description, category_id, user_id, location, region_id) VALUES ('2022 Revel Rascal', 'Well maintained, upgraded tires and drivetrain.', 2, 2, 'Summerville', 1);
INSERT INTO posts (title, description, category_id, user_id, location, region_id) VALUES ('LG OLED TV', '55in stand included.', 3, 1, 'James Island', 1);