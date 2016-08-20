package com.segurola.futbol.dao.mapper;

import com.segurola.futbol.domain.Jugador;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class JugadorMapper implements RowMapper<Jugador> {
    public Jugador mapRow(ResultSet rs, int rowNum) throws SQLException {
        Jugador j = new Jugador();
        j.setId_jugador(rs.getInt("id_jugador"));
        j.setNombre_jugador(rs.getString("nombre_jugador"));
        j.setApellido_jugador(rs.getString("apellido_jugador"));
        j.setEmail_jugador(rs.getString("email_jugador"));
        j.setPass_jugador(rs.getString("pass_jugador"));
        j.setEdad_jugador(rs.getInt("edad_jugador"));
        j.setNumero_jugador(rs.getInt("numero_jugador"));
        j.setGoles_jugador(rs.getInt("goles_jugador"));
        j.setAsistencias_jugador(rs.getInt("asistencias_jugador"));
        j.setPosicion_jugador(rs.getString("posicion_jugador"));
        j.setAmarillas_jugador(rs.getInt("amarillas_jugador"));
        j.setRojas_jugador(rs.getInt("rojas_jugador"));
        j.setEstado_jugador(rs.getString("estado_jugador"));
        j.setFoto_jugador(rs.getString("foto_jugador"));
        j.setMinutos_jugador(rs.getInt("minutos_jugador"));
        j.setEquipo_jugador(rs.getInt("equipo_jugador"));
        return j;
    }
}
