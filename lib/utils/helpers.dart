import 'package:flutter/foundation.dart';

import '../services/secure_local_storage.dart';

class Helpers {
  Future<bool> checkIsUserLoggedIn() async {
    try {
      var isContainsKey =
          await SecureStorage().containsKeyInSecureData('userToken');
      if (isContainsKey) {
        var data = await SecureStorage().readSecureData('userToken');
        if (data != null && data.isNotEmpty) {
          return true;
        }
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
