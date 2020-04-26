# README

## SETUP
- Create the postgres user ```createuser open_graph -W -s``` then type password1
- Create database ```rake db:setup```
- Start the server ```rails server```
- Open app in browser at url localhost:3000


## TODO Before Production Ready
- Action cable requires redis for production
- Make the api and client handle errors in a more robust way. Errors that come to mind include validation errors and database connection errors.
- Fully unit test the app and api.
