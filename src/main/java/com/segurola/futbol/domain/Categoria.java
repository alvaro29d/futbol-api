package com.segurola.futbol.domain;

public class Categoria {
	private int id_categoria;
	private String nombre_categoria;
	private int id_torneo_categoria;
	
	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public String getNombre_categoria() {
		return nombre_categoria;
	}
	public void setNombre_categoria(String nombre_categoria) {
		this.nombre_categoria = nombre_categoria;
	}
	public int getId_torneo_categoria() {
		return id_torneo_categoria;
	}
	public void setId_torneo_categoria(int id_torneo_categoria) {
		this.id_torneo_categoria = id_torneo_categoria;
	}
	
}
