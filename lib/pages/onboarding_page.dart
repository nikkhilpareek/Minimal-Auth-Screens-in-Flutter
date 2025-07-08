import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:start/pages/create_account_page.dart';
import 'package:start/pages/signin_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
        SizedBox(height: 50,),
        Lottie.asset('assets/onboard.json'),
        SizedBox(height: 50,),
        const Text(
          "Welcome to My App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 50,),
        FilledButton(onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SigninPage()),
      );
        },
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
              
            )
          ),
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: SizedBox(
            width: 280,
            child: Text("Log in", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
                ),
              )
            ),
         )
      ),
      SizedBox(height: 12,),
        OutlinedButton(onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateAccountPage()),
      );
        },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
              
            )
          ),
         child: Padding(
           padding: const EdgeInsets.all(12.0),
           child: SizedBox(
            width: 280,
            child: Text("Create Account", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
                ),
              )
            ),
         )
      ),
      ],
      ),
    );
  }
}