<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Signup - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb;
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen py-8">
    <div class="w-full max-w-md p-8 space-y-6 bg-white rounded-xl shadow-lg">
        <div class="text-center">
             <div class="flex justify-center mb-4">
                 <i data-lucide="user-plus" class="w-12 h-12 text-green-600"></i>
            </div>
            <h1 class="text-3xl font-bold text-gray-900">Create a Buyer Account</h1>
            <p class="mt-2 text-gray-600">Join our network to connect with local farmers.</p>
        </div>
        <form class="space-y-4"  method="post" action="/buyerRegister">
            <div>
                <label for="company-name" class="text-sm font-medium text-gray-700">Full Name / Company Name</label>
                <input type="text" id="company-name" required class="mt-1 block w-full px-4 py-2 text-gray-900 bg-gray-50 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
            </div>
            <div>
                <label for="email" class="text-sm font-medium text-gray-700">Email Address</label>
                <input type="email" id="email" required class="mt-1 block w-full px-4 py-2 text-gray-900 bg-gray-50 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
            </div>
             <div>
                <label for="password" class="text-sm font-medium text-gray-700">Password</label>
                <input type="password" id="password" required class="mt-1 block w-full px-4 py-2 text-gray-900 bg-gray-50 border border-gray-300 rounded-md focus:outline-none focus:ring-green-500 focus:border-green-500">
            </div>
            <button type="submit" class="w-full px-4 py-2 text-white bg-green-600 rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                Create Account
            </button>
        </form>
        <p class="text-sm text-center text-gray-500">
            Already have an account? <a href="buyer/buyerLogin" class="font-medium text-green-600 hover:underline">Log in</a>
        </p>
    </div>
    <script>
        lucide.createIcons();
    </script>
</body>
</html>
