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

  Subscription(this.name, this.coverArt, this.author);
}