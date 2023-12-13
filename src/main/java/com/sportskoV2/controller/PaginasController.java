package com.sportskoV2.controller;

import com.sportskoV2.domain.Categoria;
import com.sportskoV2.service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sportskoV2.service.ProductoService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/paginas")
public class PaginasController {

    @Autowired
    private ProductoService productoService;
    
    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/listado")
    public String listado(Model model) {
        var productosCategoria1 = productoService.getProductosPorCategoria(1, true);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("productos", productosCategoria1);
        model.addAttribute("totalProductos", productosCategoria1.size());
        model.addAttribute("categorias", categorias);
        return "/paginas/listado";
    }
    
     @GetMapping("/listado/{idCategoria}")
    public String listado(Model model, Categoria categoria) {
        var productos = categoriaService.getCategoria(categoria).getProductos();
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("productos", productos);
        model.addAttribute("totalProductos", productos.size());
        model.addAttribute("categorias", categorias);
        return "/paginas/listado";
    }
    
    @GetMapping("/listado2")
    public String listado2(Model model) {
        var productosCategoria2 = productoService.getProductosPorCategoria(2, true);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("productos", productosCategoria2);
        model.addAttribute("totalProductos", productosCategoria2.size());
        model.addAttribute("categorias", categorias);
        return "/paginas/listado2";
    }
    
    @GetMapping("/listado3")
    public String listado3(Model model) {
        var productosCategoria3 = productoService.getProductosPorCategoria(3, true);
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("productos", productosCategoria3);
        model.addAttribute("totalProductos", productosCategoria3.size());
        model.addAttribute("categorias", categorias);
        return "/paginas/listado3";
    }
}