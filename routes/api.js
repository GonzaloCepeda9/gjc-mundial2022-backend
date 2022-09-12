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

router.post("/contacto", async (req, res) => {
  const mail = {
    to: "gjcepeda9@gmail.com",
    subject: "Contacto Web",
    html: `${req.body.nombre} se contactó a través de la web y quiere más información a este correo: ${req.body.correo}. <br> Además, hizo el siguiente comentario: ${req.body.mensaje}.`
  }

  const transport = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    auth: {
      user: process.env.SMTP_USER,
      pass: process.env.SMPT_PASS
    }
  });

  await transport.sendMail(mail)

  res.status(201).json({
    error: false,
    message: "Mensaje Enviado"
  });
  
});

module.exports = router;