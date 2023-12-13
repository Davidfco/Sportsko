package com.sportskoV2.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Item extends Producto {

    private int cantidad; //Almacenar la cantidad de items de un producto

    public Item() {
    }

    public Item(Producto producto) {
        super.setIdProducto(producto.getIdProducto());
        super.setCategoria(producto.getCategoria());
        super.setNombreProducto(producto.getNombreProducto());
        super.setDescripcion(producto.getDescripcion());
        super.setPrecio(producto.getPrecio());
        super.setExistencias(producto.getExistencias());
        super.setRutaImagen(producto.getRutaImagen());
        super.setTalla(producto.getTalla());
        super.setColor(producto.getColor());
        super.setOferta(producto.isOferta());
        super.setActivo(producto.isActivo());

        this.cantidad = 0;
    }
}
