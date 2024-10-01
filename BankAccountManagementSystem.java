package com.hexaware.main;

import java.util.Scanner;

public class BankAccountManagementSystem {

    private String name;
    private double balance;

    // Constructor
    public BankAccountManagementSystem(String name, double initialBalance) {
        this.name = name;
        this.balance = initialBalance;
    }

    // Deposit money
    public void deposit(double amount) throws InvalidAmountException {
        if (amount <= 0) {
            throw new InvalidAmountException("Amount must be positive.");
        }
        balance += amount;
        System.out.println("Deposit successful! Current balance: " + balance);
    }

    // Withdraw money
    public void withdraw(double amount) throws InvalidAmountException, InsufficientFundsException {
        if (amount <= 0) {
            throw new InvalidAmountException("Amount must be positive.");
        }
        if (amount > balance) {
            throw new InsufficientFundsException("Insufficient funds.");
        }
        balance -= amount;
        System.out.println("Withdrawal successful! Current balance: " + balance);
    }

    // Check balance
    public void checkBalance() {
        System.out.println("Current balance: " + balance);
    }

    // Custom Exceptions
    static class InvalidAmountException extends Exception {
        public InvalidAmountException(String message) {
            super(message);
        }
    }

    static class InsufficientFundsException extends Exception {
        public InsufficientFundsException(String message) {
            super(message);
        }
    }

    static class InvalidChoiceException extends Exception {
        public InvalidChoiceException(String message) {
            super(message);
        }
    }

    // Main method
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        BankAccountManagementSystem account = null;
        boolean exit = false;

        while (!exit) {
            System.out.println("\n1. Create Account");
            System.out.println("2. Deposit Money");
            System.out.println("3. Withdraw Money");
            System.out.println("4. Check Balance");
            System.out.println("5. Exit");
            System.out.print("Choose an option: ");

            try {
                int choice = sc.nextInt();
                sc.nextLine();  // Consume the leftover newline character

                switch (choice) {
                    case 1:
                        if (account == null) {
                            System.out.print("Enter account holder name: ");
                            String name = sc.nextLine();
                            System.out.print("Enter initial balance: ");
                            double balance = sc.nextDouble();
                            account = new BankAccountManagementSystem(name, balance);
                            System.out.println("Account created successfully.");
                        } else {
                            System.out.println("Account already exists.");
                        }
                        break;
                    case 2:
                        if (account != null) {
                            System.out.print("Enter deposit amount: ");
                            double depositAmount = sc.nextDouble();
                            account.deposit(depositAmount);
                        } else {
                            throw new NullPointerException("Please create an account first.");
                        }
                        break;
                    case 3:
                        if (account != null) {
                            System.out.print("Enter withdrawal amount: ");
                            double withdrawalAmount = sc.nextDouble();
                            account.withdraw(withdrawalAmount);
                        } else {
                            throw new NullPointerException("Please create an account first.");
                        }
                        break;
                    case 4:
                        if (account != null) {
                            account.checkBalance();
                        } else {
                            throw new NullPointerException("Please create an account first.");
                        }
                        break;
                    case 5:
                        exit = true;
                        System.out.println("Thank you for using the Bank Account Management System!");
                        break;
                    default:
                        throw new InvalidChoiceException("Invalid choice. Please select a valid option.");
                }
            } catch (InvalidAmountException | InsufficientFundsException e) {
                System.out.println(e.getMessage());
            } catch (NullPointerException e) {
                System.out.println(e.getMessage());
            } catch (InvalidChoiceException e) {
                System.out.println(e.getMessage());
            } 
        }
        sc.close();
    }
}


