<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Ordering - Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .slide {
            display: none;
            animation: fadeIn 1s ease-in-out;
        }

        .slide.active {
            display: block;
        }

        .animate-slide-in {
            animation: slideIn 0.8s ease-out forwards;
        }

        .animate-float {
            animation: float 3s ease-in-out infinite;
        }

        .card-hover {
            transition: all 0.3s ease;
        }

        .card-hover:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .gradient-overlay {
            background: linear-gradient(to bottom, rgba(0,0,0,0.4), rgba(0,0,0,0.6));
        }

        html {
            scroll-behavior: smooth;
        }

        .feature-card {
            transition: all 0.3s ease;
            opacity: 0;
            transform: translateY(20px);
        }

        .feature-card.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body class="bg-gray-50">
<%@ include file="header.jsp" %>
    <!-- Full Screen Banner with Slideshow -->
    <section id="banner" class="relative h-screen w-full overflow-hidden">
        <!-- Slide 1 -->
        <div class="slide active absolute inset-0">
            <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=1920&h=1080&fit=crop"
                 alt="Delicious Burger" class="w-full h-full object-cover">
            <div class="gradient-overlay absolute inset-0"></div>
        </div>

        <!-- Slide 2 -->
        <div class="slide absolute inset-0">
            <img src="https://images.unsplash.com/photo-1513104890138-7c749659a591?w=1920&h=1080&fit=crop"
                 alt="Pizza" class="w-full h-full object-cover">
            <div class="gradient-overlay absolute inset-0"></div>
        </div>

        <!-- Slide 3 -->
        <div class="slide absolute inset-0">
            <img src="https://images.unsplash.com/photo-1562059390-a761a084768e?w=1920&h=1080&fit=crop"
                 alt="Fried Chicken" class="w-full h-full object-cover">
            <div class="gradient-overlay absolute inset-0"></div>
        </div>

        <!-- Slide 4 -->
        <div class="slide absolute inset-0">
            <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=1920&h=1080&fit=crop"
                 alt="Fast Food Feast" class="w-full h-full object-cover">
            <div class="gradient-overlay absolute inset-0"></div>
        </div>

        <!-- Banner Content -->
        <div class="absolute inset-0 flex flex-col items-center justify-center text-white z-10">
            <h1 class="text-6xl md:text-8xl font-bold mb-6 animate-slide-in text-center px-4">
                Delicious Food,<br/>Delivered Fast
            </h1>
            <p class="text-xl md:text-2xl mb-12 animate-slide-in text-center px-4" style="animation-delay: 0.2s;">
                Order your favorite meals from the comfort of your home
            </p>
            <a href="#main-content"
               class="bg-orange-500 hover:bg-orange-600 text-white px-12 py-4 rounded-full text-xl font-semibold transition-all duration-300 transform hover:scale-110 shadow-2xl animate-slide-in"
               style="animation-delay: 0.4s;">
                Get Started
            </a>
        </div>

        <!-- Scroll Indicator -->
        <div class="absolute bottom-10 left-1/2 transform -translate-x-1/2 animate-bounce z-10">
            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
            </svg>
        </div>
    </section>

    <!-- Main Content Section -->
    <section id="main-content" class="py-20 px-4 md:px-8 lg:px-16">
        <div class="max-w-7xl mx-auto">

            <!-- Main Action Cards -->
            <div class="mb-20">
                <h2 class="text-4xl md:text-5xl font-bold text-center mb-4 text-gray-800">
                    What Would You Like To Do?
                </h2>
                <p class="text-center text-gray-600 text-lg mb-12">
                    Choose from our quick access menu
                </p>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <!-- Food Items Card -->
                    <a href="/products/user/list" class="card-hover bg-white rounded-2xl shadow-lg overflow-hidden">
                        <div class="gradient-bg h-48 flex items-center justify-center">
                            <svg class="w-24 h-24 text-white animate-float" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                        </div>
                        <div class="p-6">
                            <h3 class="text-2xl font-bold mb-3 text-gray-800">Food Items</h3>
                            <p class="text-gray-600">Browse our delicious menu and discover your next favorite meal</p>
                        </div>
                    </a>

                    <!-- My Cart Card -->
                    <a href="/cart" class="card-hover bg-white rounded-2xl shadow-lg overflow-hidden">
                        <div class="bg-gradient-to-br from-green-400 to-blue-500 h-48 flex items-center justify-center">
                            <svg class="w-24 h-24 text-white animate-float" style="animation-delay: 0.2s;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
                            </svg>
                        </div>
                        <div class="p-6">
                            <h3 class="text-2xl font-bold mb-3 text-gray-800">My Cart</h3>
                            <p class="text-gray-600">Review your selected items and proceed to checkout</p>
                        </div>
                    </a>

                    <!-- My Orders Card -->
                    <a href="/orders" class="card-hover bg-white rounded-2xl shadow-lg overflow-hidden">
                        <div class="bg-gradient-to-br from-orange-400 to-pink-500 h-48 flex items-center justify-center">
                            <svg class="w-24 h-24 text-white animate-float" style="animation-delay: 0.4s;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                            </svg>
                        </div>
                        <div class="p-6">
                            <h3 class="text-2xl font-bold mb-3 text-gray-800">My Orders</h3>
                            <p class="text-gray-600">Track your orders and view your order history</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Why Choose Us Section -->
            <div class="mb-20">
                <h2 class="text-4xl md:text-5xl font-bold text-center mb-4 text-gray-800">
                    Why Choose Us?
                </h2>
                <p class="text-center text-gray-600 text-lg mb-12">
                    We make food ordering simple, fast, and delicious
                </p>

                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <div class="feature-card text-center p-6 bg-white rounded-xl shadow-md">
                        <div class="bg-purple-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-10 h-10 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-bold mb-2 text-gray-800">Fast Delivery</h3>
                        <p class="text-gray-600">Get your food delivered hot and fresh in under 30 minutes</p>
                    </div>

                    <div class="feature-card text-center p-6 bg-white rounded-xl shadow-md">
                        <div class="bg-green-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-10 h-10 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-bold mb-2 text-gray-800">Quality Food</h3>
                        <p class="text-gray-600">We partner with the best restaurants to ensure top quality</p>
                    </div>

                    <div class="feature-card text-center p-6 bg-white rounded-xl shadow-md">
                        <div class="bg-blue-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-10 h-10 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-bold mb-2 text-gray-800">Best Prices</h3>
                        <p class="text-gray-600">Enjoy great deals and discounts on your favorite meals</p>
                    </div>

                    <div class="feature-card text-center p-6 bg-white rounded-xl shadow-md">
                        <div class="bg-orange-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-4">
                            <svg class="w-10 h-10 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10h4.764a2 2 0 011.789 2.894l-3.5 7A2 2 0 0115.263 21h-4.017c-.163 0-.326-.02-.485-.06L7 20m7-10V5a2 2 0 00-2-2h-.095c-.5 0-.905.405-.905.905 0 .714-.211 1.412-.608 2.006L7 11v9m7-10h-2M7 20H5a2 2 0 01-2-2v-6a2 2 0 012-2h2.5"></path>
                            </svg>
                        </div>
                        <h3 class="text-xl font-bold mb-2 text-gray-800">Easy to Use</h3>
                        <p class="text-gray-600">Simple ordering process with just a few clicks</p>
                    </div>
                </div>
            </div>

            <!-- Popular Categories Section -->
            <div class="mb-20">
                <h2 class="text-4xl md:text-5xl font-bold text-center mb-4 text-gray-800">
                    Popular Categories
                </h2>
                <p class="text-center text-gray-600 text-lg mb-12">
                    Explore our most loved food categories
                </p>

                <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                    <div class="feature-card bg-gradient-to-br from-red-400 to-red-600 rounded-xl p-8 text-center text-white cursor-pointer transform hover:scale-105 transition-all duration-300">
                        <div class="text-5xl mb-3">🍔</div>
                        <h3 class="text-xl font-bold">Burgers</h3>
                    </div>

                    <div class="feature-card bg-gradient-to-br from-yellow-400 to-orange-500 rounded-xl p-8 text-center text-white cursor-pointer transform hover:scale-105 transition-all duration-300">
                        <div class="text-5xl mb-3">🍕</div>
                        <h3 class="text-xl font-bold">Pizza</h3>
                    </div>

                    <div class="feature-card bg-gradient-to-br from-green-400 to-teal-500 rounded-xl p-8 text-center text-white cursor-pointer transform hover:scale-105 transition-all duration-300">
                        <div class="text-5xl mb-3">🥗</div>
                        <h3 class="text-xl font-bold">Salads</h3>
                    </div>

                    <div class="feature-card bg-gradient-to-br from-purple-400 to-pink-500 rounded-xl p-8 text-center text-white cursor-pointer transform hover:scale-105 transition-all duration-300">
                        <div class="text-5xl mb-3">🍰</div>
                        <h3 class="text-xl font-bold">Desserts</h3>
                    </div>
                </div>
            </div>

            <!-- Call to Action -->
            <div class="bg-gradient-to-r from-purple-600 to-indigo-600 rounded-3xl p-12 text-center text-white shadow-2xl">
                <h2 class="text-4xl md:text-5xl font-bold mb-4">
                    Ready to Order?
                </h2>
                <p class="text-xl mb-8 opacity-90">
                    Join thousands of happy customers and enjoy delicious food delivered to your doorstep
                </p>
                <a href="/products/user/list"
                   class="inline-block bg-white text-purple-600 px-10 py-4 rounded-full text-lg font-semibold hover:bg-gray-100 transition-all duration-300 transform hover:scale-110 shadow-lg">
                    Start Ordering Now
                </a>
            </div>

        </div>
    </section>

    <script>
        // Slideshow functionality
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');

        function showSlide(n) {
            slides[currentSlide].classList.remove('active');
            currentSlide = (n + slides.length) % slides.length;
            slides[currentSlide].classList.add('active');
        }

        function nextSlide() {
            showSlide(currentSlide + 1);
        }

        // Change slide every 4 seconds
        setInterval(nextSlide, 4000);

        // Intersection Observer for feature cards animation
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, observerOptions);

        // Observe all feature cards
        document.querySelectorAll('.feature-card').forEach(card => {
            observer.observe(card);
        });

        // Smooth scroll for Get Started button
        document.querySelector('a[href="#main-content"]').addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelector('#main-content').scrollIntoView({
                behavior: 'smooth'
            });
        });
    </script>

</body>
<%@ include file="footer.jsp" %>
</html>