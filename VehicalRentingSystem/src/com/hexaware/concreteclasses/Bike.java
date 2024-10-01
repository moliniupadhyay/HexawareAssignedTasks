package com.hexaware.concreteclasses;

import com.hexaware.abstractclasses.Vehicle;

public class Bike extends Vehicle {

    public Bike(String name, double rentPrice) {
        super(name, rentPrice);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            setRented(true);
            System.out.println(getName() + " bike has been rented at price: " + getRentPrice());
        } else {
            System.out.println(getName() + " bike is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            setRented(false);
            System.out.println(getName() + " bike has been returned.");
        } else {
            System.out.println(getName() + " bike is not rented.");
        }
    }
}
