import 'package:flutter/material.dart';

class SigninForm extends StatelessWidget {
  // SigninForm({required this.email, required this.password, required this.name});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            // onSaved: (value) => email = value!,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ],
      ),
    );
  }
}
