import 'package:flutter/material.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/view/screens/checkout_screen.dart';
import 'package:tickets_demo/view/screens/event_screen.dart';
import 'package:tickets_demo/view/screens/home_screen.dart';
import 'package:tickets_demo/view/screens/login_screen.dart';
import 'package:tickets_demo/view/screens/otp_screen.dart';
import 'package:tickets_demo/view/screens/seat_selection_screen.dart';
import 'package:tickets_demo/view/screens/splash_screen.dart';

class GeneratedRoute {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case AppRoutes.splashPage:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppRoutes.loginPage:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutes.otpPage:
        return MaterialPageRoute(builder: (context) => OtpScreen());
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoutes.eventPage:
        return MaterialPageRoute(builder: (context) => EventScreen());
      case AppRoutes.seatSelectionPage:
        return MaterialPageRoute(builder: (context) => SeatSelectionScreen());
      case AppRoutes.checkoutPage:
        return MaterialPageRoute(
          builder: (context) => CheckoutScreen(info: args),
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text("Page not found!"))),
        );
    }
  }
}

// original
