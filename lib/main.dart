import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner_app/ui/screens/home_screen.dart';
import 'package:qr_code_scanner_app/ui/screens/show_qr_screen.dart';
import 'package:qr_code_scanner_app/ui/screens/splash_screen.dart';
import 'package:qr_code_scanner_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(fontFamily: "Itim"),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          routes: {
            AppRoutes.splash: (context) => const SplashScreen(),
            AppRoutes.home: (context) => const HomeScreen(),
            AppRoutes.showqr: (context) {
              final args = ModalRoute.of(context)?.settings.arguments
                  as Map<String, dynamic>;
              return ShowQrScreen(text: args['text']);
            },
          },
        );
      },
    );
  }
}
