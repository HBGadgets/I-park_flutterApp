import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String carNumber;
  final String message;

  const ChatItem(this.carNumber, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: const Icon(
              Icons.directions_car_outlined,
              size: 24,
              color: Colors.black,
            ),
          ),
          Text(textAlign: TextAlign.start,
            message,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      title: Text(
        carNumber,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),

      trailing: Image.asset(
        'assets/images/Vector.png',
        width: 35,
        height: 35,
        fit: BoxFit.cover,
      ),
    );
  }
}
