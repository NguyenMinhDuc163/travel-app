import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data/models/room_model.dart';
import 'package:travel_app/representation/screens/booking_flight_screen.dart';
import 'package:travel_app/representation/screens/check_out_screen.dart';
import 'package:travel_app/representation/screens/contact_details_screen.dart';
import 'package:travel_app/representation/screens/forgot_password_screen.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/home_screen.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/login_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/payment_screen.dart';
import 'package:travel_app/representation/screens/profile_screen.dart';
import 'package:travel_app/representation/screens/promo_code_screen.dart';
import 'package:travel_app/representation/screens/ratiing_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/screens/sign_up_screen.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';
import 'package:travel_app/representation/screens/user_profile_sceen.dart';
import 'package:travel_app/test.dart';

import 'data/models/hotel_model.dart';

final Map<String, WidgetBuilder> routes = {
  // noi tong hop ca routes
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName: (context) => GuestAndRoomBookingScreen(),
  HotelsScreen.routeName: (context) => HotelsScreen(),
  SelectRoomScreen.routeName: (context) => SelectRoomScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  RattingScreen.routeName: (context) => RattingScreen(),
  BookingFlightScreen.routeName: (context) => BookingFlightScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  UserProfileScreen.routeName: (context) => UserProfileScreen(),
  ContactDetailsScreen.routeName: (context) => ContactDetailsScreen(),
  PromoCodeScreen.routeName: (context) => PromoCodeScreen(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      final HotelModel hotelModel = (settings.arguments as HotelModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => HotelDetailScreen(
          hotelModel: hotelModel,
        ),
      );

    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    case HotelBookingScreen.routeName:
      return MaterialPageRoute<dynamic>(builder: (context) {
        final String? nameDestination = (settings.arguments as String?);
        return HotelBookingScreen(
          nameDestination: nameDestination,
        );
      });
  }
}
