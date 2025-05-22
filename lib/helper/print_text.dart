import 'package:flutter/foundation.dart';

void printLog(String? text) {
  if (kDebugMode) {
    print(text.toString());
  }
}
