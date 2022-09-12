var express = require("express");
var router = express.Router();
var novedadesModels = require("./../../models/novedadesModels");
var util = require("util");
var cloudinary = require("cloudinary").v2;
var uploader = util.promisify(cloudinary.uploader.upload);
var destroy = util.promisify(cloudinary.uploader.destroy);

/* GET a página de NOVEDADES */

router.get("/", async function(req, res, next) {

  var novedades = await novedadesModels.obtenerNovedades();

  novedades = novedades.map(novedad => {
    if (novedad.id_img_novedad) {
      const imagen = cloudinary.image(novedad.id_img_novedad, {
        width: 200,
        height: 100,
        crop: "fill"
      });
      return {
        ...novedad,
        imagen
      }
    }
    else {
      return {
        ...novedad,
        imagen: ""
      }
    }
  })

  res.render("novedades/novedades.hbs", {
    nombre: req.session.nombre,
    novedades
  })
})


/* GET y POST para AGREGAR novedad */

// GET:

router.get("/agregar", async function (req, res, next) {
  res.render("novedades/agregar.hbs", {
    nombre: req.session.nombre
  })
})

// POST:

router.post("/agregar", async function (req, res, next) {
  try {
    var id_img_novedad = "";
    if (req.files && Object.keys(req.files).length > 0) {
      imagen = req.files.imagen;
      id_img_novedad = (await uploader(imagen.tempFilePath)).public_id;
    }

    // console.log(req.body);
    if (req.body.titulo != "" && req.body.subtitulo != "" && req.body.cuerpo != "") {
      await novedadesModels.agregarNovedad({
        ...req.body,
        id_img_novedad
      });
      res.redirect("/admin/novedades");
    }
    else {
      res.render("novedades/agregar", {
        error: true,
        message: "Todos los campos son requeridos."
      })
    }
  }
  catch (error) {
    res.render("novedades/agregar", {
      error: true,
      message: "No se pudo cargar la novedad. Por favor inténtelo de nuevo."
    })
  }
})


/* GET y POST para EDITAR novedad */

// GET:

router.get("/editar/:id", async function (req, res, next) {
  let id = req.params.id;
  let novedad = await novedadesModels.obtenerNovedadPorId(id);

  res.render("novedades/editar", {
    nombre: req.session.nombre,
    novedad
  });
})

// POST:

router.post("/editar", async function (req, res, next) {
  try {
    let id_img_novedad = req.body.img_original;
    let borrar_img_vieja = false;

    if (req.body.img_delete === "1") {
      id_img_novedad = null;
      borrar_img_vieja = true;
    }
    else {
      if (req.files && Object.keys(req.files).length > 0) {
        imagen = req.files.imagen;
        id_img_novedad = (await uploader(imagen.tempFilePath)).public_id;
        borrar_img_vieja = true;
      }
    }

    if (borrar_img_vieja && req.body.img_original) {
      await(destroy(req.body.img_original));
    }

    let nuevoObjeto = {
      titulo: req.body.titulo,
      subtitulo: req.body.subtitulo,
      cuerpo: req.body.cuerpo,
      id_img_novedad
    }

    await novedadesModels.editarNovedad(nuevoObjeto, req.body.id);
    res.redirect("/admin/novedades");
  }

  catch (error) {
    res.render("novedades/editar", {
      error: true,
      message: "No se pudo editar la novedad. Por favor, inténtelo de nuevo."
    })
  }
})


/* GET para ELIMINAR novedad */

router.get("/eliminar/:id", async function (req, res, next) {
  let id = req.params.id;

  let novedad = await novedadesModels.obtenerNovedadPorId(id);
  
  if (novedad.id_img_novedad) {
    await(destroy(novedad.id_img_novedad));
  }

  await novedadesModels.eliminarNovedad(id);
  res.redirect("/admin/novedades");
})

module.exports = router;