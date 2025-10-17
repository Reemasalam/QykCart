import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:qykcart/LoginScreen/Services/authcontroller.dart';
import 'package:qykcart/Src/Appbutton.dart';
import 'package:qykcart/Src/Apptext.dart';
import 'package:qykcart/HomeScreen/HomeScreen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final AuthController authController = Get.find();

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _updateOtpValue() {
    authController.otp.value = _controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.black, size: 18),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 50.h),

              // Logo
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: Image.asset("assets/leaf.png"),
              ),
              SizedBox(height: 16.h),

              // Title
              const AppText(
                text: "Enter verification code",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "DM Sans",
              ),
              SizedBox(height: 16.h),

              // Subtitle
              const AppText(
                text: "We’ve sent a 6-digit code to your number",
                fontSize: 18,
                color: Color.fromARGB(255, 142, 139, 139),
                fontWeight: FontWeight.w400,
                fontFamily: 'Ag',
              ),

              SizedBox(height: 40.h),

              // ✅ OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 48.w,
                    height: 58.h,
                    child: RawKeyboardListener(
                      focusNode: FocusNode(),
                      onKey: (event) {
                        if (event is RawKeyDownEvent &&
                            event.logicalKey == LogicalKeyboardKey.backspace) {
                          // if current field is empty, move focus back
                          if (_controllers[index].text.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                            _controllers[index - 1].text = "";
                          }
                        }
                      },
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          _updateOtpValue();
                          if (value.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 40.h),

              // Verify Button
              AppButton(
                text: "Verify",
                height: 53.h,
                width: 335.w,
                onPressed: () {
                  authController.verifyOtp();
                },
              ),

              SizedBox(height: 30.h),

              // Resend text
              Text.rich(
                TextSpan(
                  text: "Didn’t receive the code? ",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 177, 173, 173),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "DM Sans",
                  ),
                  children: [
                    TextSpan(
                      text: "Resend",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "DM Sans",
                        decoration: TextDecoration.underline,
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
