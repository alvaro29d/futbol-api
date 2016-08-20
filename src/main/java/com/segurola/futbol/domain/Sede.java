package com.segurola.futbol.domain;

public class Sede {
	private int id_sede;
	private String nombre_sede;
	private String direccion_sede;
	private int id_torneo_sede;
	
	public int getId_sede() {
		return id_sede;
	}
	public void setId_sede(int id_sede) {
		this.id_sede = id_sede;
	}
	public String getNombre_sede() {
		return nombre_sede;
	}
	public void setNombre_sede(String nombre_sede) {
		this.nombre_sede = nombre_sede;
	}
	public String getDireccion_sede() {
		return direccion_sede;
	}
	public void setDireccion_sede(String direccion_sede) {
		this.direccion_sede = direccion_sede;
	}
	public int getId_torneo_sede() {
		return id_torneo_sede;
	}
	public void setId_torneo_sede(int id_torneo_sede) {
		this.id_torneo_sede = id_torneo_sede;
	}
}
