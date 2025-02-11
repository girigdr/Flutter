package com.E_Comerse.Projects.Service;

import com.E_Comerse.Projects.DataBases.DataBase;
import com.E_Comerse.Projects.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ServiceSide {

    @Autowired
    DataBase db ;


    // getMapping of sending all data
    public List<Product> getAllData() {
        List<Product> products = db.findAll();
        System.out.println("Fetched Products: " + products); // Debugging log
        return products;
    }
    // postMapping of adding data
    public Product addProduct(Product product) {
        return db.save(product);
    }

}
