<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .animated-gradient {
            background: linear-gradient(-45deg, #3b82f6, #8b5cf6, #ec4899, #f59e0b);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }
        .glass-morphism {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }
        .float-animation {
            animation: float 6s ease-in-out infinite;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
        .modal-fade-in {
            animation: fadeIn 0.3s ease-out forwards;
        }
        .profile-card-hover:hover {
            transform: translateY(-5px);
            transition: all 0.3s ease;
        }
    </style>
</head>
<body class="flex flex-col min-h-screen">
    <!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />

    <!-- Main Content -->
    <main class="flex-grow relative p-4">
        <!-- Decorative floating elements -->
        <div class="absolute top-20 left-10 w-72 h-72 bg-blue-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 float-animation"></div>
        <div class="absolute top-40 right-10 w-72 h-72 bg-purple-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 float-animation" style="animation-delay: 2s;"></div>
        <div class="absolute bottom-20 left-1/2 w-72 h-72 bg-pink-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 float-animation" style="animation-delay: 4s;"></div>

        <!-- Profile Card Container -->
        <div class="flex items-center justify-center min-h-screen relative z-10">
            <div class="glass-morphism p-10 rounded-3xl shadow-2xl w-full max-w-2xl profile-card-hover">
                <!-- Profile Header -->
                <div class="text-center mb-8">
                    <div class="flex justify-center mb-4">
                        <div class="w-24 h-24 bg-gradient-to-br from-blue-600 to-purple-600 rounded-full flex items-center justify-center shadow-xl transform hover:rotate-6 transition-transform">
                            <svg class="w-14 h-14 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </div>
                    </div>
                    <h1 class="text-4xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">My Profile</h1>
                    <p class="text-gray-600 mt-2">Manage your account information</p>
                </div>

                <!-- Profile Details -->
                <div id="profileDetails" class="space-y-4 mb-8">
                    <div class="bg-gradient-to-r from-blue-50 to-purple-50 p-4 rounded-xl border border-blue-100 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="w-10 h-10 bg-blue-600 rounded-lg flex items-center justify-center mr-4 flex-shrink-0">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <div class="flex-1 min-w-0">
                                <span class="text-sm text-gray-500 font-medium">First Name</span>
                                <p class="text-gray-800 font-semibold text-lg truncate" id="firstName"></p>
                            </div>
                        </div>
                    </div>

                    <div class="bg-gradient-to-r from-purple-50 to-pink-50 p-4 rounded-xl border border-purple-100 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="w-10 h-10 bg-purple-600 rounded-lg flex items-center justify-center mr-4 flex-shrink-0">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <div class="flex-1 min-w-0">
                                <span class="text-sm text-gray-500 font-medium">Last Name</span>
                                <p class="text-gray-800 font-semibold text-lg truncate" id="lastName"></p>
                            </div>
                        </div>
                    </div>

                    <div class="bg-gradient-to-r from-pink-50 to-orange-50 p-4 rounded-xl border border-pink-100 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="w-10 h-10 bg-pink-600 rounded-lg flex items-center justify-center mr-4 flex-shrink-0">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                            <div class="flex-1 min-w-0">
                                <span class="text-sm text-gray-500 font-medium">Email</span>
                                <p class="text-gray-800 font-semibold text-lg truncate" id="email"></p>
                            </div>
                        </div>
                    </div>

                    <div class="bg-gradient-to-r from-orange-50 to-yellow-50 p-4 rounded-xl border border-orange-100 hover:shadow-md transition-shadow">
                        <div class="flex items-center">
                            <div class="w-10 h-10 bg-orange-600 rounded-lg flex items-center justify-center mr-4 flex-shrink-0">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                                </svg>
                            </div>
                            <div class="flex-1 min-w-0">
                                <span class="text-sm text-gray-500 font-medium">Role</span>
                                <p class="text-gray-800 font-semibold text-lg truncate" id="role"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Buttons -->
                <div class="mt-8 flex flex-col sm:flex-row justify-center gap-4">
                    <button id="editBtn"
                            class="px-6 py-3 bg-gradient-to-r from-blue-600 to-purple-600 text-white rounded-xl hover:from-blue-700 hover:to-purple-700 transition-all duration-300 font-semibold shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 active:scale-[0.98] flex items-center justify-center space-x-2">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                        </svg>
                        <span>Edit Profile</span>
                    </button>
                    <button id="deleteBtn"
                            class="px-6 py-3 bg-gradient-to-r from-red-600 to-pink-600 text-white rounded-xl hover:from-red-700 hover:to-pink-700 transition-all duration-300 font-semibold shadow-lg hover:shadow-xl transform hover:-translate-y-0.5 active:scale-[0.98] flex items-center justify-center space-x-2">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                        </svg>
                        <span>Delete Account</span>
                    </button>
                </div>
            </div>
        </div>
    </main>

    <!-- Edit Modal -->
    <div id="editModal" class="hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-60 z-50 p-4">
        <div class="bg-white rounded-2xl shadow-2xl w-full max-w-md p-8 modal-fade-in transform">
            <div class="flex items-center justify-between mb-6">
                <h2 class="text-3xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">Edit Profile</h2>
                <button id="cancelBtnTop" class="text-gray-400 hover:text-gray-600 transition-colors">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </div>

            <div id="editMessage" class="mb-4 text-sm text-center rounded-xl p-3 transition-all duration-300"></div>

            <form id="editForm" class="space-y-4">
                <div>
                    <label for="editFirstName" class="block text-sm font-semibold text-gray-700 mb-2">First Name</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </div>
                        <input type="text" id="editFirstName" name="firstName"
                               class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 bg-gray-50" required>
                    </div>
                </div>
                <div>
                    <label for="editLastName" class="block text-sm font-semibold text-gray-700 mb-2">Last Name</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </div>
                        <input type="text" id="editLastName" name="lastName"
                               class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 bg-gray-50" required>
                    </div>
                </div>
                <div>
                    <label for="editEmail" class="block text-sm font-semibold text-gray-700 mb-2">Email</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                        <input type="email" id="editEmail" name="email"
                               class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 bg-gray-50" required>
                    </div>
                </div>
                <div>
                    <label for="editPassword" class="block text-sm font-semibold text-gray-700 mb-2">Password</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                            </svg>
                        </div>
                        <input type="password" id="editPassword" name="password"
                               class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 bg-gray-50" required>
                    </div>
                </div>
                <div>
                    <label for="editConfirmPassword" class="block text-sm font-semibold text-gray-700 mb-2">Confirm Password</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <input type="password" id="editConfirmPassword" name="confirmPassword"
                               class="w-full pl-10 pr-4 py-3 border-2 border-gray-200 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-300 bg-gray-50" required>
                    </div>
                </div>
                <div class="flex justify-end space-x-3 pt-4">
                    <button type="button" id="cancelBtnBottom"
                            class="px-6 py-3 bg-gray-200 text-gray-700 rounded-xl hover:bg-gray-300 transition-all duration-300 font-semibold">Cancel</button>
                    <button type="submit"
                            class="px-6 py-3 bg-gradient-to-r from-green-600 to-emerald-500 text-white rounded-xl hover:from-green-700 hover:to-emerald-600 transition-all duration-300 font-semibold shadow-lg hover:shadow-xl">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

    <script>
        const editMessage = document.getElementById("editMessage");

        async function loadProfile() {
            const response = await fetch("${pageContext.request.contextPath}/api/user/profile");
            if (response.ok) {
                const data = await response.json();
                document.getElementById("firstName").textContent = data.firstName;
                document.getElementById("lastName").textContent = data.lastName;
                document.getElementById("email").textContent = data.email;
                document.getElementById("role").textContent = data.role;

                document.getElementById("editFirstName").value = data.firstName;
                document.getElementById("editLastName").value = data.lastName;
                document.getElementById("editEmail").value = data.email;
            } else {
                editMessage.textContent = "Failed to load profile.";
                editMessage.className = "mb-4 text-center text-red-500 bg-red-50 border border-red-200 rounded-xl p-3";
            }
        }

        document.getElementById("editBtn").addEventListener("click", () => {
            editMessage.textContent = '';
            editMessage.className = 'mb-4 text-sm text-center rounded-xl p-3 transition-all duration-300';
            document.getElementById("editModal").classList.remove("hidden");
        });

        document.getElementById("cancelBtnTop").addEventListener("click", () => {
            document.getElementById("editModal").classList.add("hidden");
        });

        document.getElementById("cancelBtnBottom").addEventListener("click", () => {
            document.getElementById("editModal").classList.add("hidden");
        });

        document.getElementById("editForm").addEventListener("submit", async function(e) {
            e.preventDefault();

            const password = document.getElementById("editPassword").value;
            const confirmPassword = document.getElementById("editConfirmPassword").value;

            editMessage.textContent = '';
            editMessage.className = 'mb-4 text-sm text-center rounded-xl p-3 transition-all duration-300';

            if (password !== confirmPassword) {
                editMessage.textContent = "Passwords do not match!";
                editMessage.classList.add("text-red-500", "bg-red-50", "border", "border-red-200");
                return;
            }

            const updateRequest = {
                firstName: document.getElementById("editFirstName").value,
                lastName: document.getElementById("editLastName").value,
                email: document.getElementById("editEmail").value,
                password: password,
                confirmPassword: confirmPassword
            };

            try {
                const response = await fetch("${pageContext.request.contextPath}/api/user/profile", {
                    method: "PUT",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(updateRequest)
                });

                const data = await response.json();

                if (response.ok) {
                    editMessage.textContent = "Profile updated successfully!";
                    editMessage.classList.add("text-green-500", "bg-green-50", "border", "border-green-200");
                    setTimeout(() => {
                        document.getElementById("editModal").classList.add("hidden");
                        loadProfile();
                    }, 1000);
                } else {
                    editMessage.textContent = data.error || "Update failed!";
                    editMessage.classList.add("text-red-500", "bg-red-50", "border", "border-red-200");
                }
            } catch (err) {
                console.error(err);
                editMessage.textContent = "Something went wrong!";
                editMessage.classList.add("text-red-500", "bg-red-50", "border", "border-red-200");
            }
        });

        // Delete Account
        document.getElementById("deleteBtn").addEventListener("click", async () => {
            if (!confirm("Are you sure you want to delete your account? This action cannot be undone.")) return;

            try {
                const response = await fetch("${pageContext.request.contextPath}/api/user/delete", {
                    method: "DELETE"
                });

                const data = await response.json();

                if (response.ok) {
                    alert(data.message || "Account deleted successfully!");
                    window.location.href = "${pageContext.request.contextPath}/dashboard";
                } else {
                    alert(data.error || "Failed to delete account.");
                }
            } catch (err) {
                console.error(err);
                alert("Something went wrong!");
            }
        });

        loadProfile();
    </script>
</body>
</html>