import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satasat_app/routes/routes.gr.dart';
import 'package:satasat_app/screens/login/widgets/login_content.dart';

import '../../constant/colors.dart';
import 'bloc/login_bloc.dart';

Future<Object?> loginContainer(BuildContext context) {
  LoginBloc loginBloc = LoginBloc();
  return showGeneralDialog(
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
                  child: BlocListener<LoginBloc, LoginState>(
                    bloc: loginBloc,
                    listener: (context, state) {
                      if (state is LoginLoding) {
                        const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LoginSuccess) {
                        context.router.replace(const HomeScreenRoute());
                      }
                    },
                    child: LoginContent(
                      onTap: () {
                        // context.router.replace(const HomeScreenRoute());
                        loginBloc.add(DoLoginEvent(
                            email: LoginContent.controller[0].text,
                            password: LoginContent.controller[1].text));
                      },
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
}
