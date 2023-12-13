package com.sportskoV2.service.impl;

import com.sportskoV2.dao.ProductoDao;
import com.sportskoV2.domain.Producto;
import com.sportskoV2.service.ProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoDao productoDao;

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getProductos(boolean activo) {
        var lista = productoDao.findAll();
        //Si activos es true, se deben pasar solo las productos activas
        if (activo) {
            lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Producto getProducto(Producto producto) {
        return productoDao.findById(producto.getIdProducto()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Producto producto) {
        productoDao.save(producto);
    }

    @Override
    @Transactional
    public void delete(Producto producto) {
        productoDao.delete(producto);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getProductosPorCategoria(int idCategoria, boolean activo) {
        var lista = productoDao.findByCategoriaIdCategoria(idCategoria);

        // Si activo es true, se deben pasar solo los productos activos
        if (activo) {
            lista.removeIf(e -> !e.isActivo());
        }

        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getProductosPorOferta(boolean oferta, boolean activo) {
        var lista = productoDao.findAll();

        if (oferta) {
            lista.removeIf(e -> !e.isOferta());
        }
        // Si activo es true, se deben pasar solo los productos activos
        if (activo) {
            lista.removeIf(e -> !e.isActivo());
        }

        return lista;
    }

    public List<Producto> buscarProductos(String query) {
        // Implementa la lógica de búsqueda en la base de datos
        // Puedes usar el método findByNombreProductoContainingIgnoreCase u otro apropiado
        return productoDao.findByNombreProductoContainingIgnoreCase(query);
    }
}

