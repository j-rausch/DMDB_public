[Custom]

Let's create a custom database!

``
CREATE DATABASE custom OWNER postgres;
``{{execute}}

Create a schema using the following commands:

``
CREATE TABLE team(
    team_id SERIAL,
    team_name VARCHAR(30) NOT NULL,
    city_name VARCHAR(30),
    PRIMARY KEY (team_id));
``{{execute}}

``
CREATE TABLE referee(
    referee_id SERIAL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (referee_id));
``{{execute}}

``
CREATE TABLE game(
    game_date DATE NOT NULL,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    referee_id INT NOT NULL,
    PRIMARY KEY (game_date, home_team_id, away_team_id));
``{{execute}}

