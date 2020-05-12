import 'package:get_it/get_it.dart';
import 'package:podboi/models/add_podcasts_page_model.dart';
import 'package:podboi/models/episodes_page_model.dart';
import 'package:podboi/models/player_page_model.dart';
import 'package:podboi/models/subscriptions_page_model.dart';
import 'package:podboi/services/episode_page_service.dart';
import 'package:podboi/services/player_page_service.dart';
import 'package:podboi/services/subscriptions_page_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<PlayerPageService>(() => PlayerPageService());
  locator.registerLazySingleton<SubscriptionsPageService>(
      () => SubscriptionsPageService());
      locator.registerLazySingleton<EpisodesPageService>(() => EpisodesPageService());

  // register models
  locator
      .registerFactory<SubscriptionsPageModel>(() => SubscriptionsPageModel());
  locator.registerFactory<PlayerPageModel>(() => PlayerPageModel());
  locator.registerFactory<AddPodcastsPageModel>(() => AddPodcastsPageModel());
  locator.registerFactory<EpisodesPageModel>(() => EpisodesPageModel());
  
}
