var pool = require("./bd");

/* Función para MOSTRAR jugadores */

async function mostrarJugadores() {
  var query = "select * from jugadores order by posicion";
  var rows = await pool.query(query);
  return rows;
}

/* Función para INCORPORAR jugador */

async function incorporarJugador(objeto) {
  try {
    var query = "insert into jugadores set ?";
    var rows = await pool.query(query, [objeto]);
    return rows;
  } catch (error) {
    console.log(error);
    throw error;
  }
}

/* Función para MODIFICAR jugador */

async function captarJugadorPorId(id) {
  var query = "select * from jugadores where id_jugador = ?";
  var rows = await pool.query(query, [id]);
  return rows[0];
}

async function modificarJugador(objeto, id) {
  try {
    var query = "update jugadores set ? where id_jugador = ?";
    var rows = await pool.query(query, [objeto, id]);
    return rows;
  } catch (error) {
    console.log(error);
    throw error;
  }
}

/* Función para BORRAR jugador */

async function borrarJugador(id) {
  query = "delete from jugadores where id_jugador = ?";
  var rows = pool.query(query, id);
  return rows;
}

module.exports = {
  mostrarJugadores,
  incorporarJugador,
  modificarJugador,
  captarJugadorPorId,
  borrarJugador,
};
