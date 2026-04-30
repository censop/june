import 'package:flutter/material.dart';
import 'package:june/Widgets/Cards/custom_default_card.dart';
import 'package:june/Widgets/Form/custom_text_form_field.dart';

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
  bool seePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomDefaultCard(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,24,29,24),
        child: Column(
          mainAxisSize: MainAxisSize.min ,
          children: [
            CustomTextFormField(
              controller: widget.nameController,
              title: "Name",
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              controller: widget.emailController,
              title: "Email",
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              controller: widget.passwordController,
              title: "Password",
              suffixIcon: IconButton(
                icon: Icon(
                  seePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    seePassword = !seePassword;
                  });
                },
              ),
              obscureText: seePassword,
            )
          ],
        ),
      ),
    );
  }
}