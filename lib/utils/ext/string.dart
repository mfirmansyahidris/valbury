import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:valbury/config/config.dart';
import 'package:valbury/ui/ui.dart';
import 'package:valbury/utils/utils.dart';

extension StringAltExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty || this == "0";
}

extension StringExtension on String {
  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  String toLocale() {
    try {
      final _data = jsonDecode(sl<PrefManager>().text) as Map<dynamic, dynamic>;
      return _data[this] as String;
    } catch (e) {
      return "key $this is not registered";
    }
  }

  String toPhone() {
    return "62$this";
  }

  String toMaskingPhone() {
    final _phone = this;
    var _masking = "";
    for (int i = 0; i < _phone.length; i++) {
      if (i < _phone.length - 2) {
        _masking += "*";
      } else {
        _masking += _phone[i];
      }
    }
    return _masking;
  }

  String clearCurrency() {
    final String _temp = replaceAll(".", "").replaceAll(",", "");
    return _temp;
  }

  void toToastError() {
    try {
      final message = isEmpty ? "error" : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: Palette.redSoft,
          icon: Icons.error,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      logs("error $e");
    }
  }

  void toToastSuccess() {
    try {
      final message = isEmpty ? "success" : this;

      //dismiss before show toast
      dismissAllToast(showAnim: true);

      // showToast(msg)
      showToastWidget(
        Toast(
          bgColor: Colors.green,
          icon: Icons.check_circle,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      logs("success $e");
    }
  }

  void toToastLoading() {
    try {
      final message = isEmpty ? "loading" : this;
      //dismiss before show toast
      dismissAllToast(showAnim: true);

      showToastWidget(
        Toast(
          bgColor: Colors.black,
          icon: Icons.info,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      logs("loading $e");
    }
  }
}
