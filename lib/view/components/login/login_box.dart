import 'package:flutter/material.dart';
import 'package:for_suyeon/utils/validation/validate_functions.dart';
import 'package:get/get.dart';

import '../../../controller/user_controller.dart';
import '../dialog_components/BelowButton.dart';
import 'login_input_widget.dart';

class LoginBox extends GetView<UserController> {
  const LoginBox({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _controllerEmail = TextEditingController();
    final _controllerPassword = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LoginInputWidget(
            prefixIcon: const Icon(Icons.key),
            topLabel: "이메일",
            hintText: "이메일을 입력하세요.",
            onSaved: (newValue) {},
            kController: _controllerEmail,
            validator: ValidateFunctions.validateEmail,
          ),
          const SizedBox(
            height: 8,
          ),
          LoginInputWidget(
            prefixIcon: const Icon(Icons.password),
            topLabel: "비밀번호",
            hintText: "비밀번호를 입력하세요.",
            obscureText: true,
            kController: _controllerPassword,
            onSaved: (newValue) {},
            validator: ValidateFunctions.validatePassword,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  bool noProb = await controller.login(_controllerEmail.text.trim(), _controllerPassword.text);
                  if (noProb) {
                    print("login success ${controller.user!.id}");
                  }else{
                    _showLoginFailDialog(context);
                  }
                }
              },
              child: const Text("로그인"),
            ),
          )
        ],
      ),
    );
  }

  void _showLoginFailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "로그인 오류",
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Text(
          "로그인 오류입니다. ",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: [
          BelowButton(
            text1: "닫기",
            onPressed1: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

}
