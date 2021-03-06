import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_21/core/models/states.dart';
import 'package:flutter_hackathon_21/core/providers/boxs_api_providers.dart';
import 'package:flutter_riverpod/all.dart';

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier(this._reader) : super(const RegisterState.loading()) {
    addListener((state) => debugPrint('$state'));
    _init();
  }

  final Reader _reader;
  static final provider = StateNotifierProvider<RegisterStateNotifier>(
      (ref) => RegisterStateNotifier(ref.read));

  void update(RegisterState newState) {
    state = newState;
  }

  Future<void> _init() async {
    final userApiProvider = _reader(UserBoxApiProvider.provider);
    // wait for splash
    await Future.delayed(Duration(seconds: 4));
    state = RegisterState(userApiProvider.isRegistered);
  }
}
