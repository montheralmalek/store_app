import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth/local_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/cubits/session_cubits/session_cubit.dart';
import 'package:store_app/views/signup_view.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfield.dart';
import 'package:store_app/widgets/password_textfield.dart';

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

  final LocalAuthentication localAuth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  //final bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    localAuth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await localAuth.authenticate(
        localizedReason: 'Scan your fingerprint',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            biometricHint: '',
          ),
        ],
      );

      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException {
      setState(() {
        _isAuthenticating = false;
      });
      return;
    } catch (e) {
      // debugPrint('Error - $e');
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
    if (authenticated) {
      BlocProvider.of<SessionCubit>(context).newSession();
      Navigator.pop(context);
    }
  }

  // Future<void> _cancelAuthentication() async {
  //   await localAuth.stopAuthentication();
  //   setState(() => _isAuthenticating = false);
  // }

  // void _startLoading() {
  //   setState(() {
  //     _isLoading = true;
  //   });
  // }

  // void _endLoading() {
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_authorized),

                    ///////////////////////////////////////////////
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                        ),
                        Gap(10),
                        Text(
                          'Login',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    const Gap(20),
                    SizedBox(
                      width: 360,
                      child: Form(
                        key: formKeyState,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //**-------------------- Email ---------------- */
                            CustomTextFormField(
                              //validator: validateEmail,
                              controller: _emailController,
                              inputType: TextInputType.emailAddress,
                              hinttext: 'exampel@ar.com',
                              labeltext: 'email',
                              prefixicon: const Icon(Icons.email),
                              radius: 8,
                            ),
                            //**------------------- Password ---------------- */
                            const Gap(10),
                            PasswordTextFormField(
                              controller: _passwordController,
                              hinttext: 'password',
                              labeltext: 'password',
                              prefixicon: const Icon(Icons.key),
                              radius: 8,
                            ),
                            const Gap(20),

                            CustomButton(
                              height: 45,
                              borderRadius: BorderRadius.circular(50),
                              text: const Text('LogIn'),
                              icon: const Icon(Icons.login),
                              onPressed: () {},
                              // onPressed: () async {
                              //   _startLoading();
                              //   try {
                              //     // if (formKeyState.currentState!.validate()) {
                              //     //   await signInUser(
                              //     //       email: _emailController.text,
                              //     //       password: _passwordController.text);
                              //     //   if (!context.mounted) return;
                              //     //   showMessage(context, 'loged in');
                              //     // }
                              //     // await Future.delayed(const Duration(seconds: 1));
                              //     // if (!context.mounted) return;
                              //     // showMessage(context, 'loged in');
                              //     //Navigator.of(context).pushNamed(HomeView.id);
                              //   } on Exception catch (e) {
                              //     showMessage(context, e as String);
                              //   }
                              //   _endLoading();
                              // },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(7),
                    //**-------------- Login with fingerprint --------------- */
                    if (_supportState == _SupportState.unknown)
                      const SizedBox(
                        height: 40,
                        child: CircularProgressIndicator(),
                      )
                    else if (_supportState == _SupportState.supported)
                      const Text('Login with fingerprint')
                    else
                      const Text('fingerprint not suported on your device'),

                    IconButton(
                      onPressed: _authenticateWithBiometrics,
                      icon: const Icon(Icons.fingerprint),
                      iconSize: 32,
                      padding: EdgeInsets.zero,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    /////////////----------- forgot password ------------//////////////
                    TextButton(
                        onPressed: () {},
                        child: const Text('Forgot your password')),
                    const Divider(),
                    /////////////----------- sign up ------------//////////////
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('Don\'t have an account'),
                      TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpView.id);
                          },
                          child: const Text('SignUp'))
                    ]),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
