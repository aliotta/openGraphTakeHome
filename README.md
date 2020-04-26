# README

## ABOUT
- This app can be used to test and preview an Open Graph image from any given URL. Facebook’s Open Graph protocol, https://ogp.me/, is a standard that enables web pages to be displayed richly on most major social media platforms.

## APPROACH
- The app is written with a rails backend supported by a postgres database. The client is written in jquery and uses the rails Action cable library to make its requests asynchronous. To do this the client sends a http POST request with the url to be stored and retrived. The server spins up a thread to process the image and imediatly replies back to the client that the request has been recieved. The client listens on the Action cable websocket channel for updates around the success or failure of the processing process. On success the image is added to the page and on failure the user is alerted.

## TODO Before Production Ready
- Action cable requires redis for production
- Make the api and client handle errors in a more robust way. Errors that come to mind include validation errors and database connection errors.
- Fully unit test the app and api.
- Handle socket disconnections (possibly implement a reconnect strategy)
- Improve the UI both in the happpy and unhappy paths e.g. errors should not be reported by javascript alerts.


## SETUP
- Create the postgres user ```createuser open_graph -W -s``` then type password1
- Create database ```rake db:setup```
- Start the server ```rails server```
- Open app in browser at url localhost:3000


