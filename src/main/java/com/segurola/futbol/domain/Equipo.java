package com.segurola.futbol.domain;

public class Equipo {
	private int id_equipo;
	private String nombre_equipo;
	private String escudo_equipo;
	private int partidos_equipo;
	private int puntos_equipo;
	private int goles_equipo;
	private int categoria_id_equipo;

	public int getId_equipo() {
		return id_equipo;
	}
	public void setId_equipo(int id_equipo) {
		this.id_equipo = id_equipo;
	}
	public String getNombre_equipo() {
		return nombre_equipo;
	}
	public void setNombre_equipo(String nombre_equipo) {
		this.nombre_equipo = nombre_equipo;
	}
	public String getEscudo_equipo() {
		return escudo_equipo;
	}
	public void setEscudo_equipo(String escudo_equipo) {
		this.escudo_equipo = escudo_equipo;
	}
	public int getPartidos_equipo() {
		return partidos_equipo;
	}
	public void setPartidos_equipo(int partidos_equipo) {
		this.partidos_equipo = partidos_equipo;
	}
	public int getPuntos_equipo() {
		return puntos_equipo;
	}
	public void setPuntos_equipo(int puntos_equipo) {
		this.puntos_equipo = puntos_equipo;
	}
	public int getGoles_equipo() {
		return goles_equipo;
	}
	public void setGoles_equipo(int goles_equipo) {
		this.goles_equipo = goles_equipo;
	}
	public int getCategoria_id_equipo() {
		return categoria_id_equipo;
	}
	public void setCategoria_id_equipo(int categoria_id_equipo) {
		this.categoria_id_equipo = categoria_id_equipo;
	}
}
