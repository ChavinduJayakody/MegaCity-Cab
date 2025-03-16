package com.mycompany.megacitycab.model;

public class Booking {
    private String pickupLocation;
    private String dropoffLocation;
    private double distance;
    private String rideType;
    private String dateTime;
    private double fare;

    // Constructor
    public Booking(String pickupLocation, String dropoffLocation, double distance, String rideType, String dateTime, double fare) {
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.distance = distance;
        this.rideType = rideType;
        this.dateTime = dateTime;
        this.fare = fare;
    }

    // Getters and Setters
    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDropoffLocation() {
        return dropoffLocation;
    }

    public void setDropoffLocation(String dropoffLocation) {
        this.dropoffLocation = dropoffLocation;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public String getRideType() {
        return rideType;
    }

    public void setRideType(String rideType) {
        this.rideType = rideType;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }
}