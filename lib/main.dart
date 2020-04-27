import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:podboi/data_models/subscription.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/views/subscriptions_page_view.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
   Hive.registerAdapter<Subscription>(SubscriptionAdapter());
   await Hive.openBox('subscriptionsBox');
  runApp(
    MaterialApp(
      home: SubscriptionsPageView(),
    ),
  );
}
