import 'package:component/util/global_function.dart';
import 'package:component/widget/widget_button.dart';
import 'package:component/widget/widget_form_field.dart';
import 'package:component/widget/widget_scaffold.dart';
import 'package:component/widget/widget_text_sub_title.dart';
import 'package:component/widget/widget_text_title.dart';
import 'package:driver/ui/page/home/home_screen.dart';
import 'package:driver/ui/page/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const route = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    final loginController = context.read<LoginController>();
    return WidgetScaffold(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/icons/cow.png"), width: 100,),
            ],
          ),
          WidgetTextTitle(title: "Iniciar sesión", size: 24),
          WidgetTextSubTitle(title: "¡Introduce tu email y contraseña para iniciar sesión!"),
          WidgetTextTitle(title: "Correo electrónico"),
          WidgetFormField(
            hint: "info@gmail.com",
            controller: loginController.userController,
          ),
          WidgetTextTitle(title: "Contraseña"),
          WidgetFormField(
            hint: "Ingrese su contraseña",
            controller: loginController.passwordController,
          ),
          WidgetButton(
            text: "Iniciar sesión",
            onPressed: () {
              GlobalFunction().nextPageViewTransition(context, HomeScreen());
            },
          ),
        ],
      ),
    );
  }
}
