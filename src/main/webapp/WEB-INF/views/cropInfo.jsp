<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crop Information Guide - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb; /* gray-50 */
        }
        .card {
            background-color: white;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            transition: all 0.2s ease-in-out;
        }
        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
        }
    </style>
</head>
<body>

    <!-- Header with Navigation -->
    <header class="bg-white shadow-md sticky top-0 z-50">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i data-lucide="sprout" class="w-8 h-8 text-green-600"></i>
                <h1 class="text-2xl font-bold text-gray-800">Smart Kisan Assistant</h1>
            </div>
            <nav class="hidden md:flex items-center space-x-6">
                <a href="/Ai" class="text-gray-600 hover:text-green-600 font-medium transition-colors">AI Assistant</a>
                <a href="/myFarm" class="text-gray-600 hover:text-green-600 font-medium transition-colors">My Farm & History</a>
                <a href="/cropInfo" class="text-green-600 border-b-2 border-green-600 font-bold">Crop Guide</a>
                <a href="/login" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Logout</a>
            </nav>
            <button class="md:hidden">
                 <i data-lucide="menu" class="w-6 h-6"></i>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Control Section -->
        <section class="mb-8">
            <h2 class="text-3xl font-bold text-gray-800 text-center">Crop Information Guide</h2>
            <p class="text-center text-gray-600 mt-2">Search for detailed information or add new crops to the guide.</p>
            <div class="mt-6 max-w-2xl mx-auto">
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <i data-lucide="search" class="w-5 h-5 text-gray-400"></i>
                    </div>
                    <input type="text" id="crop-search" placeholder="Search for a crop (e.g., Wheat, Cotton...)"
                           class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-full leading-5 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 focus:ring-1 focus:ring-green-500 focus:border-green-500 sm:text-sm">
                </div>
            </div>
             <div class="text-center mt-6">
                <button id="add-crop-btn" class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-6 rounded-full inline-flex items-center transition-colors">
                    <i data-lucide="plus" class="w-5 h-5 mr-2"></i>
                    Add New Crop
                </button>
            </div>
        </section>

        <!-- Crop Grid -->
        <section id="crop-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            
            <!-- Example Crop Card 1: Sugarcane -->
            <div class="card p-6 crop-card relative" data-crop-name="sugarcane (गन्ना)">
                <div class="absolute top-3 right-3">
                    <button class="remove-crop-btn text-gray-400 hover:text-red-500 transition-colors">
                        <i data-lucide="trash-2" class="w-5 h-5"></i>
                    </button>
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">Sugarcane (गन्ना)</h3>
                <div class="space-y-3 text-gray-700">
                    <p><strong>Sowing Season:</strong> January-March (Autumn), October-November (Spring)</p>
                    <p><strong>Ideal Soil Type:</strong> Loamy soil, Black cotton soil</p>
                    <p><strong>Water Needs:</strong> High, requires frequent irrigation.</p>
                    <p><strong>Common Pests:</strong> Early shoot borer, Top borer, Pyrilla.</p>
                </div>
            </div>

            <!-- Example Crop Card 2: Wheat -->
            <div class="card p-6 crop-card relative" data-crop-name="wheat (गेहूं)">
                 <div class="absolute top-3 right-3">
                    <button class="remove-crop-btn text-gray-400 hover:text-red-500 transition-colors">
                        <i data-lucide="trash-2" class="w-5 h-5"></i>
                    </button>
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">Wheat (गेहूं)</h3>
                <div class="space-y-3 text-gray-700">
                    <p><strong>Sowing Season:</strong> October-December (Rabi season)</p>
                    <p><strong>Ideal Soil Type:</strong> Well-drained loamy and clay loamy soil.</p>
                    <p><strong>Water Needs:</strong> Moderate, critical at crown root initiation and flowering stages.</p>
                    <p><strong>Common Pests:</strong> Aphids, Termites, Rusts.</p>
                </div>
            </div>

            <!-- Example Crop Card 3: Cotton -->
            <div class="card p-6 crop-card relative" data-crop-name="cotton (कपास)">
                 <div class="absolute top-3 right-3">
                    <button class="remove-crop-btn text-gray-400 hover:text-red-500 transition-colors">
                        <i data-lucide="trash-2" class="w-5 h-5"></i>
                    </button>
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">Cotton (कपास)</h3>
                <div class="space-y-3 text-gray-700">
                    <p><strong>Sowing Season:</strong> April-May (Kharif season)</p>
                    <p><strong>Ideal Soil Type:</strong> Black cotton soil is ideal.</p>
                    <p><strong>Water Needs:</strong> Tolerant to drought, but needs water during flowering.</p>
                    <p><strong>Common Pests:</strong> Bollworm, Whitefly, Jassids.</p>
                </div>
            </div>

             <div id="no-results" class="hidden text-center md:col-span-2 lg:col-span-3 py-10">
                <i data-lucide="info" class="w-12 h-12 text-gray-400 mx-auto"></i>
                <p class="mt-4 text-gray-600">No crops found matching your search.</p>
             </div>
        </section>
    </main>

    <!-- Add Crop Modal -->
    <div id="add-crop-modal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden z-50">
        <div class="relative top-10 mx-auto p-5 border w-full max-w-lg shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center pb-3 border-b">
                 <h3 class="text-2xl font-semibold">Add New Crop Information</h3>
                 <button id="close-modal-btn" class="text-gray-400 hover:text-gray-600 transition-colors">
                     <i data-lucide="x" class="w-6 h-6"></i>
                 </button>
            </div>
            <form id="add-crop-form" class="space-y-4 mt-4">
                <div>
                    <label for="crop-name" class="block text-sm font-medium text-gray-700">Crop Name (e.g., Rice (चावल))</label>
                    <input type="text" id="crop-name" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                <div>
                    <label for="sowing-season" class="block text-sm font-medium text-gray-700">Sowing Season</label>
                    <input type="text" id="sowing-season" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                <div>
                    <label for="soil-type" class="block text-sm font-medium text-gray-700">Ideal Soil Type</label>
                    <input type="text" id="soil-type" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                <div>
                    <label for="water-needs" class="block text-sm font-medium text-gray-700">Water Needs</label>
                    <input type="text" id="water-needs" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                <div>
                    <label for="common-pests" class="block text-sm font-medium text-gray-700">Common Pests</label>
                    <input type="text" id="common-pests" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                <div class="text-right pt-2">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors">
                        Save Crop
                    </button>
                </div>
            </form>
        </div>
    </div>


    <script>
        lucide.createIcons();

        // --- DOM Elements ---
        const searchInput = document.getElementById('crop-search');
        const noResultsMessage = document.getElementById('no-results');
        const cropGrid = document.getElementById('crop-grid');
        const addCropBtn = document.getElementById('add-crop-btn');
        const modal = document.getElementById('add-crop-modal');
        const closeModalBtn = document.getElementById('close-modal-btn');
        const addCropForm = document.getElementById('add-crop-form');
        
        // --- Modal Logic ---
        const toggleModal = () => {
            modal.classList.toggle('hidden');
            lucide.createIcons(); // Re-render icons in modal if needed
        };

        addCropBtn.addEventListener('click', toggleModal);
        closeModalBtn.addEventListener('click', toggleModal);
        
        // --- Search Logic ---
        const handleSearch = () => {
            const searchTerm = searchInput.value.toLowerCase();
            let foundOne = false;
            const cropCards = document.querySelectorAll('.crop-card');

            cropCards.forEach(card => {
                const cropName = card.dataset.cropName.toLowerCase();
                if (cropName.includes(searchTerm)) {
                    card.style.display = 'block';
                    foundOne = true;
                } else {
                    card.style.display = 'none';
                }
            });

            noResultsMessage.classList.toggle('hidden', foundOne);
        };

        searchInput.addEventListener('keyup', handleSearch);

        // --- Add/Remove Crop Logic ---
        
        // Function to create a new crop card element
        const createCropCard = (cropData) => {
            const card = document.createElement('div');
            card.className = 'card p-6 crop-card relative';
            card.dataset.cropName = cropData.name.toLowerCase();
            
            card.innerHTML = `
                <div class="absolute top-3 right-3">
                    <button class="remove-crop-btn text-gray-400 hover:text-red-500 transition-colors">
                        <i data-lucide="trash-2" class="w-5 h-5"></i>
                    </button>
                </div>
                <h3 class="text-xl font-semibold text-gray-900 mb-3">${cropData.name}</h3>
                <div class="space-y-3 text-gray-700">
                    <p><strong>Sowing Season:</strong> ${cropData.season}</p>
                    <p><strong>Ideal Soil Type:</strong> ${cropData.soil}</p>
                    <p><strong>Water Needs:</strong> ${cropData.water}</p>
                    <p><strong>Common Pests:</strong> ${cropData.pests}</p>
                </div>
            `;
            // Insert the new card before the "no results" message
            cropGrid.insertBefore(card, noResultsMessage);
            lucide.createIcons(); // Render the new trash icon
        };

        // Handle form submission to add a new crop
        addCropForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const newCrop = {
                name: document.getElementById('crop-name').value,
                season: document.getElementById('sowing-season').value,
                soil: document.getElementById('soil-type').value,
                water: document.getElementById('water-needs').value,
                pests: document.getElementById('common-pests').value,
            };

            createCropCard(newCrop);
            addCropForm.reset();
            toggleModal();
            handleSearch(); // Refresh search results
        });
        
        // Handle removing a crop (using event delegation)
        cropGrid.addEventListener('click', (e) => {
            // Find the closest remove button that was clicked
            const removeBtn = e.target.closest('.remove-crop-btn');
            if (removeBtn) {
                // Find the parent card and remove it
                const cardToRemove = removeBtn.closest('.crop-card');
                if (cardToRemove) {
                    cardToRemove.remove();
                    handleSearch(); // Refresh search to update no-results message if needed
                }
            }
        });

    </script>
</body>
</html>

