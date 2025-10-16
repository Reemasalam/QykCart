import 'package:get/get.dart';
import 'package:api';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> sendOtp(String mobileNumber) async {
    if (mobileNumber.isEmpty) {
      Get.snackbar("Error", "Please enter a valid number");
      return;
    }

    isLoading(true);

    await ApiService.request(
      endpoint: "/auth/send-otp",
      method: Api.POST,
      requiresAuth: false,
      body: {"mobile": mobileNumber},
      onSuccess: (response) {
        print("✅ OTP sent: ${response.data}");
        Get.snackbar("Success", "OTP sent to $mobileNumber");

        // Navigate to OTP verification screen
        // Get.to(() => OtpScreen(mobileNumber: mobileNumber));
      },
      onServerError: (code, msg) {
        Get.snackbar("Server Error", msg);
      },
      onNetworkError: (msg) {
        Get.snackbar("Network Error", msg);
      },
      onError: (err) {
        Get.snackbar("Error", err.toString());
      },
    );

    isLoading(false);
  }
}
