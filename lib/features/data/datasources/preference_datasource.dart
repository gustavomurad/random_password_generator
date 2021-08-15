abstract class PreferenceDatasource {
  Future<bool> savePreferences({required Map<String, dynamic> json});

  Future<Map<String, dynamic>?> loadPreferences();
}
