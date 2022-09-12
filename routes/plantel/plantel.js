var express = require("express");
var router = express.Router();
var jugadoresModels = require("./../../models/jugadoresModels");
var util = require("util");
var cloudinary = require("cloudinary").v2;
var uploader = util.promisify(cloudinary.uploader.upload);
var destroy = util.promisify(cloudinary.uploader.destroy);


/* GET a PLANTEL Page */

router.get("/", async function(req, res, next) {

  var jugadores = await jugadoresModels.mostrarJugadores();
  
  jugadores = jugadores.map(jugador => {
    if (jugador.id_img_jugador) {
      const imagen_jugador = cloudinary.image(jugador.id_img_jugador, {
        width: 160,
        height: 160,
        crop: "fill"
      });
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
  })

  res.render("plantel/plantel.hbs", {
    nombre: req.session.nombre,
    jugadores
  })
})


/* GET y POST para INCORPORAR jugador */

// GET:

router.get("/incorporar", async function (req, res, next) {
  res.render("plantel/incorporar.hbs", {
    nombre: req.session.nombre
  })
})

// POST:

router.post("/incorporar", async function (req, res, next) {
  try {
    var id_img_jugador = "";
    if (req.files && Object.keys(req.files).length > 0) {
      imagen_jugador = req.files.imagen_jugador;
      id_img_jugador = (await uploader(imagen_jugador.tempFilePath)).public_id;
    }

    if (req.body.nombre != "" && req.body.apellido != "" && req.body.edad != "" && req.body.posicion != "" && req.body.club != "") {
      await jugadoresModels.incorporarJugador({
        ...req.body,
        id_img_jugador
      });
      res.redirect("/admin/plantel")
    }
    else {
      res.render("plantel/incorporar", {
        error: true,
        message: "Todos los campos son requeridos."
      })
    }
  }
  catch (error) {
    res.render("plantel/incorporar", {
      error: true,
      message: "No se pudo incorporar el jugador. Por favor inténtelo de nuevo."
    })
  }
})


/* GET y POST para MODIFICAR jugador */

// GET:

router.get("/modificar/:id", async function (req, res, next) {
  let id = req.params.id;
  let jugador = await jugadoresModels.captarJugadorPorId(id);

  res.render("plantel/modificar", {
    nombre: req.session.nombre,
    jugador
  });
})

// POST:

router.post("/modificar", async function (req, res, next) {
  try {
    let id_img_jugador = req.body.img_original;
    let borrar_img_vieja = false;

    if (req.body.img_delete === "1") {
      id_img_jugador = null;
      borrar_img_vieja = true;
    }
    else {
      if (req.files && Object.keys(req.files).length > 0) {
        imagen_jugador = req.files.imagen_jugador;
        id_img_jugador = (await uploader(imagen_jugador.tempFilePath)).public_id;
        borrar_img_vieja = true;
      }
    }

    if (borrar_img_vieja && req.body.img_original) {
      await(destroy(req.body.img_original));
    }

    let nuevoObjeto = {
      nombre: req.body.nombre,
      apellido: req.body.apellido,
      edad: req.body.edad,
      posicion: req.body.posicion,
      club: req.body.club,
      id_img_jugador
    }

    await jugadoresModels.modificarJugador(nuevoObjeto, req.body.id);
    res.redirect("/admin/plantel");
  }

  catch (error) {
    res.render("plantel/modificar", {
      error: true,
      message: "No se pudo modificar el jugador. Por favor, inténtelo de nuevo."
    })
  }
})


/* GET para BORRAR jugador */

router.get("/borrar/:id", async function (req, res, next) {
  let id = req.params.id;

  let jugador = await jugadoresModels.captarJugadorPorId(id);

  if (jugador.id_img_jugador) {
    await(destroy(jugador.id_img_jugador));
  }

  await jugadoresModels.borrarJugador(id);
  res.redirect("/admin/plantel")
})

module.exports = router;