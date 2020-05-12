import 'package:hive/hive.dart';

class EpisodesPageService {
  var _box = Hive.box('subscriptionsBox');
  var _podcastTitle;
  var _podcastAuthor;
  var _podcastCoverArt;
  var _podcastEpisodesCount;
  List _podcastEpisodeDescriptions = [];
  List _podcastEpisodeNames = [];
  List _podcastEpisodeLinks = [];

  initLoading(int i) async {
    var _p = _box.getAt(i);
    _podcastTitle = _p.podcastName;
    _podcastAuthor = _p.author;
    _podcastCoverArt = _p.coverArt;
    _podcastEpisodeDescriptions = _p.episodeDescriptions;
    _podcastEpisodeLinks = _p.episodeLinks;
    _podcastEpisodeNames = _p.episodeTitles;
    _podcastEpisodesCount = _p.episodesCount;

    //TODO: Return something useful so that I can display errors (if any) in the UI. Basically return the status, Capiche?
  }

  podcastAuthor() {
    return _podcastAuthor;
  }

  podcastTitle() {
    return _podcastTitle;
  }

  podcastCoverArt() {
   // print( "According to me this is the URL:     $_podcastCoverArt");
    return _podcastCoverArt;
  }

  podcastEpisodesCount() {
        print('episode count is: $_podcastEpisodesCount');
    return _podcastEpisodesCount;
  }

  podcastEpisodeDescriptions(int i) {
    return _podcastEpisodeDescriptions[_podcastEpisodeDescriptions.length -1 -i];
  }

  podcastEpisodeNames(int i) {
    return _podcastEpisodeNames[_podcastEpisodeNames.length -1 -i];
  }

  podcastEpisodeLinks(int i) {
    return _podcastEpisodeLinks[i];
  }
}
