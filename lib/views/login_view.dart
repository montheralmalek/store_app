import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/views/signup_view.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/customtextfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'login view';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> formKeyState = GlobalKey();

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void _endLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
          body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Image(image: AssetImage(logoRoute)),
              // Text(
              //   'scholar chat',
              //   style: Theme.of(context).textTheme.headlineLarge,
              // ),
              ///////////////////////////////////////////////
              Form(
                key: formKeyState,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LoginView.id,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Gap(20),
                    CustomTextFormField(
                      //validator: validateEmail,
                      controller: _emailController,
                      inputType: TextInputType.emailAddress,
                      hinttext: 'exampel@ar.com',
                      labeltext: 'email',
                      prefixicon: const Icon(Icons.email),
                    ),
                    // const Gap(10),
                    // PasswordTextFormField(
                    //   controller: _passwordController,
                    //   hinttext: 'password',
                    //   labeltext: 'password',
                    //   prefixicon: const Icon(Icons.key),
                    // ),
                    const Gap(20),
                    CustomButton(
                      text: Text('LogIn'),
                      icon: Icon(Icons.login),
                      onTap: () async {
                        _startLoading();
                        try {
                          // if (formKeyState.currentState!.validate()) {
                          //   await signInUser(
                          //       email: _emailController.text,
                          //       password: _passwordController.text);
                          //   if (!context.mounted) return;
                          //   showMessage(context, 'loged in');
                          // }
                          // await Future.delayed(const Duration(seconds: 1));
                          // if (!context.mounted) return;
                          // showMessage(context, 'loged in');
                          //Navigator.of(context).pushNamed(HomeView.id);
                        } on Exception catch (e) {
                          showMessage(context, e as String);
                        }
                        _endLoading();
                      },
                    ),
                  ],
                ),
              ),
              ////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpView.id);
                      },
                      child: Text('SignUp'))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
