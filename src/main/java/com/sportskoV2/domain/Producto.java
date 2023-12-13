package com.sportskoV2.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name="producto")
public class Producto implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_producto")
    private Long idProducto;
    
    private String nombreProducto;
    private String descripcion;
    private double precio;
    private int existencias;
    private String rutaImagen;
    private String talla;
    private String color;
    private boolean oferta;
    private boolean activo;
    
    @ManyToOne
    @JoinColumn(name="id_categoria")
    Categoria categoria;

    public Producto() {
    }

    public Producto(String nombreProducto, String descripcion, double precio, int existencias, String rutaImagen, String talla, String color, boolean oferta, boolean activo) {
        this.nombreProducto = nombreProducto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.existencias = existencias;
        this.rutaImagen = rutaImagen;
        this.talla = talla;
        this.color = color;
        this.oferta = oferta;
        this.activo = activo;
    }

    
}
