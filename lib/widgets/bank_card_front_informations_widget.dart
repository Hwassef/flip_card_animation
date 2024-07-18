import 'package:flutter/material.dart';

class BankCardFrontInformationsWidget extends StatelessWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String bankName;

  /// Constructor for the BankCardFrontInformationsWidget
  const BankCardFrontInformationsWidget({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.bankName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.cyanAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Bank name text at the top of the card
            Text(
              bankName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            /// Card number text
            Text(
              cardNumber,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 1.5,
              ),
            ),
            const Spacer(),

            /// Row for labels "Card Holder" and "Expires"
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Card Holder',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Expires',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            /// Row for card holder's name and expiry date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  cardHolderName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  expiryDate,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
