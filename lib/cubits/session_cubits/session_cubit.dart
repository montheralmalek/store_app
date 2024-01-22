import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/session_cubits/session_states.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionInitial());
  //LocalAuthentication? _localAuth;
  bool _isSessionCreated = false;
  newSession() {
    _isSessionCreated = true;
    emit(SessionCreated());
  }

  closeSession() {
    _isSessionCreated = false;
    emit(SessionInitial());
  }

  get isSessionCreated {
    return _isSessionCreated;
  }

  // Future<void> cancelAuthentication() async {
  //   await _localAuth?.stopAuthentication();
  //   _isSessionCreated = false;
  // }
}
