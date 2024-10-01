package com.hexaware.concreteclasses;

import com.hexaware.abstractclasses.Vehicle;

public class User {
    private String userName;
    private Vehicle rentedVehicle;

    public User(String userName) {
        this.userName = userName;
        this.rentedVehicle = null;
    }

    public void rentVehicle(Vehicle vehicle) {
        if (rentedVehicle == null) {
            vehicle.rentVehicle();
            rentedVehicle = vehicle;
            System.out.println(userName + " has rented: " + vehicle.getName());
        } else {
            System.out.println(userName + " has already rented a vehicle: " + rentedVehicle.getName());
        }
    }

    public void returnVehicle() {
        if (rentedVehicle != null) {
            rentedVehicle.returnVehicle();
            System.out.println(userName + " has returned: " + rentedVehicle.getName());
            rentedVehicle = null;
        } else {
            System.out.println("No vehicle to return.");
        }
    }

    public void showRentedVehicle() {
        if (rentedVehicle != null) {
            System.out.println(userName + " currently has rented: " + rentedVehicle.getName());
        } else {
            System.out.println(userName + " has not rented any vehicle.");
        }
    }

    //for checking if the user has a rented vehicle
    public Vehicle getRentedVehicle() {
        return rentedVehicle;
    }
}
