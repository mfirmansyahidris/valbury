import 'package:flutter/material.dart';
import 'package:the_klink_sehat/config/config.dart';
import 'package:the_klink_sehat/ui/ui.dart';
import 'package:the_klink_sehat/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.appBar(
        title: Strings.get.loginAndRegistration,
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimens.space20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextF(
                labelText: Strings.get.email,
                hintText: Strings.get.email,
                maxLine: 1,
                curFocusNode: _emailFocus,
                nextFocusNode: _phoneFocus,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (String? value){
                  if(value == null){
                    return Strings.get.invalidEmail;
                  }
                  if(!value.isValidEmail()){
                    return Strings.get.invalidEmail;
                  }
                  return null;
                },
              ),
              TextF(
                labelText: Strings.get.phoneNumber,
                hintText: Strings.get.phoneNumber,
                controller: _phoneController,
                curFocusNode: _phoneFocus,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
                maxLine: 1,
                prefixIcon: const Icon(Icons.phone),
                validator: (String? value) {
                  if(value == null){
                    return Strings.get.invalidPhone;
                  }

                  if(double.tryParse(value) == null){
                    return Strings.get.invalidPhone;
                  }

                  return null;
                }
              ),
              SpacerV(value: Dimens.space10),
              Button(
                width: context.widthInPercent(100),
                title: Strings.get.submit,
                fontSize: Dimens.h6,
                padding: EdgeInsets.symmetric(vertical: Dimens.space10),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _login();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login(){
    context.show();
    Future.delayed(const Duration(seconds: 2), (){
      sl<PrefManager>().email = _emailController.text;
      sl<PrefManager>().phone = _phoneController.text;
      context.dismiss();
      Strings.get.loginSuccess.toToastSuccess();
      context.goToReplace(AppRoute.mainPage);
    });
  }
}
