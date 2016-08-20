package com.segurola.futbol.ws;

import com.segurola.futbol.domain.Jugador;
import com.segurola.futbol.service.JugadorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;

@RestController
public class JugadorController {

    @Autowired
    private JugadorService jugadorService;


    @RequestMapping(value = "/api/jugadores",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Collection<Jugador>> getJugadores() {
        final Collection<Jugador> jugadores = jugadorService.findAll();
        return new ResponseEntity<Collection<Jugador>>(jugadores, HttpStatus.OK);
    }

    @RequestMapping(value = "/api/jugadores/{id}",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Jugador> getJugador(@PathVariable final Integer id) {
        final Jugador jugador = jugadorService.findOne(id);
        if (jugador == null) {
            return new ResponseEntity<Jugador>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Jugador>(jugador, HttpStatus.OK);
    }

    @RequestMapping(value = "/api/jugadores",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Jugador> createJugador(@RequestBody final Jugador jugador) {
        final Jugador savedJugador = jugadorService.create(jugador);
        return new ResponseEntity<Jugador>(savedJugador, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/api/jugadores/{id}",
            method = RequestMethod.PUT,
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Jugador> updateJugador(@RequestBody final Jugador jugador) {
        jugadorService.update(jugador);
        return new ResponseEntity<Jugador>(jugador, HttpStatus.OK);
    }

    @RequestMapping(value = "/api/jugadores/{id}",
            method = RequestMethod.DELETE)
    public ResponseEntity<Jugador> deleteJugadores(@PathVariable("id") final Integer id) {
        jugadorService.delete(id);
        return new ResponseEntity<Jugador>(HttpStatus.NO_CONTENT);
    }


}
