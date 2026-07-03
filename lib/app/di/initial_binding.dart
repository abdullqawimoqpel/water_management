import 'package:get/get.dart';
import '../../core/logger/app_logger.dart';
// import '../../core/network/rest_client.dart';
// import '../../core/storage/storage_provider.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Core Bindings
    Get.put<AppLogger>(LoggerImpl(), permanent: true);
    
    // Abstract setups (Implementation classes will be bound here)
    // Get.put<LocalStorageProvider>(LocalStorageImpl(), permanent: true);
    // Get.put<RestClient>(DioRestClientImpl(), permanent: true);
    
    // 2. Shared Bindings (If any, global state services etc.)
    
    // 3. Application-level services
  }
}
