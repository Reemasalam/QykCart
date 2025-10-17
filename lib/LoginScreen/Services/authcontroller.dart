import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qykcart/HomeScreen/HomeScreen.dart';
import 'package:qykcart/LoginScreen/OtpScreen.dart';
import 'package:qykcart/Utils/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  RxString otp = "".obs;

  // To show loading spinner
  RxBool isLoading = false.obs;

  /// -----------------------
  /// SEND OTP API CALL
  /// -----------------------
  Future<void> sendOtp() async {
    if (phoneController.text.isEmpty) {
      Get.snackbar("Error", "Please enter your mobile number");
      return;
    }

    isLoading.value = true;

    await ApiService.request(
      endpoint: "/api/v1/auth/send-otp", // 👈 your backend endpoint
      method: Api.POST,
      requiresAuth: false,
      body: {
        "phone": phoneController.text.trim(),
      },
      onSuccess: (response) {
        isLoading.value = false;

        if (response.statusCode == 200) {
          Get.snackbar("Success", "OTP sent successfully!");
          Get.to(() =>  OtpScreen()); // Navigate to OTP screen
        } else {
          Get.snackbar("Error", "Failed to send OTP");
        }
      },
      onNetworkError: (message) {
        isLoading.value = false;
        Get.snackbar("Network Error", message);
      },
      onError: (error) {
        isLoading.value = false;
        Get.snackbar("Error", error.toString());
      },
    );
  }

  /// -----------------------
  /// VERIFY OTP API CALL
  /// -----------------------
  Future<void> verifyOtp() async {
  if (otp.value.length != 6) {
    Get.snackbar("Error", "Please enter the 6-digit OTP");
    return;
  }

  isLoading.value = true;

  await ApiService.request(
    endpoint: "/api/v1/auth/verify-otp",
    method: Api.POST,
    requiresAuth: false,
    body: {
      "phone": phoneController.text.trim(),
      "otp": otp.value,
      "fcmToken": "fcm_token_string_here",
      "deviceId": "device_unique_id",
      "deviceType": "android",
      "deviceName": "Samsung Galaxy S21",
      "appVersion": "1.0.0",
    },
    onSuccess: (response) async {
      isLoading.value = false;


      // Success: OTP verified
      if (response.statusCode == 200 && response.data["accessToken"] != null) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("AUTHKEY", response.data["accessToken"]);
        await pref.setString("REFRESHKEY", response.data["refreshToken"] ?? "");

        Get.snackbar("Success", "Login successful!");
        Get.offAll(() => const HomeScreen());
      } 
      // Handles unexpected success codes
      else {
        Get.snackbar("Error", "Unexpected response. Please try again.");
      }
    },
    onUnauthenticated: () {
      isLoading.value = false;
      Get.snackbar("Invalid OTP", "The OTP you entered is invalid or expired.");
    },
    onServerError: (code, message) {
      isLoading.value = false;
      if (code == 401) {
        Get.snackbar("Invalid OTP", "The OTP you entered is invalid or expired.");
      } else {
        Get.snackbar("Server Error", "Something went wrong. Please try again.");
      }
    },
    onNetworkError: (message) {
      isLoading.value = false;
      Get.snackbar("Network Error", message);
    },
    onError: (error) {
      isLoading.value = false;
      Get.snackbar("Error", error.toString());
    },
  );
}

}
