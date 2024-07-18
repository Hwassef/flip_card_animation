import 'package:flutter/material.dart';

class BankCardBackWidget extends StatelessWidget {
  final String cvv;
  final String cardNumber;

  const BankCardBackWidget({
    super.key,
    required this.cvv,
    required this.cardNumber,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              color: const Color.fromARGB(255, 48, 47, 47),
              margin: EdgeInsets.only(bottom: 20),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Authorized Signature',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    color: Colors.grey[200],
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        cardNumber,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        cvv,
                        style: TextStyle(
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
