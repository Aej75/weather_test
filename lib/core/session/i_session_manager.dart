abstract class ISessionManager {
  Future<void> saveLocation({required String name});
  Future<String?> getSavedLocation();
}
