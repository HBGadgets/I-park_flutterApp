import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String carNumber;
  final String message;

  const ChatItem(this.carNumber, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.directions_car),
      title: Text(carNumber),
      subtitle: Text(message),
      trailing: Image.asset(
        'assets/images/Vector.png',
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }
}
