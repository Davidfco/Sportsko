
package com.sportskoV2.service;

import com.sportskoV2.domain.Producto;
import java.util.List;

public interface ProductoService {
    
    // Se genera un método para obtener un ArrayList de Categorias
    public List<Producto> getProductos(boolean activos);

    // Se obtiene un Categoria, a partir del id de un categoria
    public Producto getProducto(Producto producto);

    // Se inserta un nuevo categoria si el id del categoria esta vacío
    // Se actualiza un categoria si el id del categoria NO esta vacío
    public void save(Producto producto);

    // Se elimina el categoria que tiene el id pasado por parámetro
    public void delete(Producto producto);
    
    public List<Producto> getProductosPorCategoria(int idCategoria, boolean activo);
    
    public List<Producto> getProductosPorOferta(boolean oferta, boolean activo);
    
    public List<Producto> buscarProductos(String query);
}
