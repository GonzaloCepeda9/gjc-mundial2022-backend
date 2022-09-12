var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var fileUpload = require("express-fileupload");
var cors = require("cors");

require("dotenv").config(); // Base de datos
var session = require("express-session");

var indexRouter = require('./routes/index');
var loginRouter = require("./routes/admin/login");
var plantelRouter = require("./routes/plantel/plantel");
var novedadesRouter = require("./routes/novedades/novedades");
const apiRouter = require("./routes/api");

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// Variable de sesion (se escribe antes del app.use)
app.use(session({
  secret: "Mundial2022",
  cookie: { maxAge: null },
  resave: false,
  saveUninitialized: true
}));

secured = async function (req, res, next) {
  try {
    console.log(req.session.identificador);
    if (req.session.identificador) { // Si id_usuario es verdadero (es decir, el usuario está registrado en la base de datos)...
      next();                     // Pasamos a lo siguiente
    }
    else {
      res.redirect("/admin/login");
    }
  }
  catch (error) {
    console.log(error);
  }
};

app.use(fileUpload ({
  useTempFiles: true,
  tempFileDir: "/tmp/"
}));


app.use("/", indexRouter);
app.use("/admin/login", loginRouter);
app.use("/admin/plantel", secured, plantelRouter);
app.use("/admin/novedades", secured, novedadesRouter);
app.use("/api", cors(), apiRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
