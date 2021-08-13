abstract class PreferenceService {
  Future<void> savePreferences({required Map<String, dynamic> json});

  Future<Map<String, dynamic>?> loadPreferences();
}
