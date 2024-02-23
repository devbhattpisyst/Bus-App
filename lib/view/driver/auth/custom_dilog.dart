import 'package:flutter/material.dart';

class NoTripsAssignedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          "Drive a Bus",
        ),
      ),
      body: Center(
        child: Text('No Trips assigned yet'),
      ),
    );
  }
}
