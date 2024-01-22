// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';

// enum SupportState {
//   unknown,
//   supported,
//   unsupported,
// }

// class LocalAuthService {
//   final LocalAuthentication _localAuth = LocalAuthentication();
//   SupportState _supportState = SupportState.unknown;
//   //bool? _canCheckBiometrics;
//   //List<BiometricType>? _availableBiometrics;
//   String _authorized = 'Not Authorized';
//   bool _isAuthenticating = false;

// //**---------------- get support state --------------------- */
//   get getSupportState {
//     _localAuth.isDeviceSupported().then(
//           (bool isSupported) => _supportState =
//               isSupported ? SupportState.supported : SupportState.unsupported,
//         );
//     return _supportState;
//   }

//   // Future<void> _checkBiometrics() async {
//   //   late bool canCheckBiometrics;
//   //   try {
//   //     canCheckBiometrics = await localAuth.canCheckBiometrics;
//   //   } on PlatformException catch (e) {
//   //     canCheckBiometrics = false;
//   //     print(e);
//   //   }
//   //   if (!mounted) {
//   //     return;
//   //   }

//   //   setState(() {
//   //     _canCheckBiometrics = canCheckBiometrics;
//   //   });
//   // }

//   // Future<void> _getAvailableBiometrics() async {
//   //   late List<BiometricType> availableBiometrics;
//   //   try {
//   //     availableBiometrics = await localAuth.getAvailableBiometrics();
//   //   } on PlatformException catch (e) {
//   //     availableBiometrics = <BiometricType>[];
//   //     print(e);
//   //   }
//   //   if (!mounted) {
//   //     return;
//   //   }

//   //   setState(() {
//   //     _availableBiometrics = availableBiometrics;
//   //   });
//   // }

//   // Future<void> _authenticate() async {
//   //   bool authenticated = false;
//   //   try {
//   //     setState(() {
//   //       _isAuthenticating = true;
//   //       _authorized = 'Authenticating';
//   //     });
//   //     authenticated = await localAuth.authenticate(
//   //       localizedReason: 'Let OS determine authentication method',
//   //       options: const AuthenticationOptions(
//   //         stickyAuth: true,
//   //       ),
//   //     );
//   //     setState(() {
//   //       _isAuthenticating = false;
//   //     });
//   //   } on PlatformException catch (e) {
//   //     print(e);
//   //     setState(() {
//   //       _isAuthenticating = false;
//   //       _authorized = 'Error - ${e.message}';
//   //     });
//   //     return;
//   //   }
//   //   if (!mounted) {
//   //     return;
//   //   }

//   //   setState(
//   //       () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
//   // }
// //**---------------- get support state --------------------- */
//   Future<void> authenticateWithBiometrics() async {
//     bool authenticated = false;
//     try {
//       _isAuthenticating = true;
//       _authorized = 'Authenticating';

//       authenticated = await _localAuth.authenticate(
//         localizedReason: 'Scan your fingerprint',
//         options: const AuthenticationOptions(
//           stickyAuth: true,
//           biometricOnly: true,
//         ),
//         authMessages: const <AuthMessages>[
//           AndroidAuthMessages(
//             biometricHint: '',
//           ),
//         ],
//       );

//       _isAuthenticating = false;
//       _authorized = 'Authenticating';
//     } on PlatformException catch (e) {
//       _isAuthenticating = false;
//       // debugPrint('Error - ${e.message}');
//       // _authorized = 'Error - ${e.message}';

//       return;
//     } catch (e) {
//       // debugPrint('Error - $e');
//     }

//     final String message = authenticated ? 'Authorized' : 'Not Authorized';

//     _authorized = message;
//   }

//   Future<void> cancelAuthentication() async {
//     await _localAuth.stopAuthentication();
//     _isAuthenticating = false;
//   }
// }
