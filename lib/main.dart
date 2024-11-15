import 'package:flutter/material.dart';
import 'package:ordering/core/utils/constants.dart';
import 'package:ordering/modules/restaurant/views/restaurant_dashboard_view.dart';

import 'modules/auth/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Constants.navigatorKey,
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: RestaurantDashboardView(),
    );
  }
}
