import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:satasat_app/constant/colors.dart';
import 'package:satasat_app/constant/widgets/input_form_field.dart';

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
        showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
            return Transform(
              transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: MediaQuery.of(context).size.height / 1.4,
                        width: double.infinity,
                        child: Padding(
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
                              const SizedBox(
                                  height: 50,
                                  child: InputFormField(
                                    hint: "Email",
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(CupertinoIcons.mail),
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                  height: 50,
                                  child: InputFormField(
                                    hint: "Password",
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
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
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Login In")),
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
                                      child: Image.asset(
                                          "assets/icons/google.png"),
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
                                      child: Image.asset(
                                          "assets/icons/facebook.png"),
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
                                      child:
                                          Image.asset("assets/icons/apple.png"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  color: primaryColor,
                  height: 500,
                ),
              ),
            );
          },
        );
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
