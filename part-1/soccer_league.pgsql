DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    name TEXT,
    team_id INTEGER REFERENCES teams (team_id)
);

CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    location TEXT,
    match_date DATE,
    home_team_id INTEGER REFERENCES teams (team_id),
    guest_team_id INTEGER REFERENCES teams (team_id),
    season_id INTEGER REFERENCES seasons (season_id),
    referee_id INTEGER REFERENCES referees (referee_id)
);

CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (player_id),
    match_id INTEGER REFERENCES matches (match_id),
    goals_scored INTEGER
);

CREATE TABLE standings (
    standing_id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams (team_id),
    match_id INTEGER REFERENCES matches (match_id),
    result TEXT
);

INSERT INTO seasons (start_date, end_date) VALUES ('2021-07-13', '2022-05-22');
INSERT INTO seasons (start_date, end_date) VALUES ('2022-07-06', '2023-05-28');

INSERT INTO teams (name) VALUES ('Manchester United');
INSERT INTO teams (name) VALUES ('Arsenal');

INSERT INTO players (name, team_id) VALUES ('Marcus Rashford', 1);
INSERT INTO players (name, team_id) VALUES ('Antony Santos', 1);
INSERT INTO players (name, team_id) VALUES ('Charlie McNiel', 1);
INSERT INTO players (name, team_id) VALUES ('Bukayo Saka', 2);
INSERT INTO players (name, team_id) VALUES ('Reiss Nelson', 2);
INSERT INTO players (name, team_id) VALUES ('Amario Cozier-Duberry', 2);

INSERT INTO referees (name) VALUES ('Michael Oliver');
INSERT INTO referees (name) VALUES ('Graham Scott');
INSERT INTO referees (name) VALUES ('Paul Tierney');

INSERT INTO matches (location, match_date, home_team_id, guest_team_id, season_id, referee_id) VALUES ('Old Trafford', '2022-09-04', 1, 2, 2, 3);

INSERT INTO goals (player_id, match_id, goals_scored) VALUES (1, 1, 2);
INSERT INTO goals (player_id, match_id, goals_scored) VALUES (2, 1, 1);
INSERT INTO goals (player_id, match_id, goals_scored) VALUES (4, 1, 1);

INSERT INTO standings (team_id, match_id, result) VALUES (1, 1, 'Win');
INSERT INTO standings (team_id, match_id, result) VALUES (2, 1, 'Loss');