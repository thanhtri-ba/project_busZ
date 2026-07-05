import 'package:busz/models/home_models.dart';

class PromoService {
  static Future<List<Promo>> getPromotions() async {
    // Mock data
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Promo(
        id: 'p1',
        title: '75% Off up to 100k',
        subtitle: 'Min. spend 100k • BCA Credit Cards',
        logoPath: 'assets/images/logo_bca.png',
      ),
      Promo(
        id: 'p2',
        title: '50% Off up to 50k',
        subtitle: 'Min. spend 50k • Mandiri Credit Cards',
        logoPath: 'assets/images/logo_mandiri.png',
      ),
    ];
  }
}
