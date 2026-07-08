/// BusZ — Dependency Injection Setup
///
/// Source of Truth: BusZ-Documentation/06_Flutter/01_App_Architecture.md §13
///
/// Uses `get_it` for Service Locator pattern.
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ─── External ───────────────────────────────────────────────────
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  
  sl.registerLazySingleton(() {
    // NOTE: Use 'http://10.0.2.2:3000' if testing on Android Emulator
    const String baseUrl = 'http://localhost:3000'; 
    
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));
    // Add interceptors here later
    return dio;
  });

  // ─── Core ───────────────────────────────────────────────────────
  
  // ─── Repositories ───────────────────────────────────────────────
  
  // ─── Use Cases ──────────────────────────────────────────────────
  
  // ─── Blocs / Cubits ─────────────────────────────────────────────
}
