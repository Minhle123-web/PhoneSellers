/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ad
 */
public class Account {
    
    private String username, password;
    private int role;
    private String name, address, phone;
    private int check;

    public Account() {

    }
   
    public String getUsername()

    {
        return username;
    }

    public void setUsername(String username){
        this.username= username;
    }
     public String getPassword()

    {
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }
     public int getrole()

    {
        return role;
    }

    public void setRole(int role){
        this.role = role;
    }
     public String getName()

    {
        return name;
    }

    public void setName(String name){
        this.name = name;
    }
     public String getAddress()
    {
        return address;
    }

    public void setAddress(String address){
        this.address = address;
    }
     public String getPhone()

    {
        return phone;
    }

    public void setPhone(String phone){
        this.phone = phone;
    }
     public int getCheck()

    {
        return check;
    }

    public void setCheck(int check){
        this.check = check;
    }
    
}

