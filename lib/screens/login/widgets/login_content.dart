import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/colors.dart';
import '../../../constant/widgets/input_form_field.dart';

class LoginContent extends StatelessWidget {
  final VoidCallback? onTap;
  const LoginContent({
    super.key,
    this.onTap,
  });

  static var controller = List.generate(2, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          const Text(
            'Sign In',
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 40,
              color: blackColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              child: InputFormField(
                hint: "Email",
                controller: LoginContent.controller[0],
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(CupertinoIcons.mail),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              child: InputFormField(
                hint: "Password",
                controller: LoginContent.controller[1],
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(CupertinoIcons.padlock_solid),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Forgot password?",
            textAlign: TextAlign.end,
            style: TextStyle(),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: onTap, child: const Text("Login In")),
          const SizedBox(
            height: 20,
          ),
          Row(children: const <Widget>[
            Expanded(child: Divider()),
            Text("OR"),
            Expanded(child: Divider()),
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/icons/google.png"),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/icons/facebook.png"),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/icons/apple.png"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
