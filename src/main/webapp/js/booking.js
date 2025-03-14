// Initialize map and markers
let map;
let pickupMarker;
let dropoffMarker;
let pickupLocation = null;
let dropoffLocation = null;

// Initialize Leaflet Map
function initMap() {
    // Set default coordinates (e.g., Colombo, Sri Lanka)
    const defaultLocation = [6.9271, 79.8612];

    // Initialize the map
    map = L.map('map').setView(defaultLocation, 12);

    // Add OpenStreetMap tiles
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Add click event listener to the map
    map.on("click", (event) => {
        const location = {
            lat: event.latlng.lat,
            lng: event.latlng.lng,
        };

        // Reverse geocode the clicked location to get the address
        reverseGeocode(location, (address) => {
            if (!pickupLocation) {
                setPickupLocation(location, address);
            } else if (!dropoffLocation) {
                setDropoffLocation(location, address);
            }
        });
    });

    // Get the user's current location
    getCurrentLocation();
}

// Get the user's current location
function getCurrentLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            (position) => {
                const location = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                };
                // Reverse geocode the current location to get the address
                reverseGeocode(location, (address) => {
                    setPickupLocation(location, address);
                    map.setView([location.lat, location.lng], 15); // Zoom to the user's location
                });
            },
            (error) => {
                console.error("Error getting current location:", error);
                alert("Unable to retrieve your location. Please enable location services and try again.");
            }
        );
    } else {
        alert("Geolocation is not supported by your browser.");
    }
}

// Geocode an address to get coordinates
function geocodeAddress(address, callback) {
    const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address)}`;

    fetch(url)
        .then((response) => response.json())
        .then((data) => {
            if (data.length > 0) {
                const location = {
                    lat: parseFloat(data[0].lat),
                    lng: parseFloat(data[0].lon),
                };
                callback(location);
            } else {
                alert("Address not found. Please enter a valid address.");
            }
        })
        .catch((error) => {
            console.error("Error geocoding address:", error);
            alert("Unable to geocode the address. Please try again.");
        });
}

// Reverse geocode coordinates to get an address
function reverseGeocode(location, callback) {
    const url = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.lat}&lon=${location.lng}`;

    fetch(url)
        .then((response) => response.json())
        .then((data) => {
            if (data.display_name) {
                callback(data.display_name); // Use the full address
            } else {
                callback("Address not found");
            }
        })
        .catch((error) => {
            console.error("Error reverse geocoding:", error);
            callback("Unable to retrieve address");
        });
}

// Set pickup location
function setPickupLocation(location, address) {
    pickupLocation = location;
    if (pickupMarker) {
        map.removeLayer(pickupMarker);
    }
    pickupMarker = L.marker([location.lat, location.lng], {
        icon: L.icon({
            iconUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon.png',
            iconSize: [25, 41],
            iconAnchor: [12, 41],
        }),
    }).addTo(map);
    document.getElementById("pickup").value = address; // Display the address

    if (dropoffLocation) {
        const distance = calculateDistance(pickupLocation.lat, pickupLocation.lng, dropoffLocation.lat, dropoffLocation.lng);
        calculateFare(distance);
    }
}

// Set drop-off location
function setDropoffLocation(location, address) {
    dropoffLocation = location;
    if (dropoffMarker) {
        map.removeLayer(dropoffMarker);
    }
    dropoffMarker = L.marker([location.lat, location.lng], {
        icon: L.icon({
            iconUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon.png',
            iconSize: [25, 41],
            iconAnchor: [12, 41],
        }),
    }).addTo(map);
    document.getElementById("dropoff").value = address; // Display the address

    if (pickupLocation) {
        const distance = calculateDistance(pickupLocation.lat, pickupLocation.lng, dropoffLocation.lat, dropoffLocation.lng);
        calculateFare(distance);
    }
}

// Initialize Flatpickr for date and time picker
flatpickr("#date-time", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: "today",
    time_24hr: true,
    defaultDate: new Date(),
});

// Use My Current Location
document.getElementById("current-location-btn").addEventListener("click", getCurrentLocation);

