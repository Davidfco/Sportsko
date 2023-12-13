package com.sportskoV2.controller;

import com.sportskoV2.domain.Producto;
import com.sportskoV2.service.CategoriaService;
import com.sportskoV2.service.ProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/busqueda")
public class BusquedaController {

    @Autowired
    private ProductoService productoService;

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/busqueda")
    public String buscarProductos(@RequestParam("q") String query, Model model) {
        List<Producto> resultados = productoService.buscarProductos(query);
        model.addAttribute("productoBuscado", resultados.isEmpty() ? null : resultados.get(0));
        return "/busqueda/listado";
    }
    
    
}
