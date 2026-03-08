import 'package:flutter/material.dart';
import 'package:mycatatan/constants/routes.dart';
import 'package:mycatatan/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(
        children: [
          const Text(
            'We have sent you an email verification, please open it to verify your account',
          ),
          const Text(
            'If you have not received a verification email yet, press the button below',
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('send verification email'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logout();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(registerRoute, (_) => false);
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
