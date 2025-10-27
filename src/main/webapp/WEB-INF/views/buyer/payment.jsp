<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Checkout - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb;
        }
        .payment-tab.active {
            border-color: #22c55e; /* green-500 */
            background-color: #f0fdf4; /* green-50 */
            color: #166534; /* green-800 */
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="bg-white shadow-sm">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center">
             <a href="#" class="flex items-center space-x-2">
                <i data-lucide="sprout" class="w-8 h-8 text-green-600"></i>
                <h1 class="text-2xl font-bold text-gray-800">Smart Kisan Assistant</h1>
            </a>
            <a href="buyer/buyerDashboard" class="text-sm font-medium text-gray-600 hover:text-green-600 flex items-center">
                <i data-lucide="arrow-left" class="w-4 h-4 mr-1"></i>
                Back to Marketplace
            </a>
        </div>
    </header>

    <div class="container mx-auto px-4 py-8 md:py-12">
        <div class="max-w-5xl mx-auto">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-gray-900">Secure Checkout</h1>
                <p class="text-gray-600 mt-2">Complete your purchase in just a few steps.</p>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-5 gap-8 lg:gap-12">
                
                <!-- Left Side: Shipping & Payment -->
                <div class="lg:col-span-3 bg-white p-6 md:p-8 rounded-lg shadow-md">
                    <!-- Shipping Details -->
                    <div class="mb-8">
                        <h2 class="text-xl font-semibold mb-4 flex items-center"><i data-lucide="truck" class="w-5 h-5 mr-2 text-gray-500"></i>Shipping Information</h2>
                        <form class="space-y-4">
                            <div>
                                <label for="full-name" class="block text-sm font-medium text-gray-700">Full Name</label>
                                <input type="text" id="full-name" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
                            </div>
                            <div>
                                <label for="address" class="block text-sm font-medium text-gray-700">Shipping Address</label>
                                <input type="text" id="address" required class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
                            </div>
                        </form>
                    </div>

                    <!-- Payment Details Form -->
                    <div>
                        <h2 class="text-xl font-semibold mb-4 flex items-center"><i data-lucide="banknote" class="w-5 h-5 mr-2 text-gray-500"></i>Payment Method</h2>
                        <!-- Payment Method Tabs -->
                        <div class="grid grid-cols-2 sm:grid-cols-4 gap-2 mb-6">
                            <button data-payment-method="card" class="payment-tab active flex flex-col items-center p-3 border rounded-lg transition-colors">
                                <i data-lucide="credit-card" class="w-6 h-6 mb-1"></i><span class="text-xs font-medium">Card</span>
                            </button>
                             <button data-payment-method="upi" class="payment-tab flex flex-col items-center p-3 border rounded-lg transition-colors">
                                <svg class="w-6 h-6 mb-1" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14 6L12.5 3.5L11 6H14ZM10 18L11.5 20.5L13 18H10ZM6 11L3.5 12.5L6 14V11ZM18 14L20.5 12.5L18 11V14ZM16.5 7.5L15 9V15L16.5 16.5L18 15V9L16.5 7.5ZM12.5 7.5L11 9V15L12.5 16.5L14 15V9L12.5 7.5ZM8.5 7.5L7 9V15L8.5 16.5L10 15V9L8.5 7.5Z" fill="currentColor"/></svg>
                                <span class="text-xs font-medium">UPI</span>
                            </button>
                             <button data-payment-method="netbanking" class="payment-tab flex flex-col items-center p-3 border rounded-lg transition-colors">
                                <i data-lucide="landmark" class="w-6 h-6 mb-1"></i><span class="text-xs font-medium">Net Banking</span>
                            </button>
                             <button data-payment-method="cod" class="payment-tab flex flex-col items-center p-3 border rounded-lg transition-colors">
                                <i data-lucide="hand-coins" class="w-6 h-6 mb-1"></i><span class="text-xs font-medium">COD</span>
                            </button>
                        </div>

                        <!-- Payment Content Panes -->
                        <div id="payment-content" class="space-y-6">
                            <!-- Card Details -->
                            <div id="card-content" class="payment-pane space-y-4">
                                <!-- Card content from original file -->
                                <div>
                                    <label for="card-number" class="block text-sm font-medium text-gray-700">Card Number</label>
                                    <input type="text" id="card-number" placeholder="0000 0000 0000 0000" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
                                </div>
                                <div class="flex gap-4">
                                    <div class="flex-1">
                                        <label for="expiry-date" class="block text-sm font-medium text-gray-700">Expiry Date</label>
                                        <input type="text" id="expiry-date" placeholder="MM/YY" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
                                    </div>
                                    <div class="flex-1">
                                        <label for="cvc" class="block text-sm font-medium text-gray-700">CVC</label>
                                        <input type="text" id="cvc" placeholder="123" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
                                    </div>
                                </div>
                            </div>
                            <!-- UPI Details -->
                            <div id="upi-content" class="payment-pane hidden">
                                <label for="upi-id" class="block text-sm font-medium text-gray-700">UPI ID</label>
                                <input type="text" id="upi-id" placeholder="yourname@bank" class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
                            </div>
                             <!-- Net Banking Details -->
                            <div id="netbanking-content" class="payment-pane hidden">
                                <label for="bank-select" class="block text-sm font-medium text-gray-700">Select Bank</label>
                                <select id="bank-select" class="mt-1 block w-full px-3 py-2 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                                    <option>State Bank of India</option>
                                    <option>HDFC Bank</option>
                                    <option>ICICI Bank</option>
                                    <option>Axis Bank</option>
                                </select>
                            </div>
                             <!-- COD Details -->
                             <div id="cod-content" class="payment-pane hidden text-center bg-gray-50 p-4 rounded-lg">
                                <p class="text-sm text-gray-600">You will pay in cash upon delivery of the items.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side: Order Summary -->
                <div class="lg:col-span-2">
                    <div class="bg-white p-6 md:p-8 rounded-lg shadow-md sticky top-28">
                        <h2 class="text-xl font-semibold mb-6">Order Summary</h2>
                        <div class="space-y-4">
                            <div class="flex justify-between">
                                <span class="text-gray-600">Fresh Tomatoes (50 Quintal)</span>
                                <span class="font-medium">₹90,000</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Shipping & Handling</span>
                                <span class="font-medium">₹2,500</span>
                            </div>
                            <div class="flex justify-between border-t pt-4">
                                <span class="text-lg font-bold">Total</span>
                                <span class="text-lg font-bold text-green-600">₹92,500</span>
                            </div>
                        </div>
                        <div class="mt-8">
                            <h3 class="font-semibold mb-2">Seller Information</h3>
                            <p class="text-gray-600">Ram Patil</p>
                            <p class="text-gray-600">Nashik, Maharashtra</p>
                        </div>
                         <button id="payment-button" type="submit" class="w-full mt-6 py-3 px-4 text-white font-semibold bg-green-600 rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 flex items-center justify-center">
                            <i data-lucide="lock" class="w-4 h-4 mr-2"></i>
                            Pay Securely
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        lucide.createIcons();

        const paymentTabs = document.querySelectorAll('.payment-tab');
        const paymentPanes = document.querySelectorAll('.payment-pane');
        const paymentButton = document.getElementById('payment-button');

        paymentTabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const method = tab.dataset.paymentMethod;

                // Update tabs
                paymentTabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');

                // Update content panes
                paymentPanes.forEach(pane => {
                    if (pane.id === `${method}-content`) {
                        pane.classList.remove('hidden');
                    } else {
                        pane.classList.add('hidden');
                    }
                });
                
                // Update button text
                switch(method) {
                    case 'cod':
                        paymentButton.innerHTML = `<i data-lucide="package-check" class="w-4 h-4 mr-2"></i> Place Order`;
                        break;
                    case 'upi':
                        paymentButton.innerHTML = `<i data-lucide="send" class="w-4 h-4 mr-2"></i> Pay with UPI`;
                        break;
                    default:
                         paymentButton.innerHTML = `<i data-lucide="lock" class="w-4 h-4 mr-2"></i> Pay Securely`;
                }
                lucide.createIcons(); // Re-render icon in button
            });
        });

    </script>
</body>
</html>

