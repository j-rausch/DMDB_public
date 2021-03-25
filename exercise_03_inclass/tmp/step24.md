[Employees] Imagine that there is a raffle in the company and the person with the most “followers” will get the prize. Each person ( P ) has another person (F) as follower if the first name of F and the last name of P start with the same three letters. Followers of F are also followers of P. If a person could be a follower to P on multiple “levels”, it is counted multiple times. Give the employee number of person P with the largest following when counting up to 3 levels of followers.

Hint: use the WITH clause.

What would happen to this query if we lifted the 3 level constraint and computed the whole following graph instead? Could it enter an infinite loop?

Example: P = John [Car]penter; F = [Car]ly Smith


-- Let us start by computing a single level of the "follow" relationship.
``
SELECT person.emp_no, COUNT(*)
FROM     employees person, employees follower
WHERE  SUBSTRING (follower.first_name, 1, 3) = SUBSTRING (person.last_name, 1, 3)
GROUP  BY person.emp_no
ORDER  BY COUNT DESC, emp_no;
``{{execute}}

-- Now let us compute the second level of the same relationship. This will list the followers of the followers of each person.
``
SELECT person.emp_no, COUNT(*)
FROM     employees person, employees follower1, employees follower2
WHERE  SUBSTRING (follower1.first_name, 1, 3) = SUBSTRING (person.last_name, 1, 3)
                AND SUBSTRING (follower2.first_name, 1, 3) = SUBSTRING (follower1.last_name, 1, 3)
GROUP  BY person.emp_no
ORDER  BY COUNT DESC, emp_no;
``{{execute}}


-- Now in order to get all the followers for the up to 2 levels for each person we need to union the followers on the 1st level and the 2nd level and count them.
``
WITH first_level AS (
SELECT	person.emp_no, follower.last_name
FROM     employees person, employees follower
WHERE  SUBSTRING (follower.first_name, 1, 3) = SUBSTRING (person.last_name, 1, 3) 
),
second_level AS (
SELECT follower.emp_no, follower2.last_name
FROM     first_level follower, employees follower2
WHERE  SUBSTRING (follower2.first_name, 1, 3) = SUBSTRING (follower.last_name, 1, 3) 
)
SELECT emp_no, COUNT(*)
FROM    (
SELECT * FROM first_level
UNION ALL
SELECT * FROM second_level
) a
GROUP  BY emp_no
ORDER  BY count DESC;
``{{execute}}


-- Similarly, we can formulate a recursive query to be able to change the depth.
``
WITH RECURSIVE enames AS (
SELECT	last_name, emp_no, 0 AS lev FROM	employees
UNION ALL
(
SELECT	follower.last_name, person.emp_no, lev + 1
FROM    employees follower
JOIN       enames person ON SUBSTRING(follower.first_name, 1,3) = SUBSTRING(person.last_name, 1,3)
               AND lev <= 2
) 
)
SELECT emp_no, COUNT(*) - 1 AS cnt
FROM    enames
GROUP  BY emp_no
ORDER  BY cnt DESC, emp_no;
``{{execute}}


-- We keep the followers' last names in the working table in order to be able to reference it in the consecutive iterations. Additionally, we propagate the original persons employee number to be able to count their followers. And finally, we accumulate the level variable to limit the depth. Since we are in essence computing a transitive closure on this data, if there is a circle in the person's names the recursive query will never return unless we limit the depth to which it can go.