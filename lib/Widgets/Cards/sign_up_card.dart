import 'package:flutter/material.dart';
import 'package:june/Widgets/Cards/custom_default_card.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;


  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  @override
  Widget build(BuildContext context) {
    return CustomDefaultCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16,24,16,24),
        child: Row(
          mainAxisSize: MainAxisSize.max ,
          children: [
            
          ],
        ),
      ),
    );
  }
}