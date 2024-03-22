import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/booking_details_screen.dart';
import '../screens/home_screen.dart';
import '../shared/theme/colors.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
          },
        ),
        GoRoute(
        name: 'booking-details',
        path: '/booking-details',
        builder: (context, state) {
          return const BookingDetailsScreen();
          },
        ),
      ],
    );
  }