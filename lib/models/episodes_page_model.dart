
import 'package:podboi/service_locator.dart';
import 'package:podboi/services/episode_page_service.dart';
import 'package:podboi/state_enums.dart';
import 'package:scoped_model/scoped_model.dart';

class EpisodesPageModel extends Model {

  EpisodesPageService episodePageService =
      locator<EpisodesPageService>();
  epState _state = epState.initial;


  getState()
  {
    return _state;
  }

  pageBuildRequest(int i) async{
    _state = epState.loading;
    notifyListeners();
    print('requesting data from db at index $i');
   await episodePageService.initLoading(i);

    _state = epState.loaded;
    notifyListeners();
    print('Loaded the data from db at index $i');

  }

  requestEpisodesCount()
  {
    return episodePageService.podcastEpisodesCount();
  }
    requestPodcastCoverArt()
  {
    return episodePageService.podcastCoverArt();
  }

  requestPodcastAuthor()
  {
    return episodePageService.podcastAuthor();
  }

  requestPodcastTitle()
  {
    return episodePageService.podcastTitle();
  }

  requestEpisodeDescription(int i)
  {
    return episodePageService.podcastEpisodeDescriptions(i);
  }

  requestEpisodeName(int i )
  {
    return episodePageService.podcastEpisodeNames(i);
  }

  tappedOnEpisode(int i)
  {
    var link = episodePageService.podcastEpisodeLinks(i);
    print("pass this $link to the player page to play");
  }
  

}
