/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.bean;

import java.math.BigDecimal;

/**
 *
 * @author Admin
 */
public class Cart {
    private int servicesID;
    private String urlImages;
    private String servicesName;
    private int quantity;
    private BigDecimal price;

    public Cart() {
    }

    public Cart(int servicesID, String urlImages, String servicesName, int quantity, BigDecimal price) {
        this.servicesID = servicesID;
        this.urlImages = urlImages;
        this.servicesName = servicesName;
        this.quantity = quantity;
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getServicesID() {
        return servicesID;
    }

    public String getServicesName() {
        return servicesName;
    }

    public String getUrlImages() {
        return urlImages;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setServicesID(int servicesID) {
        this.servicesID = servicesID;
    }

    public void setServicesName(String servicesName) {
        this.servicesName = servicesName;
    }

    public void setUrlImages(String urlImages) {
        this.urlImages = urlImages;
    }

}
