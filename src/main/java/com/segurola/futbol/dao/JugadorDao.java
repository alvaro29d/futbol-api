package com.segurola.futbol.dao;

import com.segurola.futbol.dao.mapper.JugadorMapper;
import com.segurola.futbol.domain.Jugador;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@Repository
public class JugadorDao {

    private static final Logger LOG = Logger.getLogger(JugadorDao.class);

    @Autowired
    private JdbcTemplate jdbcTemplateObject;

    public Jugador getJugador(Integer id) {
        LOG.info("get jugador by id: " + id);
        String SQL = "select * from jugadores where id_jugador = ?";

        try{
            Jugador jugador = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new JugadorMapper());
            return jugador;
        } catch(EmptyResultDataAccessException ex) {
            return null;
        }
    }

    public List<Jugador> findAllByEquipo(int id_equipo) {
        LOG.info("find by equipo: " + id_equipo);
        String SQL = "select * from jugadores where equipo_jugador = ?";
        List<Jugador> jugadores = jdbcTemplateObject.query(SQL,
                new Object[]{id_equipo}, new JugadorMapper());
        return jugadores;
    }

    public List<Jugador> findAll() {
        LOG.info("find all jugadores");
        String SQL = "select * from jugadores";
        List<Jugador> jugadores = jdbcTemplateObject.query(SQL,
                new JugadorMapper());
        return jugadores;
    }

    public Jugador save(Jugador j) {
        String SQL = "INSERT INTO jugadores (" +
                "nombre_jugador,apellido_jugador,email_jugador,pass_jugador," +
                "edad_jugador,numero_jugador,goles_jugador,asistencias_jugador," +
                "posicion_jugador,amarillas_jugador,rojas_jugador,estado_jugador," +
                "foto_jugador,minutos_jugador,equipo_jugador) " +
                "values( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        Object[] values = getValues(j);

        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplateObject.update(
                new PreparedStatementCreator() {
                    public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                        PreparedStatement ps =
                                connection.prepareStatement(SQL, new String[] {"id_jugador"});
                        ps.setString(1, (String) values[0]);
                        ps.setString(2, (String) values[1]);
                        ps.setString(3, (String) values[2]);
                        ps.setString(4, (String) values[3]);
                        ps.setInt(5,(Integer) values[4]);
                        ps.setInt(6, (Integer) values[5]);
                        ps.setInt(7, (Integer) values[6]);
                        ps.setInt(8, (Integer) values[7]);
                        ps.setString(9, (String) values[8]);
                        ps.setInt(10, (Integer) values[9]);
                        ps.setInt(11, (Integer) values[10]);
                        ps.setString(12, (String) values[11]);
                        ps.setString(13, (String) values[12]);
                        ps.setInt(14, (Integer) values[13]);
                        ps.setInt(15, (Integer) values[14]);
                        return ps;
                    }
                },
                keyHolder);

        j.setId_jugador(keyHolder.getKey().intValue());
        LOG.info("Created Record with ID: " + j.getId_jugador());
        return j;
    }

    public void update(Jugador jugador){
        String SQL = "update jugadores set " +
                "nombre_jugador = ? ,apellido_jugador = ? ,email_jugador = ? ,pass_jugador = ? ," +
                "edad_jugador = ? ,numero_jugador = ? ,goles_jugador = ? ,asistencias_jugador = ? ," +
                "posicion_jugador = ? ,amarillas_jugador = ? ,rojas_jugador = ? ,estado_jugador = ? ," +
                "foto_jugador = ? ,minutos_jugador = ? ,equipo_jugador = ? where id_jugador = ?";
        jdbcTemplateObject.update(SQL, getValues(jugador));
        LOG.info("Updated Record with ID = " + jugador.getId_jugador());
    }

    public void delete(Integer id){
        String SQL = "delete from jugadores where id_jugador = ?";
        jdbcTemplateObject.update(SQL, id);
        LOG.info("Deleted Record with ID = " + id);
    }

    private Object[] getValues(Jugador j) {
        return new Object[]{j.getNombre_jugador(),j.getApellido_jugador(),j.getEmail_jugador(),j.getPass_jugador(),
                j.getEdad_jugador(),j.getNumero_jugador(),j.getGoles_jugador(),j.getAsistencias_jugador(),
                j.getPosicion_jugador(),j.getAmarillas_jugador(),j.getRojas_jugador(),j.getEstado_jugador(),
                j.getFoto_jugador(),j.getMinutos_jugador(),j.getEquipo_jugador(),j.getId_jugador()};
    }

}
