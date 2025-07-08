import 'package:flutter/material.dart';
import 'package:start/pages/signin_page.dart';

class ForgotPassword extends StatefulWidget { // ✅ FIX: Change to StatefulWidget for form handling
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>(); // ✅ ADD: Form validation
  final _emailController = TextEditingController(); // ✅ ADD: Controller

  @override
  void dispose() {
    _emailController.dispose(); // ✅ ADD: Memory management
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea( // ✅ ADD: SafeArea for better spacing
        child: SingleChildScrollView( // ✅ FIX: Add scrolling to prevent overflow
          child: Padding(
            padding: const EdgeInsets.all(20.0), // ✅ FIX: Consistent padding
            child: Form( // ✅ ADD: Form wrapper
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // ✅ FIX: Better alignment
                children: [
                  const SizedBox(height: 30),
                  
                  // Title - FIXED
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 32, // ✅ FIX: Consistent sizing
                      fontWeight: FontWeight.w900
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Description - FIXED
                  const Text(
                    "Don't worry! It happens. Please enter the email associated with your account.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey, // ✅ ADD: Better styling
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Email Label - FIXED
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Email Field - FIXED
                  TextFormField( // ✅ FIX: Use TextFormField for validation
                    controller: _emailController, // ✅ FIX: Add controller
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) { // ✅ ADD: Email validation
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "example@gmail.com", // ✅ FIX: Use hintText instead of hint widget
                      prefixIcon: const Icon(Icons.email_outlined), // ✅ ADD: Email icon
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Reset Password Button - FIXED
                  SizedBox(
                    width: double.infinity, // ✅ FIX: Responsive width
                    child: FilledButton(
                      onPressed: () { // ✅ FIX: Add functionality
                        if (_formKey.currentState!.validate()) {
                          // TODO: Implement password reset logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Password reset link sent to your email!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          // Optionally navigate back after showing success
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pop(context);
                          });
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.all(16), // ✅ FIX: Better padding
                      ),
                      child: const Text(
                        "Reset Password", 
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3), // ✅ FIX: Replace Spacer with responsive spacing
                  
                  // Login Link - FIXED
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Remember the Password?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // ✅ FIX: Use pop instead of pushReplacement
                        }, 
                        child: const Text("Login")
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}