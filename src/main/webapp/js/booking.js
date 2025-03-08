document.getElementById("ride-form").addEventListener("submit", function(event) {
    event.preventDefault();
    
    let pickup = document.getElementById("pickup").value;
    let dropoff = document.getElementById("dropoff").value;
    let rideType = document.getElementById("ride-type").value;
    let dateTime = document.getElementById("date-time").value;

    if (pickup && dropoff && dateTime) {
        alert(`🚖 Ride Confirmed!\n\nPickup: ${pickup}\nDrop-off: ${dropoff}\nRide Type: ${rideType}\nDate & Time: ${dateTime}`);
    } else {
        alert("Please fill in all fields.");
    }
});