import 'package:flutter/material.dart';
import 'package:start/pages/signin_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPwController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900
                  ),
                ),
                const SizedBox(height: 30),
                
                // Email Field
                const Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value == null || value.isEmpty) return 'Please Enter your email';
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
                    hintText: "example@gmail.com",
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Password Field
                const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: "Enter Your Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined), 
                      onPressed: (){
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Confirm Password Field
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _confirmPwController,
                  obscureText: !_isConfirmPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: "Confirm Your Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Create Account Button - FIXED
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () { 
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account created successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pop(context); 
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(16), 
                    ),
                    child: const Text(
                      "Create Account", 
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
                      child: Text("Or Register With"),
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
                      onPressed: (){}, 
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
                      onPressed: (){}, 
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
                      onPressed: (){}, 
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
                
                const SizedBox(height: 30),
                
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context); // Just go back instead of pushReplacement
                      }, 
                      child: const Text("Login")
                    ),
                  ],
                ),
                const SizedBox(height: 20)
              ]
            ),
          ),
        ),
      ),
    );
  }
}