import 'package:podcast_search/podcast_search.dart';

class SubscriptionsPageService {
  getCoverArtURL( String url) async {
    print("trying to load url:  $url");
    Podcast _podcast = await Podcast.loadFeed(url: url);

    return _podcast.image;
  }


}
