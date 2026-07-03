abstract class EncryptionProvider {
  String encrypt(String plainText);
  String decrypt(String cipherText);
}

abstract class HashingProvider {
  String hash(String data);
  bool verify(String data, String hashData);
}
