<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Marketplace - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb; /* gray-50 */
        }
        .product-card {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
        }
    </style>
</head>
<body>

    <!-- Header with Navigation -->
    <header class="bg-white shadow-md sticky top-0 z-40">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i data-lucide="sprout" class="w-8 h-8 text-green-600"></i>
                <h1 class="text-2xl font-bold text-gray-800">Smart Kisan Assistant</h1>
            </div>
            <nav class="hidden md:flex items-center space-x-6">
                <a href="buyer/buyerDashboard" class="text-green-600 border-b-2 border-green-600 font-bold">Buyer Marketplace</a>
                <a href="buyer/buyerLogin" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Logout</a>
            </nav>
            <button class="md:hidden">
                 <i data-lucide="menu" class="w-6 h-6"></i>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Page Header & Filters -->
        <div class="text-center mb-8">
            <h2 class="text-3xl font-bold text-gray-800">Browse Fresh Produce</h2>
            <p class="text-gray-600 mt-2">Find high-quality produce directly from local farmers.</p>
        </div>

        <div class="bg-white p-4 rounded-lg shadow-sm mb-8 flex flex-col md:flex-row gap-4">
            <div class="relative flex-grow">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <i data-lucide="search" class="w-5 h-5 text-gray-400"></i>
                </div>
                <input type="text" id="product-search" placeholder="Search for produce (e.g., Tomato, Wheat...)"
                       class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-md leading-5 bg-white placeholder-gray-500 focus:outline-none focus:ring-1 focus:ring-green-500 focus:border-green-500 sm:text-sm">
            </div>
            <div class="flex-shrink-0">
                <select id="category-filter" class="block w-full md:w-auto px-3 py-2 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500 sm:text-sm">
                    <option value="all">All Categories</option>
                    <option value="vegetable">Vegetables</option>
                    <option value="fruit">Fruits</option>
                    <option value="grain">Grains</option>
                    <option value="spice">Spices</option>
                </select>
            </div>
        </div>

        <!-- Product Grid -->
        <div id="product-grid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            
            <!-- Example Product Card 1 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden product-card" data-product-name="fresh tomatoes" data-category="vegetable">
                <img src="https://placehold.co/400x300/ef4444/FFFFFF?text=Tomatoes" alt="Tomatoes" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-bold text-gray-900">Fresh Tomatoes</h3>
                    <p class="text-gray-600 mt-1">Available: 50 Quintal</p>
                    <p class="text-green-600 font-semibold mt-2">₹1,800 / Quintal</p>
                    <p class="text-sm text-gray-500 mt-2 flex items-center"><i data-lucide="map-pin" class="w-4 h-4 mr-1"></i> Nashik, Maharashtra</p>
                    <button class="mt-4 w-full bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors">
                        Contact Seller
                    </button>
                </div>
            </div>

            <!-- Example Product Card 2 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden product-card" data-product-name="sona masoori rice" data-category="grain">
                <img src="https://placehold.co/400x300/facc15/FFFFFF?text=Rice" alt="Rice" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-bold text-gray-900">Sona Masoori Rice</h3>
                    <p class="text-gray-600 mt-1">Available: 200 Quintal</p>
                    <p class="text-green-600 font-semibold mt-2">₹3,200 / Quintal</p>
                    <p class="text-sm text-gray-500 mt-2 flex items-center"><i data-lucide="map-pin" class="w-4 h-4 mr-1"></i> Guntur, Andhra Pradesh</p>
                    <button class="mt-4 w-full bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors">
                        Contact Seller
                    </button>
                </div>
            </div>

            <!-- Example Product Card 3 -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden product-card" data-product-name="alphonso mangoes" data-category="fruit">
                <img src="https://placehold.co/400x300/fb923c/FFFFFF?text=Mangoes" alt="Mangoes" class="w-full h-48 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-bold text-gray-900">Alphonso Mangoes</h3>
                    <p class="text-gray-600 mt-1">Available: 10 Quintal (Seasonal)</p>
                    <p class="text-green-600 font-semibold mt-2">₹8,000 / Quintal</p>
                    <p class="text-sm text-gray-500 mt-2 flex items-center"><i data-lucide="map-pin" class="w-4 h-4 mr-1"></i> Ratnagiri, Maharashtra</p>
                    <button class="mt-4 w-full bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors">
                        Contact Seller
                    </button>
                </div>
            </div>
             <!-- No results message -->
             <div id="no-results" class="hidden text-center sm:col-span-2 lg:col-span-3 xl:col-span-4 py-10">
                <i data-lucide="info" class="w-12 h-12 text-gray-400 mx-auto"></i>
                <p class="mt-4 text-gray-600">No produce found matching your criteria.</p>
             </div>

        </div>
    </main>

    <script>
        lucide.createIcons();

        // --- DOM Elements ---
        const searchInput = document.getElementById('product-search');
        const categoryFilter = document.getElementById('category-filter');
        const productGrid = document.getElementById('product-grid');
        const noResultsMessage = document.getElementById('no-results');

        // --- Filter Logic ---
        const filterProducts = () => {
            const searchTerm = searchInput.value.toLowerCase();
            const selectedCategory = categoryFilter.value;
            let foundOne = false;
            const productCards = document.querySelectorAll('.product-card');

            productCards.forEach(card => {
                const productName = card.dataset.productName.toLowerCase();
                const productCategory = card.dataset.category;

                const nameMatch = productName.includes(searchTerm);
                const categoryMatch = (selectedCategory === 'all' || productCategory === selectedCategory);

                if (nameMatch && categoryMatch) {
                    card.style.display = 'block';
                    foundOne = true;
                } else {
                    card.style.display = 'none';
                }
            });

            noResultsMessage.classList.toggle('hidden', foundOne);
        };

        searchInput.addEventListener('keyup', filterProducts);
        categoryFilter.addEventListener('change', filterProducts);

    </script>
</body>
</html>
