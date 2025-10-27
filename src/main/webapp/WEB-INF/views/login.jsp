<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Smart Kisan Assistant</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }
        .btn-primary {
            background-color: #22c55e; /* green-500 */
            color: white;
        }
        .btn-primary:hover {
            background-color: #16a34a; /* green-600 */
        }
    </style>
</head>
<body class="bg-gray-50">

    <div class="min-h-screen flex flex-col items-center justify-center bg-cover bg-center" style="background-image: url('https://images.unsplash.com/photo-1499529112087-7cb3b7226cd2?q=80&w=2070&auto=format&fit=crop');">
        <div class="absolute inset-0 bg-black opacity-50"></div>
        
        <div class="relative w-full max-w-md p-8 space-y-6 bg-white rounded-xl shadow-lg z-10">
            <div class="text-center">
                <div class="flex justify-center mb-4">
                     <div class="bg-green-100 p-3 rounded-full">
                        <i data-lucide="sprout" class="w-10 h-10 text-green-600"></i>
                    </div>
                </div>
                <h1 class="text-3xl font-bold text-gray-900">Welcome Back</h1>
                <p class="mt-2 text-sm text-gray-600">Sign in to access your Smart Kisan Assistant</p>
            </div>
            
            <form id="login-form" class="space-y-6" method="POST" action="/login">
                <div>
                    <label for="email" class="text-sm font-medium text-gray-700">Email Address</label>
                    <input id="email" name="email" type="email" autocomplete="email" required 
                           class="mt-1 block w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                
                <div>
                    <div class="flex items-center justify-between">
                        <label for="password" class="text-sm font-medium text-gray-700">Password</label>
                        <a href="#" class="text-sm font-medium text-green-600 hover:text-green-500">Forgot password?</a>
                    </div>
                    <input id="password" name="password" type="password" autocomplete="current-password" required 
                           class="mt-1 block w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                
                <div>
                    <button type="submit" class="w-full btn btn-primary">
                        Sign In
                    </button>
                </div>
            </form>
            
            <p class="text-sm text-center text-gray-500">
                Don't have an account? 
                <a href="/signup" class="font-medium text-green-600 hover:text-green-500">Sign up</a>
            </p>
        </div>
    </div>

 
</body>
</html>
