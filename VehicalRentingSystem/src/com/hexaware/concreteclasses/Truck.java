package com.hexaware.concreteclasses;

import com.hexaware.abstractclasses.Vehicle;

public class Truck extends Vehicle {

    public Truck(String name, double rentPrice) {
        super(name, rentPrice);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            setRented(true);
            System.out.println(getName() + " truck has been rented at price: $" + getRentPrice());
        } else {
            System.out.println(getName() + " truck is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            setRented(false);
            System.out.println(getName() + " truck has been returned.");
        } else {
            System.out.println(getName() + " truck is not rented.");
        }
    }
}
