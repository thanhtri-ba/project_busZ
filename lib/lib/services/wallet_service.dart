import 'package:busz/models/home_models.dart';

class WalletService {
  static Future<Wallet> getBalance() async {
    // Mock data
    await Future.delayed(const Duration(milliseconds: 300));
    return Wallet(balanceStr: 'IDR 0');
  }
}
