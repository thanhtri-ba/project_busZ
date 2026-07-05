import 'package:flutter/material.dart';

class BusCard extends StatelessWidget {
  const BusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Bus Card Placeholder'),
      ),
    );
  }
}
