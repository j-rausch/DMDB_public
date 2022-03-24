[Custom]

Part 1.

Now let's alter some of the relations we just made.

1. Add a nullable column short_name to the team relation. Its values should not be longer than 3 characters:

``
ALTER TABLE team ADD short_name VARCHAR(3);
``{{execute}}

2. Change the type of short_name to a string up to 5 characters.

``
ALTER TABLE team ALTER short_name TYPE VARCHAR (5);
``{{execute}}

3. Remove the created column.

``
ALTER TABLE team DROP short_name;
``{{execute}}

