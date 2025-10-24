import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/core/routes/generated_route.dart';
import 'package:tickets_demo/view/screens/checkout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future clearAllCache() async {
    await DefaultCacheManager().emptyCache();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.wait([clearAllCache()]);
    return MaterialApp(
      title: 'Tickets Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Cairo",
      ),
      initialRoute: AppRoutes.splashPage,
      onGenerateRoute: GeneratedRoute.generatedRoute,
      // home: CheckoutScreen(),
    );
  }
}
