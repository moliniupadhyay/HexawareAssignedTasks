package com.hexaware.mainvehicleprogram;

import com.hexaware.concreteclasses.*;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

   
        Car car1 = new Car("BMW", 500);
        Bike bike1 = new Bike("Yamaha", 200);
        Truck truck1 = new Truck("Ford", 100);

     
        User user = new User("Sita");

        boolean exit = false;
        while (!exit) {
            System.out.println("\nVehicle Rental System ");
            System.out.println("1. Rent a vehicle");
            System.out.println("2. Return a vehicle");
            System.out.println("3. View rented vehicle");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    if (user.getRentedVehicle() != null) {
                        System.out.println("You already have a rented vehicle. Please return it first.");
                        break;
                    }
                    System.out.println("1. Car\n2. Bike\n3. Truck");
                    System.out.print("Choose a vehicle to rent: ");
                    int vehicleChoice = scanner.nextInt();
                    switch (vehicleChoice) {
                        case 1:
                            user.rentVehicle(car1);
                            break;
                        case 2:
                            user.rentVehicle(bike1);
                            break;
                        case 3:
                            user.rentVehicle(truck1);
                            break;
                        default:
                            System.out.println("Invalid choice.");
                    }
                    break;

                case 2:
                    user.returnVehicle();
                    break;

                case 3:
                    user.showRentedVehicle();
                    break;

                case 4:
                    exit = true;
                    System.out.println("Exiting system...");
                    break;

                default:
                    System.out.println("Invalid choice.");
            }
        }

        scanner.close();
    }
}

