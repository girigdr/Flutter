package com.E_Comerse.Projects.Controller;


import com.E_Comerse.Projects.Entity.Product;
import com.E_Comerse.Projects.Service.ServiceSide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.Optional;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/PRODUCT")
@Component
public class ControllerSide {

    @Autowired
    ServiceSide service ;
    @GetMapping("/addAllDataToFrontEnd")
    public ResponseEntity< List< Product > > getAllData () {
        System.out.println("abcdefghijklmnopqrstuvwxyz");
        return ResponseEntity.ok(service.getAllData() );
    }


    @PostMapping("/addDataInDataBase")
    public ResponseEntity<Product> addProduct(@RequestBody Product product) {
        Product savedProduct = service.addProduct(product);
        return ResponseEntity.ok(savedProduct);
    }
}
