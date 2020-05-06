import 'package:hive/hive.dart';
import 'package:podboi/data_models/subscription.dart';
import 'package:podboi/state_enums.dart';
import 'package:podcast_search/podcast_search.dart';
import 'package:scoped_model/scoped_model.dart';

class AddPodcastsPageModel extends Model {
  // SubscriptionsPageService subscriptionsPageService =
  //     locator<SubscriptionsPageService>();

  ppState _state = ppState.initial;

//Public getter for our view to access the state which is private
  getState() => _state;

  textSubmitted(var p) async {
    _state = ppState.loading;
    notifyListeners();
    _podcastTitles.clear();
    _podcastImages.clear();
    _podcastCount.clear();
    _podcastAuthors.clear();

    var _search = Search();
    try {
      print(" trying $p");
      var _results =
          await _search.search(p.toString(), country: Country.INDIA, limit: 10);
      _results.items?.forEach((result) {
        _podcastTitles.add(result.collectionName.toString());
        _podcastImages.add(result.artworkUrl100.toString());
        _podcastAuthors.add(result.artistName.toString());
        _podcastCount.add(result.trackCount.toString());
        
      });
      Podcast podcast = await Podcast.loadFeed(url: _results.items[0].feedUrl);
      print(podcast.description);
      if (_podcastAuthors.length >= 1) {
        _state = ppState.loaded;
        notifyListeners();
      } else {
        _state = ppState.noresults;
        notifyListeners();
      }
    } catch (e) {
      print("caught an error" + e.toString());
      _state = ppState.error;
      notifyListeners();
    }
  }

  getItemsLength() {
    return _podcastTitles.length >= 1 ? _podcastTitles.length : 2;
  }

  searchPodcastCover(int i) {
    return _podcastImages[i];
  }

  searchPodcastAuthor(int i) {
    return _podcastAuthors[i];
  }

  searchPodcastTitle(int i) {
    return _podcastTitles[i];
  }

  searchEpisodesCount(int i) {
    return _podcastCount[i];
  }

  storeAsSubscription(int i) async {
    var mod =
        Subscription(_podcastTitles[i], _podcastImages[i], _podcastAuthors[i]);
    var box = Hive.box('subscriptionsBox');
    await box.add(mod);
    print("added  ${box.getAt(box.length -1 )} to library");
  }

  List _podcastImages = [];

  List _podcastAuthors = [];
  List _podcastTitles = [];
  List _podcastCount = [];
}
