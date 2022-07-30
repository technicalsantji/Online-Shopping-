/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.Entity;

/**
 *
 * @author SANT JI
 */
public class Product {
  private int id,pprice;
    private  String pname,pcategory,pacitive;

    public Product(int id, String pname, String pcategory, int pprice, String pacitive) {
        this.id = id;
        this.pname = pname;
        this.pcategory = pcategory;
        this.pprice = pprice;
        this.pacitive = pacitive;
    }

    public Product(String pname, String pcategory, int pprice, String pacitive) {
        this.pname = pname;
        this.pcategory = pcategory;
        this.pprice = pprice;
        this.pacitive = pacitive;
    }

    public Product() {
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPprice() {
        return pprice;
    }

    public void setPprice(int pprice) {
        this.pprice = pprice;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPcategory() {
        return pcategory;
    }

    public void setPcategory(String pcategory) {
        this.pcategory = pcategory;
    }

    public String getPacitive() {
        return pacitive;
    }

    public void setPacitive(String pacitive) {
        this.pacitive = pacitive;
    }
    
    
    
}
