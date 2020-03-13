
#### Create a Database

Now we are connected to our DBMS, we can use the following
command to list all existing database instances:

``\l``{{execute}}

We see that there are three databaes instances already
there. 
We now create the three databases that are used during the exercises.

``CREATE DATABASE employee;``{{execute}}

``CREATE DATABASE zvv;``{{execute}}

``CREATE DATABASE tpch;``{{execute}}

Now let's run `\l` again

``\l``{{execute}}

and we can see that we now have added three new database instances.


