
import 'package:flutter/material.dart' ;
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.181.144:8080/PRODUCT/addAllDataToFrontEnd";

  // Fetch the product list
  static Future< List<Product> > fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}


//geting the data of PRODUCTS


class Product {
  final int id;
  final String name;
  final double rating;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.rating,
    required this.price,
    required this.description,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0, // Default to 0 if null
      name: json['name'] ?? 'No Name', // Default to 'No Name'
      rating: (json['rating'] ?? 0).toDouble(), // Default to 0.0
      price: (json['price'] ?? 0).toDouble(), // Default to 0.0
      description: json['description'] ?? 'No Description', // Default to empty string
    );
  }

  // Factory method to create an instance from JSON
  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //     id: json['id'],
  //     name: json['name'],
  //     rating: json['rating'].toDouble(),
  //     price: json['price'].toDouble(),
  //     description: json['description'],
  //   );
  // }
}
