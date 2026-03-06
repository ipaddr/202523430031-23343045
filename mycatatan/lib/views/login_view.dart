import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:mycatatan/constants/routes.dart';
import 'package:mycatatan/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          TextField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email, 
                  password: password);
                final user = FirebaseAuth.instance.currentUser;
                if(user?.emailVerified ?? false){
                    Navigator
                    .of(context)
                    .pushNamedAndRemoveUntil(VerifyEmailViewRoute, (_) => false);
                } else {

                }
                    
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user - not - found') {
                  await showErrorDialog(context, 'User Not Found',);
                } else if (e.code == 'wrong-password') {
                  await showErrorDialog(context, 'Wrong Password',);
                } else {
                  await showErrorDialog(context, 'Error : ${e.code}',);
                }
              } catch (e) {
                await showErrorDialog(context, 'Error : ${e.toString()}',);
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(registerRoute, (_) => false);
            },
            child: const Text("Register"),
          ),
        ],
      ),
    );
  }
}

