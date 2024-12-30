// API URL
const API_URL = "https://api.coingecko.com/api/v3/coins/markets";
const API_PARAMS = "?vs_currency=usd&order=market_cap_desc&per_page=9&page=1&sparkline=false"; // 9개로 제한

// DOM Elements
const cryptoCards = document.getElementById("crypto-cards");

// Fetch Data from API
async function fetchCryptoData() {
    try {
        const response = await fetch(API_URL + API_PARAMS);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        displayCryptoData(data);
    } catch (error) {
        console.error("Error fetching crypto data:", error);
        cryptoCards.innerHTML = `
            <div class="text-center text-danger">
                <p>Failed to load cryptocurrency data. Please try again later.</p>
            </div>`;
    }
}

// Display Data on Cards
function displayCryptoData(data) {
    cryptoCards.innerHTML = ""; // Clear previous cards
    data.forEach((crypto) => {
        const card = `
            <div class="col">
                <div class="card shadow h-100">
                    <div class="card-body text-center">
                        <img src="${crypto.image}" alt="${crypto.name}" class="img-fluid mb-3" style="width: 50px; height: 50px;">
                        <h5 class="card-title">${crypto.name}</h5>
                        <p class="card-text text-muted">${crypto.symbol.toUpperCase()}</p>
                        <h4>$${crypto.current_price.toLocaleString()}</h4>
                        <p class="${crypto.price_change_percentage_24h > 0 ? 'text-success' : 'text-danger'}">
                            ${crypto.price_change_percentage_24h.toFixed(2)}%
                        </p>
                    </div>
                </div>
            </div>
        `;
        cryptoCards.innerHTML += card;
    });
}

// Initialize Fetch
fetchCryptoData();
