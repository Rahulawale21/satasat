import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../login/login.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
    required RiveAnimationController btnController,
  }) : _btnController = btnController;

  final RiveAnimationController _btnController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _btnController.isActive = true;
        loginContainer(context);
      },
      child: SizedBox(
          width: 200,
          height: 150,
          child: Stack(
            children: [
              RiveAnimation.asset(
                "assets/rive_assets/button.riv",
                controllers: [_btnController],
              ),
              Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(CupertinoIcons.arrow_right),
                    Text("Login",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
