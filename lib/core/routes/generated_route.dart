import 'package:flutter/material.dart';
import 'package:tickets_demo/core/routes/app_routes.dart';
import 'package:tickets_demo/view/screens/cancel_screen.dart';
import 'package:tickets_demo/view/screens/checkout_screen.dart';
import 'package:tickets_demo/view/screens/event_screen.dart';
import 'package:tickets_demo/view/screens/home_screen.dart';
import 'package:tickets_demo/view/screens/login_screen.dart';
import 'package:tickets_demo/view/screens/my_tickets_screen.dart';
import 'package:tickets_demo/view/screens/notification_screen.dart';
import 'package:tickets_demo/view/screens/otp_screen.dart';
import 'package:tickets_demo/view/screens/payment_success_screen.dart';
import 'package:tickets_demo/view/screens/profile_screen.dart';
import 'package:tickets_demo/view/screens/profile_setting_screen.dart';
import 'package:tickets_demo/view/screens/seat_selection_screen.dart';
import 'package:tickets_demo/view/screens/splash_screen.dart';
import 'package:tickets_demo/view/screens/ticket_screen.dart';
import 'package:tickets_demo/view/screens/wallet_info_screen.dart';
import 'package:tickets_demo/view/screens/wallet_screen.dart';

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
      case AppRoutes.paymentPage:
        return MaterialPageRoute(
          builder: (context) => PaymentSuccessScreen(info: args),
        );
      case AppRoutes.ticketPage:
        return MaterialPageRoute(builder: (context) => TicketScreen());
      case AppRoutes.profilePage:
        return MaterialPageRoute(builder: (context) => ProfileSettingScreen());
      case AppRoutes.cancelPage:
        return MaterialPageRoute(
          builder: (context) => DeactivateAccountScreen(),
        );
      case AppRoutes.notificationPage:
        return MaterialPageRoute(builder: (context) => NotificationsScreen());
      case AppRoutes.myTicketsPage:
        return MaterialPageRoute(builder: (context) => MyTicketsScreen());
      case AppRoutes.walletPage:
        return MaterialPageRoute(builder: (context) => WalletScreen());
      case AppRoutes.walletInfoPage:
        return MaterialPageRoute(builder: (context) => WalletInfoScreen());
      case AppRoutes.settingPage:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text("Page not found!"))),
        );
    }
  }
}

// original
