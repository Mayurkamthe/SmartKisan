<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Dashboard - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb; /* gray-50 */
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
                <a href="/farmerDashboard" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Farmer Dashboard</a>
                <a href="/sellerDashboard" class="text-green-600 border-b-2 border-green-600 font-bold">Seller Dashboard</a>
                <a href="/login" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Logout</a>
            </nav>
            <button class="md:hidden">
                 <i data-lucide="menu" class="w-6 h-6"></i>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Page Header & Action Button -->
        <div class="flex flex-col md:flex-row justify-between items-center mb-8">
            <div>
                <h2 class="text-3xl font-bold text-gray-800">Manage Your Listings</h2>
                <p class="text-gray-600 mt-1">Add, update, or remove the produce you have for sale.</p>
            </div>
            <button id="add-product-btn" class="w-full md:w-auto mt-4 md:mt-0 bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-6 rounded-lg inline-flex items-center transition-colors">
                <i data-lucide="plus" class="w-5 h-5 mr-2"></i>
                Add New Product
            </button>
        </div>

        <!-- Product Listings Table -->
        <div class="bg-white rounded-lg shadow-md overflow-x-auto">
            <table class="w-full text-left">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="p-4 font-semibold text-sm text-gray-600">Product</th>
                        <th class="p-4 font-semibold text-sm text-gray-600">Quantity Available</th>
                        <th class="p-4 font-semibold text-sm text-gray-600">Price / Quintal</th>
                        <th class="p-4 font-semibold text-sm text-gray-600">Status</th>
                        <th class="p-4 font-semibold text-sm text-gray-600">Actions</th>
                    </tr>
                </thead>
                <tbody id="product-list">
                    <!-- Example Row 1 -->
                    <tr class="border-t" data-product-id="1">
                        <td class="p-4 flex items-center space-x-3">
                            <img src="https://placehold.co/100x75/ef4444/FFFFFF?text=Tomatoes" alt="Tomatoes" class="w-16 h-12 object-cover rounded-md product-image-cell">
                            <span class="font-medium product-name-cell">Fresh Tomatoes</span>
                        </td>
                        <td class="p-4 product-quantity-cell">50 Quintal</td>
                        <td class="p-4 font-semibold text-green-700 product-price-cell">₹1,800</td>
                        <td class="p-4">
                            <span class="px-2 py-1 text-xs font-semibold text-green-800 bg-green-100 rounded-full">Active</span>
                        </td>
                        <td class="p-4 space-x-2">
                            <button class="edit-btn text-gray-500 hover:text-blue-600"><i data-lucide="edit" class="w-5 h-5"></i></button>
                            <button class="delete-btn text-gray-500 hover:text-red-600"><i data-lucide="trash-2" class="w-5 h-5"></i></button>
                        </td>
                    </tr>
                     <!-- Example Row 2 -->
                    <tr class="border-t" data-product-id="2">
                        <td class="p-4 flex items-center space-x-3">
                            <img src="https://placehold.co/100x75/facc15/FFFFFF?text=Rice" alt="Rice" class="w-16 h-12 object-cover rounded-md product-image-cell">
                            <span class="font-medium product-name-cell">Sona Masoori Rice</span>
                        </td>
                        <td class="p-4 product-quantity-cell">200 Quintal</td>
                        <td class="p-4 font-semibold text-green-700 product-price-cell">₹3,200</td>
                        <td class="p-4">
                             <span class="px-2 py-1 text-xs font-semibold text-green-800 bg-green-100 rounded-full">Active</span>
                        </td>
                        <td class="p-4 space-x-2">
                            <button class="edit-btn text-gray-500 hover:text-blue-600"><i data-lucide="edit" class="w-5 h-5"></i></button>
                            <button class="delete-btn text-gray-500 hover:text-red-600"><i data-lucide="trash-2" class="w-5 h-5"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>

    <!-- Add/Edit Product Modal -->
    <div id="product-modal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden z-50">
        <div class="relative top-10 mx-auto p-5 border w-full max-w-lg shadow-lg rounded-md bg-white">
            <div class="flex justify-between items-center pb-3 border-b">
                 <h3 id="modal-title" class="text-2xl font-semibold">Add New Product</h3>
                 <button id="close-modal-btn" class="text-gray-400 hover:text-gray-600 transition-colors">
                     <i data-lucide="x" class="w-6 h-6"></i>
                 </button>
            </div>
            <form id="product-form" class="space-y-4 mt-4">
                 <input type="hidden" id="product-id">
                <div>
                    <label for="product-name" class="block text-sm font-medium text-gray-700">Product Name</label>
                    <input type="text" id="product-name" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                <div>
                    <label for="quantity" class="block text-sm font-medium text-gray-700">Quantity Available (in Quintals)</label>
                    <input type="number" id="quantity" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                <div>
                    <label for="price" class="block text-sm font-medium text-gray-700">Price per Quintal (in ₹)</label>
                    <input type="number" id="price" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                 <div>
                    <label for="product-image" class="block text-sm font-medium text-gray-700">Product Image</label>
                    <input type="file" id="product-image" accept="image/*" class="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-green-50 file:text-green-700 hover:file:bg-green-100">
                </div>
                <div class="text-right pt-2">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors">
                        Save Product
                    </button>
                </div>
            </form>
        </div>
    </div>


    <script>
        lucide.createIcons();
        
        // --- DOM Elements ---
        const addProductBtn = document.getElementById('add-product-btn');
        const modal = document.getElementById('product-modal');
        const closeModalBtn = document.getElementById('close-modal-btn');
        const productForm = document.getElementById('product-form');
        const productList = document.getElementById('product-list');
        const modalTitle = document.getElementById('modal-title');
        
        const productIdInput = document.getElementById('product-id');
        const productNameInput = document.getElementById('product-name');
        const quantityInput = document.getElementById('quantity');
        const priceInput = document.getElementById('price');
        const productImageInput = document.getElementById('product-image');

        // --- Modal Logic ---
        const openModal = (mode = 'add', productData = null) => {
            productForm.reset();
            if (mode === 'add') {
                modalTitle.textContent = 'Add New Product';
                productIdInput.value = '';
            } else if (mode === 'edit' && productData) {
                modalTitle.textContent = 'Edit Product';
                productIdInput.value = productData.id;
                productNameInput.value = productData.name;
                quantityInput.value = productData.quantity;
                priceInput.value = productData.price;
            }
            modal.classList.remove('hidden');
        };

        const closeModal = () => {
            modal.classList.add('hidden');
        };

        addProductBtn.addEventListener('click', () => openModal('add'));
        closeModalBtn.addEventListener('click', closeModal);
        
        // --- CRUD Logic ---
        
        // Handle Form Submission (Add & Edit)
        productForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const id = productIdInput.value;
            const newProductData = {
                name: productNameInput.value,
                quantity: quantityInput.value,
                price: priceInput.value,
                imageFile: productImageInput.files[0]
            };
            
            if (id) {
                // --- Edit Existing Product ---
                const rowToUpdate = productList.querySelector(`tr[data-product-id='${id}']`);
                if(rowToUpdate) {
                    rowToUpdate.querySelector('.product-name-cell').textContent = newProductData.name;
                    rowToUpdate.querySelector('.product-quantity-cell').textContent = `${newProductData.quantity} Quintal`;
                    rowToUpdate.querySelector('.product-price-cell').textContent = `₹${newProductData.price}`;
                    if (newProductData.imageFile) {
                        const imageCell = rowToUpdate.querySelector('.product-image-cell');
                        imageCell.src = URL.createObjectURL(newProductData.imageFile);
                    }
                }
            } else {
                // --- Add New Product ---
                const newProductId = Date.now(); // Simple unique ID
                const newRow = document.createElement('tr');
                newRow.className = 'border-t';
                newRow.dataset.productId = newProductId;

                const imageUrl = newProductData.imageFile ? URL.createObjectURL(newProductData.imageFile) : 'https://placehold.co/100x75/cccccc/FFFFFF?text=No+Image';

                newRow.innerHTML = `
                    <td class="p-4 flex items-center space-x-3">
                        <img src="${imageUrl}" alt="${newProductData.name}" class="w-16 h-12 object-cover rounded-md product-image-cell">
                        <span class="font-medium product-name-cell">${newProductData.name}</span>
                    </td>
                    <td class="p-4 product-quantity-cell">${newProductData.quantity} Quintal</td>
                    <td class="p-4 font-semibold text-green-700 product-price-cell">₹${newProductData.price}</td>
                    <td class="p-4">
                        <span class="px-2 py-1 text-xs font-semibold text-green-800 bg-green-100 rounded-full">Active</span>
                    </td>
                    <td class="p-4 space-x-2">
                        <button class="edit-btn text-gray-500 hover:text-blue-600"><i data-lucide="edit" class="w-5 h-5"></i></button>
                        <button class="delete-btn text-gray-500 hover:text-red-600"><i data-lucide="trash-2" class="w-5 h-5"></i></button>
                    </td>
                `;
                productList.appendChild(newRow);
                lucide.createIcons(); // Re-render icons for the new row
            }
            
            closeModal();
        });

        // Handle Edit & Delete button clicks (using Event Delegation)
        productList.addEventListener('click', (e) => {
            const editBtn = e.target.closest('.edit-btn');
            const deleteBtn = e.target.closest('.delete-btn');

            if (editBtn) {
                // --- Edit Logic ---
                const row = editBtn.closest('tr');
                const productData = {
                    id: row.dataset.productId,
                    name: row.querySelector('.product-name-cell').textContent,
                    quantity: parseInt(row.querySelector('.product-quantity-cell').textContent),
                    price: parseInt(row.querySelector('.product-price-cell').textContent.replace('₹', ''))
                };
                openModal('edit', productData);
            }

            if (deleteBtn) {
                // --- Delete Logic ---
                const row = deleteBtn.closest('tr');
                // Optional: Add a confirmation dialog
                if (confirm('Are you sure you want to delete this product listing?')) {
                    row.remove();
                }
            }
        });
    </script>
</body>
</html>

