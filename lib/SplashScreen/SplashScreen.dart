import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qykcart/LoginScreen/LoginSCreen.dart';
import 'package:qykcart/Src/Appbutton.dart';
import 'package:qykcart/Src/Apptext.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
             SizedBox(height: 80.h),

            // Logo/Icon
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child:  Image.asset(
                "assets/leaf.png", 
              
              ),
            ),

            const SizedBox(height: 20),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: AppText(
                text: "Get your groceries \n delivered to your home",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

             SizedBox(height: 25.h),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 58),
              child: AppText(
                text: "The best delivery app in town for \n delivering your daily fresh groceries",
                fontSize: 16,
                 fontWeight: FontWeight.w400
                 ,
                color: Color.fromARGB(255, 151, 149, 149),
              ),
            ),

             SizedBox(height: 40.h),

            // Button
            AppButton(
              text: "Shop now",
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                // Navigate to Shop screen
              },
              height: 53.h,width: 190.w,
            ),

            const Spacer(),

            // Grocery Bag Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                "assets/grocery.png", // replace with your asset
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
