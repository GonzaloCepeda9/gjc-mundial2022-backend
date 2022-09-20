var express = require("express");
var router = express.Router();
var novedadesModel = require("./../models/novedadesModels");
var jugadoresModel = require("./../models/jugadoresModels");
var cloudinary = require("cloudinary").v2;

router.get("/novedades", async function (req, res, next) {
  let novedades = await novedadesModel.obtenerNovedades();

  novedades = novedades.map(novedades => {
    if (novedades.id_img_novedad) {
      const imagen = cloudinary.url(novedades.id_img_novedad, {
        width: 960,
        height: 500,
        crop: "fill"
      })
      return {
        ...novedades,
        imagen
      }
    }
    else {
      return {
        ...novedades,
        imagen: ""
      }
    }
  });

  res.json(novedades);
});


router.get("/plantel", async function (req, res, next) {
  let jugadores = await jugadoresModel.mostrarJugadores();

  jugadores = jugadores.map(jugador => {
    if (jugador.id_img_jugador) {
      const imagen_jugador = cloudinary.url(jugador.id_img_jugador, {
        width: 200,
        height: 200,
        crop: "fill"
      })
      return {
        ...jugador,
        imagen_jugador
      }
    }
    else {
      return {
        ...jugador,
        imagen_jugador: ""
      }
    }
  });

  res.json(jugadores);

});

module.exports = router;