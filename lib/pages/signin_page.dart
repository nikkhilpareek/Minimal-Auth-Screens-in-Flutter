import 'package:flutter/material.dart';
import 'package:start/pages/create_account_page.dart';
import 'package:start/pages/forgot_password.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView( // ✅ FIX: Add scrolling to prevent overflow
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form( // ✅ ADD: Form validation
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // ✅ FIX: Better alignment
                children: [
                  const SizedBox(height: 30),
                  
                  // Title - FIXED
                  const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Email Field - FIXED
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                  const SizedBox(height: 8),
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
                      prefixIcon: const Icon(Icons.email_outlined), // ✅ ADD: Icon
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Password Field - FIXED
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField( // ✅ FIX: Use TextFormField
                    controller: _passwordController, // ✅ FIX: Add controller
                    obscureText: !_isPasswordVisible, // ✅ FIX: Hide password
                    validator: (value) { // ✅ ADD: Password validation
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: "Enter Your Password", // ✅ FIX: Use hintText
                      prefixIcon: const Icon(Icons.lock_outline), // ✅ ADD: Icon
                      suffixIcon: IconButton( // ✅ FIX: Add toggle functionality
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        }, 
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        )
                      ),
                    ),
                  ),
                  
                  // Forgot Password - FIXED
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const ForgotPassword())
                        );
                      }, 
                      child: const Text("Forgot Password?")
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Login Button - FIXED
                  SizedBox(
                    width: double.infinity, // ✅ FIX: Responsive width
                    child: FilledButton(
                      onPressed: () { // ✅ FIX: Add functionality
                        if (_formKey.currentState!.validate()) {
                          // TODO: Implement login logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login successful!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          // Navigate to home page or dashboard
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
                        "Log in", 
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Divider - FIXED
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.black45)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Or Login With"),
                      ),
                      Expanded(child: Divider(color: Colors.black45)),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Social Login Buttons - FIXED
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // TODO: Implement Google login
                        }, 
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Image.asset(
                          "assets/images/google.png", 
                          height: 24, 
                          width: 24,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, size: 24);
                          },
                        )
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // TODO: Implement Facebook login
                        }, 
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Image.asset(
                          "assets/images/fb.png",
                          height: 24, 
                          width: 24,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, size: 24);
                          },
                        )
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // TODO: Implement Apple login
                        }, 
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: Image.asset(
                          "assets/images/apple.png", 
                          height: 24, 
                          width: 24,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, size: 24);
                          },
                        )
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 50), // ✅ FIX: Use SizedBox instead of Spacer
                  
                  // Create Account Link - FIXED
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                          );
                        }, 
                        child: const Text("Create Account")
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