let map;
let pickupMarker;
let dropoffMarker;
let pickupLocation = null;
let dropoffLocation = null;

// Initialize Leaflet Map
function initMap() {
    // Set default coordinates 
    const defaultLocation = [ 6.85000, 79.95000];

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
}

// Handle form submission
document.getElementById("ride-form").addEventListener("submit", function(event) {
    event.preventDefault();

    const pickupAddress = document.getElementById("pickup").value;
    const dropoffAddress = document.getElementById("dropoff").value;

    if (!pickupAddress || !dropoffAddress) {
        alert("Please enter both pickup and drop-off addresses.");
        return;
    }

    // Geocode pickup address
    geocodeAddress(pickupAddress, (pickupLocation) => {
        // Reverse geocode to get the full address
        reverseGeocode(pickupLocation, (pickupAddressFull) => {
            setPickupLocation(pickupLocation, pickupAddressFull);

            // Geocode drop-off address
            geocodeAddress(dropoffAddress, (dropoffLocation) => {
                // Reverse geocode to get the full address
                reverseGeocode(dropoffLocation, (dropoffAddressFull) => {
                    setDropoffLocation(dropoffLocation, dropoffAddressFull);

                    const rideType = document.getElementById("ride-type").value;
                    const dateTime = document.getElementById("date-time").value;

                    alert(`🚖 Ride Confirmed!\n\nPickup: ${pickupAddressFull}\nDrop-off: ${dropoffAddressFull}\nRide Type: ${rideType}\nDate & Time: ${dateTime}`);
                });
            });
        });
    });
});

// Initialize Flatpickr for date and time picker
flatpickr("#date-time", {
    enableTime: true, 
    dateFormat: "Y-m-d H:i", 
    minDate: "today", 
    time_24hr: true, 
    defaultDate: new Date(), 
});

//Use My Current Location
document.getElementById("current-location-btn").addEventListener("click", getCurrentLocation);
// Vehicle Type Selection
const vehicleOptions = document.querySelectorAll(".vehicle-option");
const seatCountInput = document.getElementById("seat-count");
const maxSeatsSpan = document.getElementById("max-seats");

vehicleOptions.forEach((option) => {
    option.addEventListener("click", () => {
        // Remove active class from all options
        vehicleOptions.forEach((opt) => opt.classList.remove("active"));
        // Add active class to the selected option
        option.classList.add("active");
        // Update the hidden input value
        document.getElementById("ride-type").value = option.getAttribute("data-value");

        // Update seat count input based on selected vehicle
        const maxSeats = option.getAttribute("data-seats");
        seatCountInput.setAttribute("max", maxSeats);
        maxSeatsSpan.textContent = maxSeats;

        // Reset seat count if it exceeds the new max
        if (seatCountInput.value > maxSeats) {
            seatCountInput.value = maxSeats;
        }
    });
});

window.onload = initMap;

function calculateDistance(lat1, lng1, lat2, lng2) {
    const R = 6371; 
    const dLat = (lat2 - lat1) * (Math.PI / 180);
    const dLng = (lng2 - lng1) * (Math.PI / 180);
    const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLng / 2) * Math.sin(dLng / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c; 
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

const distanceRate = 50; 

function calculateFare(distance) {
    const rideType = document.getElementById("ride-type").value;
    const baseFare = baseFares[rideType];
    const distanceCost = distance * distanceRate;
    const totalFare = baseFare + distanceCost;

    baseFareElement.textContent = `LKR ${baseFare.toFixed(2)}`;
    distanceElement.textContent = `${distance.toFixed(2)} km`;
    totalFareElement.textContent = `LKR ${totalFare.toFixed(2)}`;
}

document.getElementById("ride-type").addEventListener("change", () => {
    const distance = 5; 
    calculateFare(distance);
});

calculateFare(0); 