// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '/login/constants/auth_constant.dart';
import '/login/model/login_request/login_request_model.dart';

import 'login_view_model.dart';

class LoginView extends LoginViewModel with AuthResource {
  final emailController = TextEditingController(text: "eve.holt@reqres.in");
  final passwordController = TextEditingController(text: "cityslicka");
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Form(
          key: _key,
          child: Wrap(
            // Horizontallly
            alignment: WrapAlignment.center,
            spacing: 12,
            children: [
              LoginTextFormField(
                controller: emailController,
                hintText: email,
              ),
              const SizedBox(height: 5),
              LoginTextFormField(
                controller: passwordController,
                hintText: password,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_key.currentState?.validate() ?? false) {
                    var requestModel = LoginRequest(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    await requestLogin(requestModel);
                  } else {
                    print("something went wrong!");
                  }
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const LoginTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
