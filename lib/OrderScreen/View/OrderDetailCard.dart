import 'package:flutter/material.dart';

class OrderDetailCard extends StatelessWidget {
  final String orderId;
  final String recipientName;
  final String address;
  final String date;
  final String deliveryMethod;
  final String totalAmount;
  final String creditAmount;
  final String paidAmount;
  final String status;

  const OrderDetailCard({
    super.key,
    required this.orderId,
    required this.recipientName,
    required this.address,
    required this.date,
    required this.deliveryMethod,
    required this.totalAmount,
    required this.creditAmount,
    required this.paidAmount,
    required this.status,
  });

  Widget _buildRow(String label, String value,
      {bool bold = false, Color? labelColor, Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: labelColor ?? Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            color: valueColor ?? Colors.black,
            fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    //   margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffE8E9EA)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRow("Order ID", orderId, bold: true),
            const SizedBox(height: 10),
            _buildRow("Recipient name", recipientName, bold: true),
            const SizedBox(height: 10),
            _buildRow("Address", address, bold: true),
            const SizedBox(height: 10),
            _buildRow("Date", date, bold: true),
            const SizedBox(height: 10),
            _buildRow("Delivery Method", deliveryMethod, bold: true),
            const SizedBox(height: 10),
            _buildRow("Total amount", totalAmount, bold: true),
            const SizedBox(height: 10),
            _buildRow("Credit Amount", creditAmount, bold: true),
            const SizedBox(height: 10),
            _buildRow("Paid Amount", paidAmount, bold: true),
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                     border: Border.all(color: Color(0xff457B37), width: 1.2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check, size: 16, color: Colors.green),
                      const SizedBox(width: 6),
                      Text(
                        status,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
