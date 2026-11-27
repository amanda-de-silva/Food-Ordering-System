<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Refund</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
        }
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        .input-field {
            transition: all 0.3s ease;
        }
        .input-field:focus {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
    </style>
    <script>
        // Validate customer name
        function validateCustomerName(name) {
            const cleaned = name.trim();

            if (cleaned.length < 3) {
                return { valid: false, message: "Full name must be at least 3 characters" };
            }

            if (cleaned.length > 100) {
                return { valid: false, message: "Full name must not exceed 100 characters" };
            }

            if (!/^[a-zA-Z\s'-]+$/.test(cleaned)) {
                return { valid: false, message: "Full name can only contain letters, spaces, hyphens, and apostrophes" };
            }

            if (cleaned.split(' ').length < 2) {
                return { valid: false, message: "Please enter first and last name" };
            }

            return { valid: true, message: "Valid full name" };
        }

        // Validate email
        function validateContactEmail(email) {
            const cleaned = email.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailRegex.test(cleaned)) {
                return { valid: false, message: "Please enter a valid email address" };
            }

            if (cleaned.length > 100) {
                return { valid: false, message: "Email must not exceed 100 characters" };
            }

            return { valid: true, message: "Valid email address" };
        }

        // Validate phone number - exactly 10 digits
        function validateContactPhone(phone) {
            const cleaned = phone.replace(/\D/g, '');

            if (cleaned.length !== 10) {
                return { valid: false, message: "Phone number must be exactly 10 digits" };
            }

            if (!/^[0-9\s\-\(\)]+$/.test(phone)) {
                return { valid: false, message: "Phone number contains invalid characters" };
            }

            return { valid: true, message: "Valid phone number" };
        }

        // Validate bank name
        function validateBankName(bankName) {
            const cleaned = bankName.trim();

            if (cleaned.length < 3) {
                return { valid: false, message: "Bank name must be at least 3 characters" };
            }

            if (cleaned.length > 100) {
                return { valid: false, message: "Bank name must not exceed 100 characters" };
            }

            if (!/^[a-zA-Z0-9\s\-&.,()]+$/.test(cleaned)) {
                return { valid: false, message: "Bank name contains invalid characters" };
            }

            return { valid: true, message: "Valid bank name" };
        }

        // Validate account holder name
        function validateAccountHolderName(name) {
            const cleaned = name.trim();

            if (cleaned.length < 3) {
                return { valid: false, message: "Account holder name must be at least 3 characters" };
            }

            if (cleaned.length > 100) {
                return { valid: false, message: "Account holder name must not exceed 100 characters" };
            }

            if (!/^[a-zA-Z\s'-]+$/.test(cleaned)) {
                return { valid: false, message: "Account holder name can only contain letters, spaces, hyphens, and apostrophes" };
            }

            return { valid: true, message: "Valid account holder name" };
        }

        // Validate account number
        function validateAccountNumber(accountNumber) {
            const cleaned = accountNumber.replace(/\s/g, '');

            if (cleaned.length < 8) {
                return { valid: false, message: "Account number must be at least 8 digits" };
            }

            if (cleaned.length > 20) {
                return { valid: false, message: "Account number must not exceed 20 digits" };
            }

            if (!/^[0-9]+$/.test(cleaned)) {
                return { valid: false, message: "Account number must contain only digits" };
            }

            return { valid: true, message: "Valid account number" };
        }

        // Validate bank branch (optional)
        function validateBankBranch(branch) {
            if (branch.trim() === "") {
                return { valid: true, message: "" };
            }

            const cleaned = branch.trim();

            if (cleaned.length < 2) {
                return { valid: false, message: "Bank branch must be at least 2 characters if provided" };
            }

            if (cleaned.length > 100) {
                return { valid: false, message: "Bank branch must not exceed 100 characters" };
            }

            if (!/^[a-zA-Z0-9\s\-&.,()]+$/.test(cleaned)) {
                return { valid: false, message: "Bank branch contains invalid characters" };
            }

            return { valid: true, message: "Valid bank branch" };
        }

        // Validate refund reason
        function validateRefundReason(reason) {
            const cleaned = reason.trim();

            if (cleaned.length < 20) {
                return { valid: false, message: "Refund reason must be at least 20 characters" };
            }

            if (cleaned.length > 1000) {
                return { valid: false, message: "Refund reason must not exceed 1000 characters" };
            }

            return { valid: true, message: "Valid refund reason" };
        }

        // Real-time validation feedback
        function validateFieldOnChange(fieldId) {
            const field = document.getElementById(fieldId);
            let feedbackId = fieldId + "Feedback";
            let feedback = document.getElementById(feedbackId);

            if (!feedback) {
                feedback = document.createElement("span");
                feedback.id = feedbackId;
                feedback.style.marginLeft = "10px";
                feedback.style.fontSize = "12px";
                field.parentNode.appendChild(feedback);
            }

            const value = field.value;
            let validation = { valid: false, message: "" };

            switch (fieldId) {
                case "customerName":
                    if (value.trim() === "") {
                        feedback.textContent = "";
                        return;
                    }
                    validation = validateCustomerName(value);
                    break;
                case "contactEmail":
                    if (value.trim() === "") {
                        feedback.textContent = "";
                        return;
                    }
                    validation = validateContactEmail(value);
                    break;
                case "contactPhone":
                    if (value.trim() === "") {
                        feedback.textContent = "";
                        return;
                    }
                    validation = validateContactPhone(value);
                    break;
                case "bankName":
                    if (value.trim() === "") {
                        feedback.textContent = "";
                        return;
                    }
                    validation = validateBankName(value);
                    break;
                case "accountHolderName":
                    if (value.trim() === "") {
                        feedback.textContent = "";
                        return;
                    }
                    validation = validateAccountHolderName(value);
                    break;
                case "accountNumber":
                    if (value.trim() === "") {
                        feedback.textContent = "";
                        return;
                    }
                    validation = validateAccountNumber(value);
                    break;
                case "bankBranch":
                    validation = validateBankBranch(value);
                    break;
                case "refundReason":
                    if (value.trim() === "") {
                        feedback.textContent = "";
                        return;
                    }
                    validation = validateRefundReason(value);
                    break;
            }

            if (validation.valid) {
                if (validation.message) {
                    feedback.textContent = "✓ " + validation.message;
                    feedback.style.color = "green";
                }
            } else if (validation.message) {
                feedback.textContent = "✗ " + validation.message;
                feedback.style.color = "red";
            }
        }

        // Comprehensive form validation on submit
        function validateRefundForm() {
            const customerName = document.getElementById("customerName").value;
            const contactEmail = document.getElementById("contactEmail").value;
            const contactPhone = document.getElementById("contactPhone").value;
            const bankName = document.getElementById("bankName").value;
            const accountHolderName = document.getElementById("accountHolderName").value;
            const accountNumber = document.getElementById("accountNumber").value;
            const bankBranch = document.getElementById("bankBranch").value;
            const refundReason = document.getElementById("refundReason").value;

            // Validate customer name
            let nameValidation = validateCustomerName(customerName);
            if (!nameValidation.valid) {
                alert("Full Name: " + nameValidation.message);
                document.getElementById("customerName").focus();
                return false;
            }

            // Validate email
            let emailValidation = validateContactEmail(contactEmail);
            if (!emailValidation.valid) {
                alert("Email: " + emailValidation.message);
                document.getElementById("contactEmail").focus();
                return false;
            }

            // Validate phone
            let phoneValidation = validateContactPhone(contactPhone);
            if (!phoneValidation.valid) {
                alert("Phone Number: " + phoneValidation.message);
                document.getElementById("contactPhone").focus();
                return false;
            }

            // Validate bank name
            let bankValidation = validateBankName(bankName);
            if (!bankValidation.valid) {
                alert("Bank Name: " + bankValidation.message);
                document.getElementById("bankName").focus();
                return false;
            }

            // Validate account holder name
            let accountHolderValidation = validateAccountHolderName(accountHolderName);
            if (!accountHolderValidation.valid) {
                alert("Account Holder Name: " + accountHolderValidation.message);
                document.getElementById("accountHolderName").focus();
                return false;
            }

            // Validate account number
            let accountValidation = validateAccountNumber(accountNumber);
            if (!accountValidation.valid) {
                alert("Account Number: " + accountValidation.message);
                document.getElementById("accountNumber").focus();
                return false;
            }

            // Validate bank branch (optional)
            let branchValidation = validateBankBranch(bankBranch);
            if (!branchValidation.valid) {
                alert("Bank Branch: " + branchValidation.message);
                document.getElementById("bankBranch").focus();
                return false;
            }

            // Validate refund reason
            let reasonValidation = validateRefundReason(refundReason);
            if (!reasonValidation.valid) {
                alert("Reason for Refund: " + reasonValidation.message);
                document.getElementById("refundReason").focus();
                return false;
            }

            return confirm("Please verify all information is correct before submitting the refund request.");
        }

        // Format phone number - exactly 10 digits
        function formatPhoneNumber(input) {
            let value = input.value.replace(/\D/g, '');
            if (value.length > 10) {
                value = value.substring(0, 10);
            }
            if (value.length > 0) {
                if (value.length <= 3) {
                    input.value = value;
                } else if (value.length <= 6) {
                    input.value = value.substring(0, 3) + '-' + value.substring(3);
                } else {
                    input.value = value.substring(0, 3) + '-' + value.substring(3, 6) + '-' + value.substring(6, 10);
                }
            }
        }

        // Format account number with spaces (every 4 digits)
        function formatAccountNumber(input) {
            let value = input.value.replace(/\s/g, '');
            let formattedValue = '';
            for (let i = 0; i < value.length; i++) {
                if (i > 0 && i % 4 === 0) {
                    formattedValue += ' ';
                }
                formattedValue += value[i];
            }
            input.value = formattedValue;
        }

        // Initialize event listeners
        document.addEventListener("DOMContentLoaded", function() {
            const fields = ['customerName', 'contactEmail', 'contactPhone', 'bankName',
                          'accountHolderName', 'accountNumber', 'bankBranch', 'refundReason'];

            fields.forEach(fieldId => {
                const field = document.getElementById(fieldId);
                if (field) {
                    field.addEventListener("change", function() {
                        validateFieldOnChange(fieldId);
                    });
                }
            });
        });
    </script>
</head>
<body class="min-h-screen py-8 px-4">
<!-- Include Header -->
    <jsp:include page="/WEB-INF/jsp/header.jsp" />
    <div class="max-w-5xl mx-auto">
        <!-- Header -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6">
            <h1 class="text-4xl font-bold text-gray-800 mb-4 text-center">Request Refund</h1>

            <c:if test="${not empty message}">
                <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4 rounded-lg">
                    <p class="font-bold">${message}</p>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-4 rounded-lg">
                    <p class="font-bold">${error}</p>
                </div>
            </c:if>

            <div class="flex gap-4 justify-center">
                <a href="${pageContext.request.contextPath}/payments/${payment.id}"
                   class="inline-flex items-center px-6 py-2 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 transition duration-300 shadow-lg">
                    ← Back to Payment
                </a>
                <a href="${pageContext.request.contextPath}/payments/my"
                   class="inline-flex items-center px-6 py-2 bg-purple-600 text-white font-semibold rounded-lg hover:bg-purple-700 transition duration-300 shadow-lg">
                    My Payments
                </a>
            </div>
        </div>

        <!-- Payment Information -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8 mb-6">
            <h2 class="text-3xl font-bold text-gray-800 mb-6 border-b-4 border-orange-500 pb-3">Payment Information</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="bg-gradient-to-r from-blue-50 to-blue-100 p-4 rounded-lg">
                    <p class="text-sm text-gray-600 font-semibold mb-1">Transaction ID</p>
                    <p class="text-lg text-gray-800 font-bold">${payment.transactionId}</p>
                </div>
                <div class="bg-gradient-to-r from-purple-50 to-purple-100 p-4 rounded-lg">
                    <p class="text-sm text-gray-600 font-semibold mb-1">Order Number</p>
                    <p class="text-lg text-gray-800 font-bold">${payment.order.orderNumber}</p>
                </div>
                <div class="bg-gradient-to-r from-red-50 to-red-100 p-4 rounded-lg">
                    <p class="text-sm text-gray-600 font-semibold mb-1">Payment Status</p>
                    <p class="text-lg text-red-600 font-bold">REJECTED</p>
                </div>
                <div class="bg-gradient-to-r from-green-50 to-green-100 p-4 rounded-lg">
                    <p class="text-sm text-gray-600 font-semibold mb-1">Amount</p>
                    <p class="text-2xl text-green-600 font-bold">$<fmt:formatNumber value="${payment.amount}" pattern="#,##0.00"/></p>
                </div>
            </div>
        </div>

        <!-- Refund Request Form -->
        <div class="glass-effect rounded-2xl shadow-2xl p-8">
            <h2 class="text-3xl font-bold text-gray-800 mb-4 border-b-4 border-orange-500 pb-3">Refund Request Form</h2>
            <div class="bg-blue-50 border-l-4 border-blue-500 p-4 mb-6 rounded-lg">
                <p class="text-blue-800"><span class="font-bold">Note:</span> Please provide accurate bank details for refund processing. All information will be kept secure.</p>
            </div>

            <form action="${pageContext.request.contextPath}/refunds/submit" method="post" onsubmit="return validateRefundForm()">
                <input type="hidden" name="paymentId" value="${payment.id}">

                <!-- Personal Information -->
                <div class="mb-8">
                    <h3 class="text-2xl font-bold text-gray-700 mb-4 flex items-center">
                        <span class="bg-orange-500 text-white rounded-full w-8 h-8 flex items-center justify-center mr-3">1</span>
                        Personal Information
                    </h3>
                    <div class="space-y-4">
                        <div>
                            <label for="customerName" class="block text-sm font-semibold text-gray-700 mb-2">
                                Full Name <span class="text-red-500">*</span>
                            </label>
                            <input type="text" id="customerName" name="customerName"
                                   value="${user.firstName} ${user.lastName}" required
                                   onchange="validateFieldOnChange('customerName')"
                                   class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500">
                            <span id="customerNameFeedback" class="block mt-1"></span>
                        </div>
                        <div>
                            <label for="contactEmail" class="block text-sm font-semibold text-gray-700 mb-2">
                                Email <span class="text-red-500">*</span>
                            </label>
                            <input type="email" id="contactEmail" name="contactEmail"
                                   value="${user.email}" required
                                   onchange="validateFieldOnChange('contactEmail')"
                                   class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500">
                            <span id="contactEmailFeedback" class="block mt-1"></span>
                        </div>
                        <div>
                            <label for="contactPhone" class="block text-sm font-semibold text-gray-700 mb-2">
                                Phone Number <span class="text-red-500">*</span>
                            </label>
                            <input type="tel" id="contactPhone" name="contactPhone" required
                                   placeholder="123-456-7890"
                                   oninput="formatPhoneNumber(this); validateFieldOnChange('contactPhone')"
                                   maxlength="12"
                                   class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500">
                            <span id="contactPhoneFeedback" class="block mt-1"></span>
                            <small class="text-gray-500 text-xs">Exactly 10 digits (Format: 123-456-7890)</small>
                        </div>
                    </div>
                </div>

                <!-- Bank Account Details -->
                <div class="mb-8">
                    <h3 class="text-2xl font-bold text-gray-700 mb-4 flex items-center">
                        <span class="bg-orange-500 text-white rounded-full w-8 h-8 flex items-center justify-center mr-3">2</span>
                        Bank Account Details
                    </h3>
                    <div class="space-y-4">
                        <div>
                            <label for="bankName" class="block text-sm font-semibold text-gray-700 mb-2">
                                Bank Name <span class="text-red-500">*</span>
                            </label>
                            <input type="text" id="bankName" name="bankName" required
                                   placeholder="e.g., ABC Bank Limited"
                                   onchange="validateFieldOnChange('bankName')"
                                   class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500">
                            <span id="bankNameFeedback" class="block mt-1"></span>
                        </div>
                        <div>
                            <label for="accountHolderName" class="block text-sm font-semibold text-gray-700 mb-2">
                                Account Holder Name <span class="text-red-500">*</span>
                            </label>
                            <input type="text" id="accountHolderName" name="accountHolderName" required
                                   placeholder="e.g., John Doe"
                                   onchange="validateFieldOnChange('accountHolderName')"
                                   class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500">
                            <span id="accountHolderNameFeedback" class="block mt-1"></span>
                        </div>
                        <div>
                            <label for="accountNumber" class="block text-sm font-semibold text-gray-700 mb-2">
                                Account Number <span class="text-red-500">*</span>
                            </label>
                            <input type="text" id="accountNumber" name="accountNumber" required
                                   placeholder="1234 5678 9012 3456"
                                   oninput="formatAccountNumber(this); validateFieldOnChange('accountNumber')"
                                   class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500">
                            <span id="accountNumberFeedback" class="block mt-1"></span>
                            <small class="text-gray-500 text-xs">8-20 digits (numbers only)</small>
                        </div>
                        <div>
                            <label for="bankBranch" class="block text-sm font-semibold text-gray-700 mb-2">
                                Bank Branch
                            </label>
                            <input type="text" id="bankBranch" name="bankBranch"
                                   placeholder="e.g., Main Branch, New York"
                                   onchange="validateFieldOnChange('bankBranch')"
                                   class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500">
                            <span id="bankBranchFeedback" class="block mt-1"></span>
                            <small class="text-gray-500 text-xs">Optional field</small>
                        </div>
                    </div>
                </div>

                <!-- Refund Details -->
                <div class="mb-8">
                    <h3 class="text-2xl font-bold text-gray-700 mb-4 flex items-center">
                        <span class="bg-orange-500 text-white rounded-full w-8 h-8 flex items-center justify-center mr-3">3</span>
                        Refund Details
                    </h3>
                    <div>
                        <label for="refundReason" class="block text-sm font-semibold text-gray-700 mb-2">
                            Reason for Refund <span class="text-red-500">*</span>
                        </label>
                        <textarea id="refundReason" name="refundReason" rows="6" required
                                  placeholder="Please explain why you are requesting a refund (minimum 20 characters)..."
                                  onchange="validateFieldOnChange('refundReason')"
                                  class="input-field w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:outline-none focus:border-orange-500 resize-none"></textarea>
                        <span id="refundReasonFeedback" class="block mt-1"></span>
                        <small class="text-gray-500 text-xs">Minimum 20 characters, Maximum 1000 characters</small>
                    </div>
                </div>

                <!-- Submit Buttons -->
                <div class="flex gap-4 justify-center">
                    <button type="submit"
                            class="px-8 py-3 bg-gradient-to-r from-orange-500 to-red-500 text-white font-bold rounded-lg hover:from-orange-600 hover:to-red-600 transition duration-300 shadow-lg transform hover:scale-105">
                        Submit Refund Request
                    </button>
                    <button type="button"
                            onclick="window.location.href='${pageContext.request.contextPath}/payments/${payment.id}'"
                            class="px-8 py-3 bg-gray-500 text-white font-bold rounded-lg hover:bg-gray-600 transition duration-300 shadow-lg transform hover:scale-105">
                        Cancel
                    </button>
                </div>
            </form>

            <!-- Important Notes -->
            <div class="mt-8 space-y-3">
                <div class="bg-yellow-50 border-l-4 border-yellow-500 p-4 rounded-lg">
                    <p class="text-yellow-800"><span class="font-bold">Important:</span> Please ensure all information is correct. Your refund will be processed to the provided bank account after admin approval.</p>
                </div>
                <div class="bg-green-50 border-l-4 border-green-500 p-4 rounded-lg">
                    <p class="text-green-800"><span class="font-bold">Security:</span> Your bank details are encrypted and will only be used for refund processing.</p>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file="footer.jsp" %>
</html>