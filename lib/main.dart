import 'package:flutter/material.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/views/subscriptions_page_view.dart';

void main() {
  setupLocator();
  runApp(
    MaterialApp(
      home: SubscriptionsPageView(),
    ),
  );
}
