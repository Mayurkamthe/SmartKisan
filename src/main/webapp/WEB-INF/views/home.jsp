<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://placehold.co/1920x1080/166534/FFFFFF?text=Lush+Farm');
            background-size: cover;
            background-position: center;
        }
        /* Style for the mobile menu transition */
        #mobile-menu {
            transition: transform 0.3s ease-in-out;
        }
    </style>
</head>
<body class="bg-gray-50">

    <!-- Header -->
    <header class="bg-white shadow-md sticky top-0 z-50">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i data-lucide="sprout" class="w-8 h-8 text-green-600"></i>
                <h1 class="text-2xl font-bold text-gray-800">Smart Kisan Assistant</h1>
            </div>
            <!-- Desktop Navigation -->
            <nav class="hidden md:flex items-center space-x-4">
                <a href="/login" class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition-colors">Login</a>
                <a href="/signup" class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-lg transition-colors">Sign Up</a>
            </nav>
            <!-- Mobile Menu Button -->
            <button id="mobile-menu-button" class="md:hidden p-2 rounded-md text-gray-600 hover:text-green-600 hover:bg-gray-100">
                 <i data-lucide="menu" class="w-6 h-6"></i>
            </button>
        </div>
    </header>

    <!-- Mobile Menu (Hidden by default) -->
    <div id="mobile-menu" class="fixed top-0 right-0 h-full w-64 bg-white shadow-xl z-50 transform translate-x-full md:hidden">
        <div class="flex justify-end p-4">
            <button id="close-menu-button" class="p-2 rounded-md text-gray-600 hover:text-green-600 hover:bg-gray-100">
                <i data-lucide="x" class="w-6 h-6"></i>
            </button>
        </div>
        <nav class="flex flex-col p-4 space-y-4">
             <a href="/login" class="bg-green-600 text-white font-bold py-2 px-4 rounded-lg text-center">Login</a>
             <a href="/signup" class="bg-gray-200 text-gray-800 font-bold py-2 px-4 rounded-lg text-center">Sign Up</a>
        </nav>
    </div>


    <!-- Hero Section -->
    <section class="hero-section text-white">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-20 md:py-24 text-center">
            <h2 class="text-4xl md:text-5xl font-extrabold leading-tight">Empowering Indian Farmers with AI Technology</h2>
            <p class="mt-4 text-lg md:text-xl max-w-3xl mx-auto text-gray-200">Get intelligent recommendations for crop rotation, fertilizer usage, and instantly detect plant diseases with a single photo. Your smart farming partner is here.</p>
            <div class="mt-8">
                <a href="/signup" class="bg-green-600 hover:bg-green-700 text-white font-bold py-3 px-8 rounded-full text-lg transition-transform transform hover:scale-105 inline-block">Get Started for Free</a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <h3 class="text-3xl font-bold text-gray-800">Key Features</h3>
                <p class="text-gray-600 mt-2">Everything you need to make farming smarter and more profitable.</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <!-- Feature 1: AI Recommendations -->
                <div class="text-center p-6 border border-gray-200 rounded-lg">
                    <div class="flex items-center justify-center h-16 w-16 rounded-full bg-green-100 mx-auto mb-4">
                        <i data-lucide="lightbulb" class="w-8 h-8 text-green-600"></i>
                    </div>
                    <h4 class="text-xl font-semibold mb-2">AI Recommendations</h4>
                    <p class="text-gray-600">Receive tailored advice on crop rotation, fertilizer, and water needs based on your farm's location and soil type.</p>
                </div>
                <!-- Feature 2: Disease Detection -->
                <div class="text-center p-6 border border-gray-200 rounded-lg">
                    <div class="flex items-center justify-center h-16 w-16 rounded-full bg-green-100 mx-auto mb-4">
                        <i data-lucide="scan-line" class="w-8 h-8 text-green-600"></i>
                    </div>
                    <h4 class="text-xl font-semibold mb-2">Disease Detection</h4>
                    <p class="text-gray-600">Simply upload a photo of a plant leaf, and our AI will analyze it for early signs of common diseases.</p>
                </div>
                <!-- Feature 3: Crop Information Guide -->
                <div class="text-center p-6 border border-gray-200 rounded-lg">
                    <div class="flex items-center justify-center h-16 w-16 rounded-full bg-green-100 mx-auto mb-4">
                        <i data-lucide="book-open" class="w-8 h-8 text-green-600"></i>
                    </div>
                    <h4 class="text-xl font-semibold mb-2">Crop Information Guide</h4>
                    <p class="text-gray-600">Access a comprehensive, searchable guide to various crops, including sowing seasons, pests, and more.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-8">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <p>&copy; 2025 Smart Kisan Assistant. All rights reserved.</p>
            <p class="text-sm text-gray-400 mt-2">Made for Hackathon with ❤️</p>
        </div>
    </footer>

    <script>
        lucide.createIcons();

        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');
        const closeMenuButton = document.getElementById('close-menu-button');

        // Function to open the menu
        const openMenu = () => {
            mobileMenu.classList.remove('translate-x-full');
            mobileMenu.classList.add('translate-x-0');
        };

        // Function to close the menu
        const closeMenu = () => {
            mobileMenu.classList.remove('translate-x-0');
            mobileMenu.classList.add('translate-x-full');
        };

        mobileMenuButton.addEventListener('click', openMenu);
        closeMenuButton.addEventListener('click', closeMenu);
    </script>
</body>
</html>

