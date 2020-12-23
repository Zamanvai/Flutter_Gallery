import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth extends StatefulWidget {
  @override
  _LocalAuthState createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _checkBiometric = false;
  String _authorizationOrNot ="Not Authorized";
  List<BiometricType> _availableBiometricType = List<BiometricType>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(



    );
  }
}
