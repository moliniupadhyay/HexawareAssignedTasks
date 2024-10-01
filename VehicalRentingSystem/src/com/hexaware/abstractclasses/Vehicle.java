package com.hexaware.abstractclasses;

public abstract class Vehicle {
                private String name ;
                private double rentPrice;
                private boolean isRented;
                
                public Vehicle(String name,double rentPrice) {
                	this.name =name ;
                	this.rentPrice=rentPrice;
                	this.isRented=false;
                }

				public String getName() {
					return name;
				}

				public void setName(String name) {
					this.name = name;
				}

				public double getRentPrice() {
					return rentPrice;
				}

				public void setRentPrice(double rentPrice) {
					this.rentPrice = rentPrice;
				}

				public boolean isRented() {
					return isRented;
				}

				public void setRented(boolean isRented) {
					this.isRented = isRented;
				}
				
				public abstract void rentVehicle();
				public abstract void returnVehicle();
                
}
