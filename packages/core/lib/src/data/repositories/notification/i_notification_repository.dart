abstract class INotificationRepository {
  Future<bool?> requestPermission();
  Future<bool?> init();
  Future<void> showNotification(int id, {required String title, required String body});
}
