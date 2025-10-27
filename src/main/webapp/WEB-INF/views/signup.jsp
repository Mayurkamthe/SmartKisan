<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Smart Kisan Assistant</title>
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

    <div class="min-h-screen flex flex-col items-center justify-center bg-cover bg-center py-12 px-4 sm:px-6 lg:px-8" style="background-image: url('https://images.unsplash.com/photo-1625246333195-78d9c38ad449?q=80&w=2070&auto=format&fit=crop');">
        <div class="absolute inset-0 bg-black opacity-60"></div>
        
        <div class="relative w-full max-w-lg p-8 space-y-6 bg-white rounded-xl shadow-lg z-10">
            <div class="text-center">
                <div class="flex justify-center mb-4">
                     <div class="bg-green-100 p-3 rounded-full">
                        <i data-lucide="user-plus" class="w-10 h-10 text-green-600"></i>
                    </div>
                </div>
                <h1 class="text-3xl font-bold text-gray-900">Create an Account</h1>
                <p class="mt-2 text-sm text-gray-600">Join our community of smart farmers</p>
            </div>
            
            <form id="signup-form" class="space-y-4" action="/register" method="POST">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label for="first-name" class="text-sm font-medium text-gray-700">First Name</label>
                        <input id="first-name" name="firstname" type="text" autocomplete="given-name" required 
                               class="mt-1 block w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500">
                    </div>
                    <div>
                        <label for="last-name" class="text-sm font-medium text-gray-700">Last Name</label>
                        <input id="last-name" name="lastname" type="text" autocomplete="family-name" required 
                               class="mt-1 block w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500">
                    </div>
                </div>

                <div>
                    <label for="email" class="text-sm font-medium text-gray-700">Email Address</label>
                    <input id="email" name="email" type="email" autocomplete="email" required 
                           class="mt-1 block w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500">
                </div>
                
                <div>
                    <label for="password" class="text-sm font-medium text-gray-700">Password</label>
                    <div class="relative mt-1">
                        <input id="password" name="password" type="password" autocomplete="new-password" required 
                               class="block w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-lg shadow-sm placeholder-gray-400 focus:outline-none focus:ring-green-500 focus:border-green-500 pr-10">
                        <button type="button" id="toggle-password" class="absolute inset-y-0 right-0 flex items-center pr-3 cursor-pointer">
                            <i id="password-icon" data-lucide="eye" class="h-5 w-5 text-gray-400"></i>
                        </button>
                    </div>
                </div>
                
                <div>
                    <button type="submit" class="w-full btn btn-primary mt-2">
                        Create Account
                    </button>
                </div>
            </form>
            
            <p class="text-sm text-center text-gray-500">
                Already have an account? 
                <a href="/login" class="font-medium text-green-600 hover:text-green-500">Sign in</a>
            </p>
        </div>
    </div>

    <script>
        lucide.createIcons();

        const signupForm = document.getElementById('signup-form');
        const passwordInput = document.getElementById('password');
        const togglePasswordButton = document.getElementById('toggle-password');
        const passwordIcon = document.getElementById('password-icon');

        togglePasswordButton.addEventListener('click', () => {
            // Check the current type of the input
            const isPassword = passwordInput.getAttribute('type') === 'password';
            
            // Set the new type and icon
            passwordInput.setAttribute('type', isPassword ? 'text' : 'password');
            passwordIcon.setAttribute('data-lucide', isPassword ? 'eye-off' : 'eye');
            
            // Re-render the Lucide icons to show the change
            lucide.createIcons();
        });

 
    </script>
</body>
</html>

