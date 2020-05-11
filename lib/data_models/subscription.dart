import 'package:hive/hive.dart';

part 'subscription.g.dart';

@HiveType()
class Subscription {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String coverArt;

  @HiveField(2)
  final String author;

    @HiveField(3)
  final String podcastName;

  @HiveField(4)
  final List episodeLinks;

  @HiveField(5)
  final int lastEpisodeNumber;

    @HiveField(6)
  final int episodesCount;

   @HiveField(7)
  final List episodeDescriptions;


   @HiveField(8)
  final List episodeTitles;

  Subscription(this.name, this.coverArt, this.author, this.podcastName, this.lastEpisodeNumber, this.episodesCount, this.episodeDescriptions, this.episodeLinks, this.episodeTitles);
}

 