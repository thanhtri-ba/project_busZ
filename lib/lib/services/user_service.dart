import 'package:busz/models/home_models.dart';

class UserService {
  static Future<UserProfile> getProfile() async {
    // Mock data
    await Future.delayed(const Duration(milliseconds: 300));
    return UserProfile(name: 'Bryan Alexander', dob: '1990-01-01');
  }
}
