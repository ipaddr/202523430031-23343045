import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Column(
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
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: password)
                  .then((value) => print(value))
                  .onError(
                    (error, stackTrace) => print('Error ${error.toString()}'),
                  );
              final userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
              print(userCredential);
            } on FirebaseAuthException catch (e) {
              if (e.code == 'Weak Password') {
                print("weak Password");
              } else if (e.code == 'Email Already In Use') {
                print("Email Already In Use");
              } else {
                print(e);
              }
            }
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
