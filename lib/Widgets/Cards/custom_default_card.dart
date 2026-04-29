import 'package:flutter/material.dart';

class CustomDefaultCard extends StatelessWidget {
  const CustomDefaultCard({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.7,
      shadowColor: Theme.of(context).colorScheme.primary.withAlpha(100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child: child
    ); 
  }
}