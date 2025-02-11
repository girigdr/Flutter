package com.E_Comerse.Projects.Entity;


import jakarta.persistence.*;



@Entity
@Table(name = "shopping_app")
public class Product {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private long id ;
    private String name ;
    private double rating ;
    private double price ;
    private String description ;

    public Product(long id, String name, double rating, double price, String description) {
        this.id = id;
        this.name = name;
        this.rating = rating;
        this.price = price;
        this.description = description;
    }

    public Product() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", rating=" + rating +
                ", price=" + price +
                ", description='" + description + '\'' +
                '}';
    }
}
