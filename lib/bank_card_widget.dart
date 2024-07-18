import 'package:flutter/material.dart';

class BankCardWidget extends StatelessWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String bankName;

  const BankCardWidget({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.bankName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.cyanAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
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
            Text(
              bankName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              cardNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 1.5,
              ),
            ),
            Spacer(),
            Row(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  cardHolderName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  expiryDate,
                  style: TextStyle(
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
