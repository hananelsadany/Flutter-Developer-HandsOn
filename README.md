

I made a design for project which holds the actual implementation for the separation of database and remote request away from the widget, as they live in separate as [ UI - State - Repo - Model - Database ] . 

and a result of this separation , a repo model was created, to hold the implementation of dealing with data. 

inside the repo file i made a get function which - same as the pdf - apply offline first behaviour . 

and as a part from remote requests i handled the error using a mapper . 

all of this also deal with a drift table local database, which is injected using a database provider to the repo offline model to ensure we have offline support. 
