const express = require('express')
const db = require('./db')
let app = express();
const mustacheExpress = require('mustache-express');

app.engine('mustache', mustacheExpress());


app.set('view engine', 'mustache');

app.get('/', (req, res, next) => {
  db.query('SELECT * FROM runner', [], (err, results) => {
    if(err) {
      return next(err);
    }
    res.render({runners: results.rows});
  });
});
app.listen(3000, () => {
  console.log('ready set go!');
});
