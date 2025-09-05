import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qykcart/HomeScreen/HomeScreen.dart';
import 'package:qykcart/Src/Appbutton.dart';
import 'package:qykcart/Src/Apptext.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black,size: 18,),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
               SizedBox(height: 50.h),
                 CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child:  Image.asset(
                "assets/leaf.png", 
              
              ),
            ),
              SizedBox(height: 16.h),
              const AppText(
                text:"Enter your mobile \n number",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, 
                  fontFamily:"DM Sans"
              ),SizedBox(height: 16.h),
              const AppText(
               text: "We will send you a verification code",
                  fontSize: 18,
                  color: Color.fromARGB(255, 142, 139, 139),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Ag',
                
              ),
              const SizedBox(height: 32),

              // Phone number input
            // Phone number input
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25.0),
  child: TextField(
    keyboardType: TextInputType.phone,
    decoration: const InputDecoration(
      prefixText: "+44 ",
      prefixStyle: TextStyle(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      hintText: "(000) 000-00-00",
      hintStyle: TextStyle(color: Colors.grey,fontSize: 24),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: InputBorder.none,   // 👈 removes the bottom underline
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    ),
  ),),


              const SizedBox(height: 32),

              // Continue button
              Center(
                child: AppButton(
                text: "Continue",
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                  // Navigate to Shop screen
                },
                height: 53.h,width: 335.w,
                            ),
              ),
               SizedBox(height: 30.h),// Terms of use
Text.rich(
  TextSpan(
    text: 'By clicking on “Continue” you are agreeing \n to our ',
    style: const TextStyle(
      color: Color.fromARGB(255, 177, 173, 173),
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "DM Sans",
    ),
    children: [
      TextSpan(
        text: 'terms of use',
        style: const TextStyle(
          color: Colors.blue, // 👈 blue text
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "DM Sans",
          decoration: TextDecoration.underline, // optional underline
        ),
      ),
    ],
  ),
  textAlign: TextAlign.center,
),

            ],
          ),
        ),
      ),
    );
  }
}
