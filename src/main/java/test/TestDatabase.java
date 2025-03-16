package test;

import com.mycompany.megacitycab.dao.BookingDAO;
import com.mycompany.megacitycab.model.Booking;

public class TestDatabase {
    public static void main(String[] args) {
        Booking booking = new Booking("123 Main St", "456 Elm St", 10.5, "standard", "2023-10-15 10:00", 500.00);
        BookingDAO bookingDAO = new BookingDAO();
        bookingDAO.insertBooking(booking);
        System.out.println("Booking inserted successfully!");
    }
}