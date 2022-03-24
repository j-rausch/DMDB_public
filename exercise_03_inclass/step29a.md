[Custom]

Assume that all tables are empty, i.e. the following statements have been executed:

``
DELETE FROM team;
DELETE FROM referee;
DELETE FROM game;
``{{execute}}

Which of the following will execute correctly on the empty database.

1.
``
INSERT INTO team (team_id, team_name) VALUES (0, 'a'), (3, 'b'), (5, 'c');
``{{execute}}

2.
``
INSERT INTO referee (first_name) VALUES ('John');
``{{execute}}

3.
``
INSERT INTO team (team_name) VALUES ('x'), ('y');
INSERT INTO game (game_date, home_team_id, away_team_id, referee_id) VALUES (NOW(), 0, 1, 1337);
DELETE FROM team WHERE team_id = 0;
``{{execute}}

4.
``
INSERT INTO team (team_name) VALUES ('Real Madrid C.F.');
UPDATE team SET city_name='Barcelona' WHERE  team_name = 'FC Barcelona';
``{{execute}}

5.
``
INSERT INTO referee (first_name, last_name) VALUES ('Jane', 'Smith');
INSERT INTO referee (first_name, last_name) VALUES ('Jane', 'Smith');
``{{execute}}

6.
``
INSERT INTO game (game_date, home_team_id, away_team_id, referee_id)
VALUES ('1307-10-13', 123, 321, 0), ('1307-10-13', 123, 321, 1);
``{{execute}}



1. Correct
2. -
3. Correct
4. Correct
5. Correct
6. -

