#### Installing a DBMS

The tutorial should install and start a Postgres server automatically (inside
docker). Once the installation completes, we have two ways to connect to the
server. The first is the official client:

Please note that we automatically execute the installations in this tutorial.

`psql.sh -U postgres`{{execute}}

Let's just confirm that we are indeed connected:

`\c`{{execute}}

Then quit the client again:

`\q`{{execute}}


The second is an inofficial client with a few nice features (inside docker as
well):

`pgcli.sh -h postgres-server -u postgres`{{execute}}


Let's run a script which creates and populates the necessary databases (on the Postgres server running in our docker image).

`populate.sh`{{execute}}


Now we are connected to our DBMS, we can use the following command to *list* all existing database instances:

``\l``{{execute}}


#### Querying
The questions in the exercises each refer to one of the three datasets we have created databases for.

To run queries on the datasets, we *connect* to them as follows:

##### Employees


``\c employee``{{execute}}

We can now run queries on the connected dataset. For example, to return employee's first names:

``
SELECT e.first_name
FROM employees e
LIMIT 5;
``{{execute}}

##### TPC-H and ZVV

We can use the same command to connect to the TPC-H dataset:

``\c tpch``{{execute}}

and the ZVV dataset:

``\c zvv``{{execute}}

Using the command line interface, we can now run and test different SQL queries 
that are discussed in the exercise.



