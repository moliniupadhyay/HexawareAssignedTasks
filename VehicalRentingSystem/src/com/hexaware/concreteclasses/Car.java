package com.hexaware.concreteclasses;
import com.hexaware.abstractclasses.Vehicle;

public class Car extends Vehicle  {

	 public Car(String name, double rentPrice) {
	        super(name, rentPrice);
	    }
	 
	@Override
	public void rentVehicle() {
		if(!isRented()) {
			setRented(true);
			 System.out.println(getName() + "car has been rented at price: " + getRentPrice());
        } else {
            System.out.println(getName() + " car is already rented.");
        
		}
	}
	
	 @Override
	    public void returnVehicle() {
	        if (isRented()) {
	            setRented(false);
	            System.out.println(getName() + " cas has been returned.");
	        } else {
	            System.out.println(getName() + " car is not rented.");
	        }

}}
