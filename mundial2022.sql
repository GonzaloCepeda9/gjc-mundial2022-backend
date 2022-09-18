-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-09-2022 a las 15:26:33
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mundial2022`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
CREATE TABLE IF NOT EXISTS `jugadores` (
  `id_jugador` int(10) NOT NULL AUTO_INCREMENT,
  `id_img_jugador` varchar(250) DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `edad` int(2) NOT NULL,
  `posicion` varchar(50) NOT NULL,
  `club` varchar(50) NOT NULL,
  PRIMARY KEY (`id_jugador`)
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `id_img_jugador`, `nombre`, `apellido`, `edad`, `posicion`, `club`) VALUES
(1, 'rmirbyrjxpoby3wmztjk', 'Emliano', 'Martínez', 29, 'Arquero', 'Aston Villa'),
(2, 'pkav2j5etnnvdzwuagzz', 'Franco', 'Armani', 35, 'Arquero', 'River Plate'),
(4, 'cqzdo8zwqf57edkfsczs', 'Gerónimo', 'Rulli', 30, 'Arquero', 'Villareal'),
(5, 'jlirawvhlircgscbeirn', 'Gonzalo', 'Montiel', 25, 'Defensor', 'Sevilla'),
(6, 'k0swtccpxiajab6nmr9e', 'Nahuel', 'Molina', 24, 'Defensor', 'Boca Juniors'),
(7, 'uwcvi3woqlhkm1sknamh', 'Juan', 'Foyth', 24, 'Defensor', 'Villareal'),
(8, 'en9bxgnc0pskmrr7khtk', 'Germán', 'Pezzela', 31, 'Defensor', 'Real Betis'),
(10, 'mrlmikjff6kls0g0kuh5', 'Cristian', 'Romero', 24, 'Defensor', 'Tottenham'),
(11, 'nq59p901pvvpbwp2opsx', 'Nicolás', 'Otamendi', 34, 'Defensor', 'Benfica'),
(12, 'nk84o9cgz81ad8ox4abv', 'Lisandro', 'Martínez', 24, 'Defensor', 'Manchester United'),
(15, 'ibov8cgyb6juws780pu9', 'Marcos', 'Acuña', 30, 'Defensor', 'Sevilla'),
(16, 'k8cknpkt8n1zvhidb1ps', 'Leandro', 'Paredes', 28, 'Mediocampista', 'París Saint Germain'),
(17, 'brdrojxdxfxlwm1igajx', 'Guido', 'Rodríguez', 28, 'Mediocampista', 'Real Betis'),
(18, 'yqa1tyhtcceorspeeop2', 'Alexis', 'Mac Allister', 23, 'Mediocampista', 'Brighton & Hove Albion'),
(19, 'wfe63rlmtjuvyglnis4r', 'Rodrigo', 'De Paul', 28, 'Mediocampista', 'Atlético Madrid'),
(20, 't1xtumgmfexwvfkzn7pk', 'Exequiel', 'Palacios', 23, 'Mediocampista', 'Bayer 04 Leverkusen'),
(21, 'lg20b0y0hdjwqrcfksvc', 'Giovani', 'Lo Celso', 26, 'Mediocampista', 'Tottenham'),
(22, 'ttnn82zxj8ndgbwu8np5', 'Alejandro', 'Gómez', 34, 'Mediocampista', 'Sevilla'),
(23, 'fr6ktuqrarwcdlmgeeuq', 'Ángel', 'Di María', 34, 'Mediocampista', 'Juventus'),
(24, 'ab9lwdy6youdqt18mkj1', 'Lionel', 'Messi', 35, 'Delantero', 'París Saint-Germain'),
(25, 'jynlpzqfvu5kjzviades', 'Lautaro', 'Martínez', 24, 'Delantero', 'Inter Milan'),
(26, 'nvi5zd200zwysiufn5pl', 'Paulo', 'Dybala', 28, 'Delantero', 'A. S. Roma'),
(27, 'm4xwkou8t4u83tx3g1p4', 'Julián', 'Álvarez', 22, 'Delantero', 'Manchester City'),
(28, 'khb1zaamvucrc9es0tyo', 'Joaquín', 'Correa', 27, 'Delantero', 'Estudiantes L. P.'),
(29, 'czxyhjnursvcc1ru5iho', 'Nicolás', 'González', 24, 'Delantero', 'Fiorentina'),
(30, 'ooaly7klphmv2jyuj6yg', 'Ángel', 'Correa', 27, 'Delantero', 'Atlético Madrid'),
(93, 'qgp7mgxbkiz8ischf08s', 'Martín', 'Palermo', 48, 'Delantero', 'Boca Juniors');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

DROP TABLE IF EXISTS `novedades`;
CREATE TABLE IF NOT EXISTS `novedades` (
  `id_novedad` int(9) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `id_img_novedad` varchar(250) DEFAULT NULL,
  `subtitulo` text NOT NULL,
  `cuerpo` text NOT NULL,
  PRIMARY KEY (`id_novedad`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `novedades`
--

INSERT INTO `novedades` (`id_novedad`, `titulo`, `id_img_novedad`, `subtitulo`, `cuerpo`) VALUES
(1, 'Brasil pidió a la FIFA suspender el partido pendiente de las Eliminatorias con la Selección Argentina. El reclamo nació por iniciativa del entrenador Tite. El juego está programado para el 22 de septiembre en San Pablo.', 'qs9d1hie0ugerftygmyr', 'El reclamo nació por iniciativa del entrenador Tite. El juego está programado para el 22 de septiembre en San Pablo.', 'La Confederación Brasileña de Fútbol (CBF) le solicitó este miércoles a la FIFA que suspenda el partido de las Eliminatorias Sudamericanas para Qatar 2022 que tiene pendiente contra la Selección Argentina, que había sido reprogramado para el 22 de septiembre en San Pablo.\r\n\r\nArgentina, en tanto, tiene un reclamo pendiente en el TAS por este motivo, ya que en varias oportunidades el entrenador Lionel Scaloni expresó su postura de no jugar el partido.\r\n\r\n\"Después de recibir el pedido del técnico Tite, intentaremos suspender el partido\", informó la CBF en un comunicado publicado hoy.\r\n\r\n\"Dada la posición del cuerpo técnico, vamos a buscar en este momento a la FIFA para que no se juegue el partido. No escatimaré esfuerzos para asistir al cuerpo técnico. Nuestra prioridad es ganar el sexto campeonato en Qatar. Vamos a invertir para que el partido no se lleve a cabo”, expresó el presidente de la CBF, Ednaldo Rodrigues.\r\n\r\nSegún la entidad brasileña, el cuerpo técnico explicó que disputar el clásico sudamericano podría ser perjudicial para la preparación para el Mundial de Qatar 2022.\r\n\r\n\"El riesgo de lesiones, suspensiones y el boicot de Argentina al partido\" también fueron las razones que expuso Tite para no disputar el encuentro, según detalló el comunicado.'),
(3, 'Batistuta elogió a la Selección Argentina y dio sus candidatos para el Mundial Qatar 2022', 'fxm9vfemuvye02kgftbd', 'El Bati aseguró que la Albiceleste \"llega en un momento espectacular\" a la Copa del Mundo. A su vez, destacó a seis conjuntos europeos para pelear por el título.', 'Gabriel Omar Batistuta, uno de los máximos goleadores de la historia de la Selección Argentina, elogió al equipo de Lionel Scaloni: aseguró que llega \"en un momento espectacular\" al Mundial de Qatar 2022. Más allá de eso, también destacó a otras seis selecciones europeas como posibles candidatas a la Copa del Mundo.\r\n\r\n\"La Argentina está bien, está muy bien. Le tocó un buen sorteo, ¿no?\", expresó. En ese sentido, también considera que \"hoy el equipo está perfecto y mejor no podría llegar\". Y añadió: \"Ganó la Copa América, se relajaron, se los ve unidos, el técnico se ve firme, se ve que lo siguen… ¿Si van a ganar? Qué sé yo, yo jugué al fútbol y no es matemática\".\r\n\r\nPor otra parte, Batistuta cree que Lionel Scaloni \"logró que le crean\" y recordó que \"al principio no había uno que no le pegara\". \"No lo conozco yo, pero el flaco se impuso. Hizo la lógica: ¿viste cuando tirás una piedrita al agua? Las olitas van haciendo así, una a una… Bueno, el flaco empezó por los jugadores, no empezó por querer convencer a los hinchas, a los periodistas. No. No dio nunca nada. Nunca una polémica, nada\", afirmó en una entrevista con La Nación.'),
(7, 'Alivio en la Selección Argentina: Lo Celso acordó su continuidad en Villarreal', 'l91uqcxtxdzf5bf1sepy', 'Tras haber regresado a Tottenham, donde no era tenido en cuenta, el mediocampista de la Selección tiene todo listo para volver al Submarino Amarillo y seguir en el fútbol español.', 'Una de las últimas situaciones que de alguna manera inquietaban al cuerpo técnico de la Selección Argentina en la previa del Mundial de Qatar 2022 acaba de resolverse con final feliz para el jugador y para el equipo nacional: Giovani Lo Celso, que había regresado a Tottenham, club dueño de su pase pero donde no iba a ser tenido en cuenta, arregló una nueva salida al Villarreal, donde jugó el primer semestre de este 2022, y continuará su carrera en el Submarino Amarillo.\r\nLo Celso perdió terreno en el Tottenham con la llegada de Antonio Conte y eso motivó su salida al Villarreal a principio de año. En el Submarino Amarillo tuvo muy buenos rendimientos y fue clave en la fase final de la Champions League que realizó el elenco español, que llegó a semifinales, donde cayó ante el Liverpool. Sin embargo, el 30 de junio terminó su vínculo y tuvo que regresar al cuadro inglés, donde otra vez fue marginado del plantel.\r\nEn Italia sonó para Napoli y Fiorentina mientras pasaban los días sin presencia de Lo Celso en el equipo principal del Tottenham, pero finalmente Villarreal pudo llegar a un acuerdo con los Spurs y lo tendrá nuevamente a préstamo: esta vez, por toda la temporada, hasta junio del 2023 y sin opción de compra.\r\nDe esta manera, Lo Celso tendrá prácticamente garantizada la continuidad y los minutos de juego en esta primera parte de la temporada, donde los jugadores que van a jugar el Mundial buscarán la puesta a punto rumbo a Qatar 2022. Un alivio para Lionel Scaloni, que tiene muy en cuenta al exRosario Central y ahora descansa en la tranquilidad de saber que llegará con muy buen ritmo y siendo importante en su equipo.\r\n'),
(17, 'Los jugadores de la Selección Argentina que quedan mal posicionados en la previa del Mundial Qatar 2022', 'cjpjqgw31rrem045kqoc', 'Salió a la luz la prelista de Lionel Scaloni para los amistosos de este mes y varios jugadores importantes perdieron mucho terreno.', 'La Selección Argentina presentó la lista para los amistosos a disputarse en la ventana de amistosos FIFA en este mes en los Estados Unidos ante Honduras y Jamaica. Hubo varias sorpresas, como las inclusiones de Enzo Fernández y Thiago Almada, como también por las ausencias de varios jugadores que ya han formado parte de La Scaloneta. \r\nLucas Alario  - Eintracht Frankfurt\r\nEl ex-jugador de River fue una fija dentro de las primeras convocatorias de Lionel Scaloni, perdiéndose la Copa América 2021 por lesión cuando formaba parte de la lista, pero fue perdiendo consideración y hoy sus chances de viajar al Mundial parecen lejanas.  \r\n\r\nEl actual jugador del Eintracht Frankfurt cuenta con nueve partidos en la Selección Argentina con tres goles. Entre ellos, se destaca su partido ante la Selección de Alemania en Dortmund en el 2019 dónde marcó un gol y repartió su única asistencia con el combinado nacional para igualar 2-2 ante el elenco teutón.'),
(15, 'Los jugadores de la Selección Argentina que cambian de club a pocos meses del Mundial Qatar 2022', 'uda3y1bvrahix3pshhqu', 'A menos de tres meses para el comienzo de la Copa del Mundo, repasamos los futbolistas argentinos que se mudaron de equipo.', 'El Mundial de Qatar 2022 está cada vez más cerca. Faltan poco menos de 90 días para que comience la próxima Copa del Mundo, que tendrá a la Selección Argentina de Lionel Messi y compañía como uno de los principales candidatos. El DT Lionel Scaloni afirmó en reiteradas ocasiones que el único que tiene un lugar asegurado es el capitán, y por ese motivo varios futbolistas que luchan por estar entre los 26 cambiaron de club en este mercado de pases.\r\nÁngel Di María y Leandro Paredes, de Paris Saint-Germain a Juventus\r\nTras siete temporadas consecutivas en el PSG, en las que conquistó 19 títulos y jugó la final de la Champions League en 2020, Fideo finalizó su contrato y dejó la institución parisina en condición de agente libre, por lo que pudo negociar su pase como quisiera.\r\n\r\nDespués de semanas en las que su futuro parecía incierto, Di María se transformó en nuevo jugador de Juventus, aunque solo firmó por una temporada, lo que ilusiona a todo Rosario Central con una posible vuelta del crack argentino tras el Mundial de Qatar.\r\n\r\nSemanas después, el mediocampista Leandro Paredes llegó a un acuerdo con el conjunto italiano y, si bien restan detalles para la confirmación oficial, todo indica que jugará en la Vecchia Signora.'),
(16, 'La Selección Argentina confirmó sus amistosos: Honduras y Jamaica en Estados Unidos', 'lyobofh9pzronuge3t2m', 'La idea de jugar contra rivales de la CONCACAF es porque el combinado de Lionel Scaloni será rival de México en fase de grupos del Mundial de Qatar 2022.', 'Ya con la prelista de los convocados en mano, la Selección Argentina confirmó sus amistosos para la fecha FIFA de septiembre en Estados Unidos. El combinado de Lionel Scaloni afrontará sus últimas pruebas de fuego antes del Mundial de Qatar 2022.\r\n\r\nLionel Messi será nuevamente la cabeza de una delegación que enfrentará a Honduras en Miami, el 23/9, y a Jamaica en Nueva York, el 27/9. Los partidos se disputarán en el Hard Rock Stadium y el Red Bull Arena, Nueva Jersey, respectivamente.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`) VALUES
(3, 'gonzalo9', '81dc9bdb52d04dc20036dbd8313ed055'),
(6, 'usuario9', '81dc9bdb52d04dc20036dbd8313ed055');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
