import 'package:get_it/get_it.dart';
import 'package:podboi/models/player_page_model.dart';
import 'package:podboi/models/subscriptions_page_model.dart';
import 'package:podboi/services/player_page_service.dart';
import 'package:podboi/services/subscriptions_page_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<PlayerPageService>(() => PlayerPageService());
  locator.registerLazySingleton<SubscriptionsPageService>(
      () => SubscriptionsPageService());
  locator.registerFactory<PlayerPageModel>(() => PlayerPageModel());
  // register models
  locator
      .registerFactory<SubscriptionsPageModel>(() => SubscriptionsPageModel());
}
