import 'package:busz/models/home_models.dart';

class SearchHistoryService {
  static final List<SearchHistory> _mockHistory = [
    SearchHistory(id: '1', route: 'Jakarta - Cirebon', date: '12 Oct 24', passengerInfo: '1 seat'),
    SearchHistory(id: '2', route: 'Jakarta - Bandung', date: '12 Oct 24', passengerInfo: '1 seat'),
    SearchHistory(id: '3', route: 'Jakarta - Surabaya', date: '14 Oct 24', passengerInfo: '1 seat'),
    SearchHistory(id: '4', route: 'Jakarta - Yogyakarta', date: '16 Oct 24', passengerInfo: '1 seat'),
  ];

  static Future<List<SearchHistory>> getHistory() async {
    // Mock data fetching
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockHistory;
  }

  static Future<void> saveHistory(SearchHistory history) async {
    // Mock save
    await Future.delayed(const Duration(milliseconds: 100));
    _mockHistory.insert(0, history);
  }
}
