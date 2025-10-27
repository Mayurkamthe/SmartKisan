<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Selling Analytics - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <script src="https://unpkg.com/lucide@latest"></script>
    <!-- Include Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
      body {
        font-family: "Inter", sans-serif;
        background-color: #f9fafb; /* gray-50 */
      }
    </style>
  </head>
  <body>
    <!-- Header with Navigation -->
    <header class="bg-white shadow-md sticky top-0 z-40">
      <div
        class="container mx-auto px-4 sm:px-6 lg:px-8 py-4 flex justify-between items-center"
      >
        <div class="flex items-center space-x-2">
          <i data-lucide="sprout" class="w-8 h-8 text-green-600"></i>
          <h1 class="text-2xl font-bold text-gray-800">
            Smart Kisan Assistant
          </h1>
        </div>
        <nav class="hidden md:flex items-center space-x-6">
          <a
            href="/farmerDashboard"
            class="text-gray-600 hover:text-green-600 font-medium transition-colors"
            >Farmer Dashboard</a
          >
          <a
            href="/sellerDashboard"
            class="text-gray-600 hover:text-green-600 font-medium transition-colors"
            >Seller Dashboard</a
          >
          <a
            href="/login"
            class="text-gray-600 hover:text-green-600 font-medium transition-colors"
            >Logout</a
          >
        </nav>
        <button class="md:hidden">
          <i data-lucide="menu" class="w-6 h-6"></i>
        </button>
      </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Page Header & Date Filter -->
      <div class="flex flex-col md:flex-row justify-between items-center mb-8">
        <div>
          <h2 class="text-3xl font-bold text-gray-800">Selling Analytics</h2>
          <p class="text-gray-600 mt-1">
            Track your performance and gain insights into your sales.
          </p>
        </div>
        <div class="mt-4 md:mt-0">
          <select
            id="date-range-filter"
            class="bg-white border border-gray-300 rounded-md shadow-sm px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
          >
            <option value="7">Last 7 Days</option>
            <option value="30" selected>Last 30 Days</option>
            <option value="90">Last 90 Days</option>
            <option value="all">All Time</option>
          </select>
        </div>
      </div>

      <!-- Key Metrics (KPIs) -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div class="bg-white p-6 rounded-lg shadow-md">
          <p class="text-gray-500 text-sm flex items-center">
            <i data-lucide="indian-rupee" class="w-4 h-4 mr-1"></i> Total
            Revenue
          </p>
          <p class="text-3xl font-bold mt-2">₹1,25,500</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-md">
          <p class="text-gray-500 text-sm flex items-center">
            <i data-lucide="shopping-cart" class="w-4 h-4 mr-1"></i> Total
            Orders
          </p>
          <p class="text-3xl font-bold mt-2">42</p>
        </div>
        <div class="bg-white p-6 rounded-lg shadow-md">
          <p class="text-gray-500 text-sm flex items-center">
            <i data-lucide="users" class="w-4 h-4 mr-1"></i> New Customers
          </p>
          <p class="text-3xl font-bold mt-2">15</p>
        </div>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Main Chart: Sales Over Time -->
        <div class="lg:col-span-2 bg-white p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-bold mb-4">Revenue Over Time</h3>
          <div>
            <canvas id="salesChart"></canvas>
          </div>
        </div>

        <!-- Side Column: Top Products -->
        <div class="lg:col-span-1 bg-white p-6 rounded-lg shadow-md">
          <h3 class="text-xl font-bold mb-4">Top Performing Products</h3>
          <div class="space-y-4">
            <!-- Product 1 -->
            <div>
              <div class="flex justify-between text-sm mb-1">
                <span class="font-medium">Fresh Tomatoes</span>
                <span class="text-gray-600">₹45,000</span>
              </div>
              <div class="w-full bg-gray-200 rounded-full h-2.5">
                <div
                  class="bg-green-600 h-2.5 rounded-full"
                  style="width: 75%"
                ></div>
              </div>
            </div>
            <!-- Product 2 -->
            <div>
              <div class="flex justify-between text-sm mb-1">
                <span class="font-medium">Sona Masoori Rice</span>
                <span class="text-gray-600">₹32,000</span>
              </div>
              <div class="w-full bg-gray-200 rounded-full h-2.5">
                <div
                  class="bg-green-600 h-2.5 rounded-full"
                  style="width: 55%"
                ></div>
              </div>
            </div>
            <!-- Product 3 -->
            <div>
              <div class="flex justify-between text-sm mb-1">
                <span class="font-medium">Onions</span>
                <span class="text-gray-600">₹18,500</span>
              </div>
              <div class="w-full bg-gray-200 rounded-full h-2.5">
                <div
                  class="bg-green-600 h-2.5 rounded-full"
                  style="width: 30%"
                ></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script>
      lucide.createIcons();

      // --- Chart.js Integration ---
      const ctx = document.getElementById("salesChart").getContext("2d");

      // Mock data for the chart. In a real application, you would fetch this from your backend.
      const salesData = {
        labels: [
          "Week 1",
          "Week 2",
          "Week 3",
          "Week 4",
          "Week 5",
          "Week 6",
          "Week 7",
          "Week 8",
        ],
        datasets: [
          {
            label: "Revenue (₹)",
            data: [12000, 19000, 15000, 25000, 22000, 30000, 28000, 35000],
            backgroundColor: "rgba(34, 197, 94, 0.1)",
            borderColor: "rgba(22, 163, 74, 1)",
            borderWidth: 2,
            fill: true,
            tension: 0.4, // Makes the line smooth
          },
        ],
      };

      const salesChart = new Chart(ctx, {
        type: "line",
        data: salesData,
        options: {
          responsive: true,
          maintainAspectRatio: true,
          scales: {
            y: {
              beginAtZero: true,
              ticks: {
                // Format ticks to show '₹'
                callback: function (value, index, values) {
                  return "₹" + value.toLocaleString("en-IN");
                },
              },
            },
          },
          plugins: {
            legend: {
              display: false,
            },
            tooltip: {
              callbacks: {
                label: function (context) {
                  let label = context.dataset.label || "";
                  if (label) {
                    label += ": ";
                  }
                  if (context.parsed.y !== null) {
                    label += "₹" + context.parsed.y.toLocaleString("en-IN");
                  }
                  return label;
                },
              },
            },
          },
        },
      });

      // TODO: Add logic to the date-range-filter to fetch new data and update the chart and KPIs.
    </script>
  </body>
</html>
