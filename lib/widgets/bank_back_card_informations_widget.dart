import 'package:flutter/material.dart';

class BankCardBackInformationsWidget extends StatelessWidget {
  final String cvv;
  final String cardNumber;

  /// Constructor for the BankCardBackWidget
  const BankCardBackInformationsWidget({
    super.key,
    required this.cvv,
    required this.cardNumber,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Black strip at the top of the card
            Container(
              height: 40,
              color: const Color.fromARGB(255, 48, 47, 47),
              margin: const EdgeInsets.only(bottom: 20),
            ),

            /// White box containing card information
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Label for the signature area
                  const Text(
                    'Authorized Signature',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),

                  /// Signature area
                  Container(
                    height: 40,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 7),

                  /// Row containing card number and CVV
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        cardNumber,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        cvv,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
