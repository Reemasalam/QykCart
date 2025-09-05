import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qykcart/LoginScreen/LoginSCreen.dart';
import 'package:qykcart/Src/Appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppAppBar(title: "My Profile"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture + Name + Email
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
  radius: 35,
  backgroundColor: Colors.grey[200],
  child: Icon(
    Icons.person,
    size: 50,
    color: Colors.grey[700],
  ),
),

                    const SizedBox(height: 12),
                    Text(
                      "Reema Salam",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "reemasalam@email.com",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),

              // Account Information Section
              Text(
                "Account Details",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height:10),

              // Example account info cards
              _buildInfoRow("Full Name", "Dexter Morgan"),
              _buildInfoRow("Email", "dexter.morgan@email.com"),
              _buildInfoRow("Phone", "+62 812 3456 7890"),
              _buildInfoRow("Address", "Jalan By Pass Ngurah Rai, "),

              const SizedBox(height: 90),

              // App Settings Section
              
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5AC268),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    "Logout",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for rows
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700]),
            ),
          ),
          if (value.isNotEmpty)
            Text(
              value,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          if (value.isEmpty)
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
