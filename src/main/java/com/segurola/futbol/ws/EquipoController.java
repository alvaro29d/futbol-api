package com.segurola.futbol.ws;

import com.segurola.futbol.domain.Jugador;
import com.segurola.futbol.service.JugadorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collection;

@RestController
public class EquipoController {

    @Autowired
    private JugadorService jugadorService;

    @RequestMapping(value = "/api/equipos/{id}/jugadores",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Collection<Jugador>> getJugadoresByEquipo(@PathVariable final Integer id) {
        final Collection<Jugador> jugadores = jugadorService.findAllByEquippo(id);
        return new ResponseEntity<Collection<Jugador>>(jugadores, HttpStatus.OK);
    }

}
