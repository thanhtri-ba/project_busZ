import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:busz/core/di/injection.dart';
import 'package:busz/core/theme/app_theme.dart';
import 'package:busz/core/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://hgublccvksnuunppjjjw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhndWJsY2N2a3NudXVucHBqamp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODMwMDgzMzgsImV4cCI6MjA5ODU4NDMzOH0.x7lodJ8KfOgluoZgu74S1gheZjENxCtxSn51YL5aX4ME',
  );

  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BusZ - Smart Transit',
      debugShowCheckedModeBanner: false,
      
      // Theming
      themeMode: ThemeMode.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      
      // Routing
      routerConfig: AppRouter.router,
      
      // Localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
      ],
      locale: const Locale('vi', 'VN'), // Default to Vietnamese
    );
  }
}
