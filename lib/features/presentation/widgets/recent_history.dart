import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryManager {
  static const String _historyKey = 'search_history';

  Future<List<String>> getSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_historyKey) ?? [];
    return history;
  }

  Future<void> addSearchToHistory(String search) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(_historyKey) ?? [];
    if (!history.contains(search)) {
      history.insert(0, search); // Add new search to the top
      if (history.length > 10) {
        history.removeLast(); // Keep only the last 10 searches
      }
      await prefs.setStringList(_historyKey, history);
    }
  }
}
