This is typically one of the longest lectures, so I'll try to condense it.
If you have a question, write it down. Remember the lecture etiquette.

# Overview of Week and Learning Goals
The point of this week is to learn how to use, query databases. Today we'll be working in SQL, then we'll learn how to map SQL to Ruby, and finally, how to use ActiveRecord to write queries.

# 5 Minute code demo first, no questions
+ Backward approach, in order to "see" what it looks like first, then learn the syntax.
+ First show what the flow will look like, no questions since it will all be explained.

Maybe start with firing up postgresql. Show that those are my databases,
like excel sheets. Do half the code demo first!!! I could also have an excel sheet pulled up of what the information looks like. Walk through the homework and show them.

Make my own database table called food. food id, type, calories. humans.
joins table who ate what.

Ok, this is great we can see it in terminal, but what if I want to do this from my ruby files?

# Code Demo file
So if I have a table called Food. I want to execute a SQL query. Well if I write my query, it'll eventually get really long. How can I write multi-line strings in Ruby? Something called a heredoc.



Note that postgresql must be running, so if you get an error, check its running.


psql postgres
postgres=# \du -> gets the users

sqlzoo will be the one they make.
