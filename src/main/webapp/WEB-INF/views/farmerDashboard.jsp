<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb; /* gray-50 */
        }
        /* Style for checked todo items */
        .task-item.checked label {
            text-decoration: line-through;
            color: #9ca3af; /* gray-400 */
        }
        #mobile-menu {
            transition: transform 0.3s ease-in-out;
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
            <!-- Desktop Navigation -->
            <nav class="hidden md:flex items-center space-x-6">
                <a href="#" class="text-green-600 border-b-2 border-green-600 font-bold">Dashboard</a>
                <a href="/sellerDashboard" class="text-gray-600 hover:text-green-600 font-medium transition-colors">sell</a>
                <a href="/Ai" class="text-gray-600 hover:text-green-600 font-medium transition-colors">AI Assistant</a>
                <a href="/myFarm" class="text-gray-600 hover:text-green-600 font-medium transition-colors">My Farm</a>
                <a href="/cropInfo" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Crop Guide</a>
                <a href="/sellAnalytics" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Sell Analytics</a>
                <a href="/login" class="text-gray-600 hover:text-green-600 font-medium transition-colors">Logout</a>
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
        <nav class="flex flex-col p-4 space-y-2">
            <a href="#" class="bg-green-100 text-green-700 font-bold py-2 px-4 rounded-lg">Dashboard</a>
            <a href="/Ai" class="text-gray-700 hover:bg-gray-100 py-2 px-4 rounded-lg">AI Assistant</a>
            <a href="/myFarm" class="text-gray-700 hover:bg-gray-100 py-2 px-4 rounded-lg">My Farm</a>
            <a href="/cropInfo" class="text-gray-700 hover:bg-gray-100 py-2 px-4 rounded-lg">Crop Guide</a>
            <a href="/login" class="border-t pt-4 mt-2 text-gray-700 hover:bg-gray-100 py-2 px-4 rounded-lg">Logout</a>
        </nav>
    </div>


    <!-- Main Content -->
    <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Welcome Header -->
        <div class="mb-8">
            <h2 class="text-3xl font-bold text-gray-800">Welcome back, Farmer!</h2>
            <p id="current-date" class="text-gray-600">Here's your farm's overview for today.</p>
        </div>

        <!-- At a Glance Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
            <!-- Weather Card -->
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center space-x-4">
                <i data-lucide="sun" class="w-12 h-12 text-yellow-500"></i>
                <div>
                    <p class="text-gray-500 text-sm">Current Weather (Pune)</p>
                    <p class="text-2xl font-bold">28°C, Sunny</p>
                </div>
            </div>
            <!-- Next Action Card -->
            <div class="bg-green-600 text-white p-6 rounded-lg shadow-md flex items-center space-x-4">
                <i data-lucide="alert-circle" class="w-12 h-12"></i>
                <div>
                    <p class="opacity-80 text-sm">Next Recommended Action</p>
                    <p class="text-2xl font-bold">Irrigate Wheat Crop</p>
                </div>
            </div>
            <!-- Recent Alert Card -->
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center space-x-4">
                <i data-lucide="shield-alert" class="w-12 h-12 text-red-500"></i>
                <div>
                    <p class="text-gray-500 text-sm">Recent Disease Alert</p>
                    <p class="text-2xl font-bold">Early Blight Detected</p>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Center Column: Was Right Column -->
            <div class="lg:col-span-2 space-y-8">
                 <!-- Market Prices -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-xl font-bold">Market Prices (Mandi Bhav)</h3>
                        <span class="text-sm text-gray-500">Location: Pune Market</span>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full text-left">
                            <thead>
                                <tr class="border-b">
                                    <th class="py-2">Crop</th>
                                    <th class="py-2">Price / Quintal</th>
                                    <th class="py-2">Trend</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="py-3 font-medium">Wheat (गेहूं)</td>
                                    <td class="py-3">₹2,125</td>
                                    <td class="py-3 flex items-center text-green-600"><i data-lucide="trending-up" class="w-4 h-4 mr-1"></i> +₹15</td>
                                </tr>
                                <tr class="border-t">
                                    <td class="py-3 font-medium">Cotton (कपास)</td>
                                    <td class="py-3">₹7,800</td>
                                    <td class="py-3 flex items-center text-red-600"><i data-lucide="trending-down" class="w-4 h-4 mr-1"></i> -₹50</td>
                                </tr>
                                <tr class="border-t">
                                    <td class="py-3 font-medium">Onion (प्याज)</td>
                                    <td class="py-3">₹1,550</td>
                                    <td class="py-3 flex items-center text-green-600"><i data-lucide="trending-up" class="w-4 h-4 mr-1"></i> +₹75</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- Recent Farm Activity -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-bold mb-4">Recent Farm Activity</h3>
                    <div class="flow-root">
                        <ul role="list" class="-mb-8">
                            <!-- Activity Item 1 -->
                            <li>
                                <div class="relative pb-8">
                                    <span class="absolute top-4 left-4 -ml-px h-full w-0.5 bg-gray-200" aria-hidden="true"></span>
                                    <div class="relative flex space-x-3">
                                        <div>
                                            <span class="h-8 w-8 rounded-full bg-red-500 flex items-center justify-center ring-8 ring-white">
                                                <i data-lucide="shield-alert" class="w-5 h-5 text-white"></i>
                                            </span>
                                        </div>
                                        <div class="min-w-0 flex-1 pt-1.5 flex justify-between space-x-4">
                                            <div>
                                                <p class="text-sm text-gray-500">Disease detected in <a href="#" class="font-medium text-gray-900">Tomato Crop</a></p>
                                            </div>
                                            <div class="text-right text-sm whitespace-nowrap text-gray-500">
                                                <time>2 days ago</time>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- Activity Item 2 -->
                            <li>
                                <div class="relative pb-8">
                                    <div class="relative flex space-x-3">
                                        <div>
                                            <span class="h-8 w-8 rounded-full bg-blue-500 flex items-center justify-center ring-8 ring-white">
                                                 <i data-lucide="lightbulb" class="w-5 h-5 text-white"></i>
                                            </span>
                                        </div>
                                        <div class="min-w-0 flex-1 pt-1.5 flex justify-between space-x-4">
                                            <div>
                                                <p class="text-sm text-gray-500">AI farming plan requested for <a href="#" class="font-medium text-gray-900">Sugarcane</a></p>
                                            </div>
                                            <div class="text-right text-sm whitespace-nowrap text-gray-500">
                                                <time>5 days ago</time>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Right Column: Was Left Column -->
            <div class="lg:col-span-1 space-y-8">
                <!-- My Farm Tasks -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-bold mb-4">My Farm Tasks</h3>
                    <div id="task-list" class="space-y-3">
                        <div class="flex items-center task-item">
                            <input id="task1" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-green-600 focus:ring-green-500">
                            <label for="task1" class="ml-3 block text-sm font-medium text-gray-700">Irrigate Wheat Crop (AI Suggestion)</label>
                        </div>
                        <div class="flex items-center task-item">
                            <input id="task2" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-green-600 focus:ring-green-500">
                            <label for="task2" class="ml-3 block text-sm font-medium text-gray-700">Buy fertilizer from market</label>
                        </div>
                    </div>
                    <form id="add-task-form" class="mt-4 flex space-x-2">
                        <input type="text" id="new-task-input" placeholder="Add a new task..." class="block w-full px-3 py-2 bg-white border border-gray-300 rounded-md shadow-sm text-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                        <button type="submit" class="bg-green-600 text-white p-2 rounded-md hover:bg-green-700"><i data-lucide="plus" class="w-5 h-5"></i></button>
                    </form>
                </div>
                 <!-- Agricultural News & Schemes -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-bold mb-4">Agricultural News & Schemes</h3>
                    <div class="space-y-4">
                        <div class="border-b pb-2">
                            <h4 class="font-semibold text-gray-800">New subsidy announced for drip irrigation systems.</h4>
                            <p class="text-sm text-gray-500">The government has launched the PM-KISAN 2.0 scheme...</p>
                            <a href="#" class="text-sm text-green-600 hover:underline">Read More &rarr;</a>
                        </div>
                        <div>
                            <h4 class="font-semibold text-gray-800">Weather advisory: Heavy rainfall expected in Maharashtra.</h4>
                            <p class="text-sm text-gray-500">Farmers are advised to take necessary precautions for their crops...</p>
                            <a href="#" class="text-sm text-green-600 hover:underline">Read More &rarr;</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        lucide.createIcons();
        
        // --- Set current date ---
        const dateElement = document.getElementById('current-date');
        const today = new Date();
        const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        dateElement.textContent += ` ${today.toLocaleDateString('en-IN', options)}`;

        // --- Interactive Task List Logic ---
        const taskList = document.getElementById('task-list');
        const addTaskForm = document.getElementById('add-task-form');
        const newTaskInput = document.getElementById('new-task-input');

        const handleTaskCheck = (e) => {
            if (e.target.type === 'checkbox') {
                e.target.closest('.task-item').classList.toggle('checked');
            }
        };

        const addTask = (taskText) => {
            const taskId = `task${Date.now()}`;
            const taskItem = document.createElement('div');
            taskItem.className = 'flex items-center task-item';
            taskItem.innerHTML = `
                <input id="${taskId}" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-green-600 focus:ring-green-500">
                <label for="${taskId}" class="ml-3 block text-sm font-medium text-gray-700">${taskText}</label>
            `;
            taskList.appendChild(taskItem);
        };

        addTaskForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const taskText = newTaskInput.value.trim();
            if (taskText) {
                addTask(taskText);
                newTaskInput.value = '';
            }
        });

        taskList.addEventListener('change', handleTaskCheck);
        
        // --- Mobile Menu Logic ---
        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');
        const closeMenuButton = document.getElementById('close-menu-button');

        const openMenu = () => {
            mobileMenu.classList.remove('translate-x-full');
            mobileMenu.classList.add('translate-x-0');
        };

        const closeMenu = () => {
            mobileMenu.classList.remove('translate-x-0');
            mobileMenu.classList.add('translate-x-full');
        };

        mobileMenuButton.addEventListener('click', openMenu);
        closeMenuButton.addEventListener('click', closeMenu);
    </script>
</body>
</html>

