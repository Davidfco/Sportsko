
package com.sportskoV2.controller;

import com.sportskoV2.domain.Categoria;
import com.sportskoV2.service.CategoriaService;
import com.sportskoV2.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/principal")
public class PrincipalController {
    
    @Autowired
    private ProductoService productoService;
    
    @Autowired
    private CategoriaService categoriaService;
    
    @GetMapping("/listado")
    public String listado(Model model) {
        var productosOferta = productoService.getProductosPorOferta(true, true);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("productos", productosOferta);
        model.addAttribute("totalProductos", productosOferta.size());
        model.addAttribute("categorias", categorias);
        return "/principal/listado";
    }
    
    @GetMapping("/listado/{idCategoria}")
    public String listado(Model model, Categoria categoria) {
        var productos = categoriaService.getCategoria(categoria).getProductos();
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("productos", productos);
        model.addAttribute("totalProductos", productos.size());
        model.addAttribute("categorias", categorias);
        return "/principal/listado";
    }
}
