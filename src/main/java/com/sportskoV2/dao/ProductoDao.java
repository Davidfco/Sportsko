package com.sportskoV2.dao;

import com.sportskoV2.domain.Producto;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoDao extends JpaRepository<Producto,Long> {
    
    List<Producto> findByCategoriaIdCategoria(int idCategoria);
    
    List<Producto> findByOferta(boolean oferta);
    
    List<Producto> findByNombreProductoContainingIgnoreCase(String nombre);
    
}
