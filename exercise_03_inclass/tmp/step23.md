[Employees] Imagine that there is a raffle in the company and the person with the most “followers” will get the prize. Each person ( P ) has another person (F) as follower if the first name of F and the last name of P start with the same three letters. Followers of F are also followers of P. If a person could be a follower to P on multiple “levels”, it is counted multiple times. Give the employee number of person P with the largest following when counting up to 3 levels of followers.

Hint: use the WITH clause.

What would happen to this query if we lifted the 3 level constraint and computed the whole following graph instead? Could it enter an infinite loop?

Example: P = John [Car]penter; F = [Car]ly Smith