<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Farm & History - Smart Kisan Assistant</title>
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
                <a href="/myFarm" class="text-green-600 border-b-2 border-green-600 font-bold">My Farm & History</a>
                <a href="/login" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Logout</a>
            </nav>
            <button class="md:hidden">
                 <i data-lucide="menu" class="w-6 h-6"></i>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            
            <!-- Left Column: User's Farm Details -->
            <aside class="lg:col-span-1">
                <div class="card p-6">
                    <div class="flex items-center space-x-3 mb-4">
                        <i data-lucide="map-pin" class="w-6 h-6 text-green-600"></i>
                        <h2 class="text-xl font-semibold">My Farm Details</h2>
                    </div>
                    <div class="space-y-3 text-gray-700">
                        <p><strong>Farmer:</strong> Mayur Kamthe</p>
                        <p><strong>Location:</strong> Pune, Maharashtra</p>
                        <p><strong>Soil Type:</strong> Black Soil</p>
                    </div>
                    <button class="w-full mt-6 bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-lg transition-colors">
                        Edit Details
                    </button>
                </div>
            </aside>

            <!-- Right Column: Activity History -->
            <section class="lg:col-span-2">
                 <div class="flex items-center space-x-3 mb-4">
                    <i data-lucide="history" class="w-6 h-6 text-gray-700"></i>
                    <h2 class="text-2xl font-semibold text-gray-800">Activity History</h2>
                </div>

                <div class="space-y-6">
                    <!-- History Item 1: Disease Scan -->
                    <div class="card p-5 flex items-start space-x-4">
                        <div class="bg-red-100 p-3 rounded-full">
                           <i data-lucide="scan-line" class="w-6 h-6 text-red-600"></i>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-800">Plant Disease Scan</p>
                            <p class="text-sm text-gray-500">October 09, 2025</p>
                            <p class="mt-2 text-gray-700">Scanned a tomato leaf. AI detected <strong class="text-red-600">Early Blight</strong>. Treatment plan was generated.</p>
                        </div>
                    </div>

                    <!-- History Item 2: Recommendation Request -->
                    <div class="card p-5 flex items-start space-x-4">
                         <div class="bg-green-100 p-3 rounded-full">
                           <i data-lucide="lightbulb" class="w-6 h-6 text-green-600"></i>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-800">AI Farming Recommendation</p>
                            <p class="text-sm text-gray-500">October 02, 2025</p>
                            <p class="mt-2 text-gray-700">Requested advice for <strong class="text-gray-900">Black Soil</strong> in <strong class="text-gray-900">Pune</strong>. Recommendations for crop rotation and fertilizer were provided.</p>
                        </div>
                    </div>

                     <!-- History Item 3: Healthy Scan -->
                    <div class="card p-5 flex items-start space-x-4">
                        <div class="bg-blue-100 p-3 rounded-full">
                           <i data-lucide="shield-check" class="w-6 h-6 text-blue-600"></i>
                        </div>
                        <div>
                            <p class="font-semibold text-gray-800">Plant Disease Scan</p>
                            <p class="text-sm text-gray-500">September 28, 2025</p>
                            <p class="mt-2 text-gray-700">Scanned a sugarcane leaf. Plant was identified as <strong class="text-blue-600">Healthy</strong>.</p>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
