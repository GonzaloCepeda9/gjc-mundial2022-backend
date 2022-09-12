var pool = require("./bd");

/* Función para MOSTRAR novedades */

async function obtenerNovedades () {
  var query = "select * from novedades order by id_novedad desc";
  var rows = await pool.query(query);
  return rows;
}

/* Función para AGREGAR novedades */

async function agregarNovedad (objeto) {
  try {
    var query = "insert into novedades set ?";
    var rows = await pool.query(query, [objeto]);
    return rows;
  }
  catch (error) {
    console.log(error);
    throw error;
  }
}

/* Funciones para EDITAR novedades */

async function obtenerNovedadPorId (id) {
  var query = "select * from novedades where id_novedad = ?";
  var rows = await pool.query(query, [id]);
  return rows[0];
}

async function editarNovedad (objeto, id) {
  try {
    var query = "update novedades set ? where id_novedad = ?";
    var rows = await pool.query(query, [objeto, id]);
    return rows;
  }
  catch (error) {
    console.log(error);
    throw error;
  }
}

/* Función para ELIMINAR novedades */

async function eliminarNovedad (id) {
  var query = "delete from novedades where id_novedad = ?";
  var rows = pool.query(query, id);
  return rows;
}

module.exports = { obtenerNovedades, agregarNovedad, eliminarNovedad, obtenerNovedadPorId, editarNovedad }