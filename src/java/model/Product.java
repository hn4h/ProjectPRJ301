/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author 11
 */
public class Product {

    private int id;
    private String productName;
    private String productCode;
    private Brand brand;
    private List<Category> categories;
    private double price;
    private List<ProductCatalog> productCatalogs;
    private String description;
    private List<String> images;
    private boolean isStorage;

    public Product() {
    }

    public Product(int id, String productName, String productCode, Brand brand, List<Category> categories, double price, List<ProductCatalog> productCatalogs, String description, List<String> images, boolean isStorage) {
        this.id = id;
        this.productName = productName;
        this.productCode = productCode;
        this.brand = brand;
        this.categories = categories;
        this.price = price;
        this.productCatalogs = productCatalogs;
        this.description = description;
        this.images = images;
        this.isStorage = isStorage;
    }

    

    public boolean getIsStorage() {
        return isStorage;
    }

    public void setIsStorage(boolean isStorage) {
        this.isStorage = isStorage;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<ProductCatalog> getProductCatalogs() {
        return productCatalogs;
    }

    public void setProductCatalogs(List<ProductCatalog> productCatalogs) {
        this.productCatalogs = productCatalogs;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

}
