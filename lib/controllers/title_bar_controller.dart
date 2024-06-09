import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

class TitleBarController extends GetxController {
  TitleBarController();

  // Always on Top Rx
  final RxBool _isAlwaysOnTop = true.obs;
  set isAlwaysOnTop(bool value) => _isAlwaysOnTop.value = value;
  bool get isAlwaysOnTop => _isAlwaysOnTop.value;

  // Fungsi untuk mengubah value Rx
  Future<void> toggleAlwaysOnTop() async {
    _isAlwaysOnTop.toggle();
    if (isAlwaysOnTop) {
      await windowManager.setAlwaysOnTop(true);
    } else {
      await windowManager.setAlwaysOnTop(false);
    }
  }
}
