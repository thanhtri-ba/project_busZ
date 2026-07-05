import 'package:busz/models/home_models.dart';

class LoyaltyService {
  static Future<Loyalty> getLoyalty() async {
    // Mock data
    await Future.delayed(const Duration(milliseconds: 300));
    return Loyalty(points: 0, tierName: 'Silver Tier');
  }
}
