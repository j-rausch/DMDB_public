[Employee2]

**WARNING**: 
> Altering a database could invalidiate the previous exercises. 
> Make sure you *are done* with them, and in doubt, duplicate the database (only when it's small) :)

``
CREATE DATABASE employee2
WITH TEMPLATE employee
OWNER postgres;
``{{execute}}

``
ALTER TABLE salaries ALTER COLUMN to_date DROP NOT NULL;
``{{execute}}

Now we can replace 9999 dates with NULL.

``
UPDATE salaries SET to_date = NULL WHERE EXTRACT(YEAR FROM to_date) = 9999;
``{{execute}}

