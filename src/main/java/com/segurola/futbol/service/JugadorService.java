package com.segurola.futbol.service;

import com.segurola.futbol.dao.JugadorDao;
import com.segurola.futbol.domain.Jugador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class JugadorService {

    @Autowired
    private JugadorDao jugadorDao;

    public Collection<Jugador> findAll() {
        return jugadorDao.findAll();
    }

    public Collection<Jugador> findAllByEquippo(int id_equipo) {
        return jugadorDao.findAllByEquipo(id_equipo);
    }

    public Jugador findOne(Integer id) {
        return jugadorDao.getJugador(id);
    }

    public Jugador create(Jugador jugador) {
        return jugadorDao.save(jugador);
    }

    public void update(Jugador jugador) {
        jugadorDao.update(jugador);
    }

    public void delete(Integer id) {
        jugadorDao.delete(id);
    }
}