// Vehicle Type Selection
const vehicleOptions = document.querySelectorAll(".vehicle-option");
vehicleOptions.forEach((option) => {
    option.addEventListener("click", () => {
        // Remove active class from all options
        vehicleOptions.forEach((opt) => opt.classList.remove("active"));
        // Add active class to the selected option
        option.classList.add("active");
        // Update the hidden input value
        document.getElementById("ride-type").value = option.getAttribute("data-value");

        // Update fare calculation if locations are set
        if (pickupLocation && dropoffLocation) {
            const distance = calculateDistance(pickupLocation.lat, pickupLocation.lng, dropoffLocation.lat, dropoffLocation.lng);
            calculateFare(distance);
        }
    });
});

// Function to calculate distance between two coordinates using Haversine formula
function calculateDistance(lat1, lng1, lat2, lng2) {
    const R = 6371; // Radius of the Earth in kilometers
    const dLat = (lat2 - lat1) * (Math.PI / 180);
    const dLng = (lng2 - lng1) * (Math.PI / 180);
    const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLng / 2) * Math.sin(dLng / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c; // Distance in kilometers
}




// Fare Calculation Logic
const baseFareElement = document.getElementById("base-fare");
const distanceElement = document.getElementById("distance");
const totalFareElement = document.getElementById("total-fare");

const baseFares = {
    standard: 500,
    luxury: 1000,
    suv: 1500,
};

const distanceRate = 50; // Cost per kilometer

function calculateFare(distance) {
    const rideType = document.getElementById("ride-type").value;
    const baseFare = baseFares[rideType];
    const distanceCost = distance * distanceRate;
    const totalFare = baseFare + distanceCost;

    // Update fare display in the UI
    baseFareElement.textContent = `LKR ${baseFare.toFixed(2)}`;
    distanceElement.textContent = `${distance.toFixed(2)} km`;
    totalFareElement.textContent = `LKR ${totalFare.toFixed(2)}`;

    // Update hidden input fields for form submission
    document.getElementById("total-fare").value = totalFare.toFixed(2);
    document.getElementById("distance").value = distance.toFixed(2);

    console.log("Updated fare display and hidden fields.");
}
// Initialize fare calculation with zero distance
calculateFare(0);

// Reset Form Functionality
document.getElementById("reset-form-btn").addEventListener("click", function () {
    resetForm();
});

function resetForm() {
    // Reset input fields
    document.getElementById("ride-form").reset();

    pickupLocation = null;
    dropoffLocation = null;

    if (pickupMarker) {
        map.removeLayer(pickupMarker);
        pickupMarker = null;
    }
    if (dropoffMarker) {
        map.removeLayer(dropoffMarker);
        dropoffMarker = null;
    }

    calculateFare(0);

    // Reset vehicle type selection
    const vehicleOptions = document.querySelectorAll(".vehicle-option");
    vehicleOptions.forEach((option) => option.classList.remove("active"));
    document.querySelector(".vehicle-option[data-value='standard']").classList.add("active");
    document.getElementById("ride-type").value = "standard";

    // Reset Flatpickr date-time input
    flatpickr("#date-time", {
        enableTime: true,
        dateFormat: "Y-m-d H:i",
        minDate: "today",
        time_24hr: true,
        defaultDate: new Date(),
    });
}

// Handle form submission
document.getElementById("ride-form").addEventListener("submit", function (event) {
    event.preventDefault();

    const pickupAddress = document.getElementById("pickup").value;
    const dropoffAddress = document.getElementById("dropoff").value;

    if (!pickupAddress || !dropoffAddress) {
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Please enter both pickup and drop-off addresses.",
        });
        return;
    }

    // Get form data
    const formData = new FormData(this);

    // Debug form data
    for (let [key, value] of formData.entries()) {
        console.log(key, value); 
        // Debug log
    }

    fetch("/MegaCityCab/bookRide", {
        method: "POST",
        body: formData,
        credentials: "include", 
    })
        .then((response) => response.text()) // Parse the response as plain text
        .then((data) => {
            const [status, message] = data.split(":"); message
            if (status === "success") {
                Swal.fire({
                    icon: "success",
                    title: "Booking Successful!",
                    text: message,
                }).then(() => {
                    // Reset the form after successful booking
                    resetForm();
                });
            } else if (status === "error") {
                Swal.fire({
                    icon: "error",
                    title: "Booking Failed",
                    text: message,
                });
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            Swal.fire({
                icon: "error",
                title: "Oops...",
                text: "Something went wrong. Please try again.",
            });
        });
});

// Initialize the map when the page loads
window.onload = initMap;