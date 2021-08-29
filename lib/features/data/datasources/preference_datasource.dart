abstract class PreferenceDatasource {
  Future<bool> savePreferences({required Map<String, dynamic> json});

  Map<String, dynamic> loadPreferences();
}
