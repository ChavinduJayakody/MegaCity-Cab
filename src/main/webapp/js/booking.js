let map;
let pickupMarker;
let dropoffMarker;
let pickupLocation = null;
let dropoffLocation = null;

// Initialize Leaflet Map
function initMap() {
    // Set default coordinates (e.g., Melbourne)
    const defaultLocation = [-37.8136, 144.9631];

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
    enableTime: true, // Enable time selection
    dateFormat: "Y-m-d H:i", // Date and time format
    minDate: "today", // Disable past dates
    time_24hr: true, // Use 24-hour format
    defaultDate: new Date(), // Set default date to current date and time
});

// Add event listener for the "Use My Current Location" button
document.getElementById("current-location-btn").addEventListener("click", getCurrentLocation);

// Initialize the map when the page loads
window.onload = initMap;