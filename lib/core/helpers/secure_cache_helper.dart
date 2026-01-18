

import 'package:iot_test_app/core/constance/cache_variables.dart';
import 'package:iot_test_app/core/local_storage/secure_storage.dart';

class SecureCacheHelper {
  Future<String?> getToken() async {
    return await SecureCache.getData(key: StorageKeys.token);
  }

  
}
