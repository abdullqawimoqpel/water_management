abstract class LocalStorageProvider {
  Future<void> init();
  Future<void> saveString(String key, String value);
  Future<String?> getString(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

abstract class SecureStorageProvider {
  Future<void> saveSecureData(String key, String value);
  Future<String?> getSecureData(String key);
  Future<void> deleteSecureData(String key);
  Future<void> deleteAllSecureData();
}

abstract class DatabaseProvider {
  Future<void> initDB();
  Future<void> closeDB();
  // Generic query interfaces, or pass-through for Drift instance placeholder
}
