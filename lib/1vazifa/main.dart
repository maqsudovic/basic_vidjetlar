import 'package:flutter/material.dart';

class CreditCardUI extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final Color startColor;
  final Color endColor;

  CreditCardUI({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BANK NAME',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'CREDIT CARD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.credit_card,
                    color: Colors.yellow[700],
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    cardNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      shadows: [
                     Shadow(
                      color: Colors.indigo,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 3.0)]
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cardHolderName,
                    style: TextStyle(color: Colors.white,),
                  ),
                  Text(
                    expiryDate,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CreditCardUI(
              cardNumber: '5322 2596 2153 2368',
              cardHolderName: 'Lorem Ipsum',
              expiryDate: '01/25',
              startColor: Color.fromARGB(255, 169, 15, 48),
              endColor: Color.fromARGB(255, 220, 55, 66),
            ),
            SizedBox(height: 20),
            CreditCardUI(
              cardNumber: '5322 2596 2153 2368',
              cardHolderName: 'Lorem Ipsum',
              expiryDate: '01/25',
              startColor: Color.fromARGB(255, 174, 31, 222),
              endColor: Color.fromARGB(255, 167, 53, 204),
            ),
          ],
        ),
      ),
    ),
  ));
}
