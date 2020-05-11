// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubscriptionAdapter extends TypeAdapter<Subscription> {
   @override
  final typeId = 0;
  @override
  Subscription read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subscription(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[5] as int,
      fields[6] as int,
      (fields[7] as List)?.cast<dynamic>(),
      (fields[4] as List)?.cast<dynamic>(),
      (fields[8] as List)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Subscription obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.coverArt)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.podcastName)
      ..writeByte(4)
      ..write(obj.episodeLinks)
      ..writeByte(5)
      ..write(obj.lastEpisodeNumber)
      ..writeByte(6)
      ..write(obj.episodesCount)
      ..writeByte(7)
      ..write(obj.episodeDescriptions)
      ..writeByte(8)
      ..write(obj.episodeTitles);
  }

}
