# RANK!

This project is intended to be the backend service of a mobile social application. The users get points by being friends with more people, an additional points is given if you are in the top 10. The higher you are on others list the more points you get, the more gifts you take.

At the end of each month a top score board is displayed to show the winners.


## Running the application

First clone the application: `git clone https://github.com/wael34218/rank.git`

Install required packages: `bundle install`

Change database configuration in : `config/database.yml`

Setup your database with schema and seed it with basic data : `db:setup`

Run the server : `rails s -b 127.0.0.1`

## Testing

To run the automated tests run : `rake test:integration`

This will automatically generate API documentation for the entire application. The API docs are mounted on `/api_docs` route.

To regenerate the API documents use the following commands:
* `rm doc/api/*`: To clear out previous apis
* `rake TESTOPTS="--seed=60313" test:integration`: Generate new APIs

## Database

An ERD diagram is shown in the pdf : `erd.pdf`

