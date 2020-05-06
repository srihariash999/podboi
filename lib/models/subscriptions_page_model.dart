import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/services/subscriptions_page_service.dart';
import 'package:podboi/views/player_page_view.dart';
import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageModel extends Model {
  SubscriptionsPageService subscriptionsPageService =
      locator<SubscriptionsPageService>();

  String _state = "init";

  String _view = "gridview";

  getState() {
    return _state;
  }

  String getView() {
    return _view;
  }

  //TODO:  Chnage the startLoadingImages logic, if the urls are in database, fetch it from there and not internet everytime.
  //TODO: WHen the above logic is changed, try returning urls to each grid seperately.

  initLoading() async {
  _state = 'loading';
  notifyListeners();
   await subscriptionsPageService.initLoading();
   _state = 'loaded';
   notifyListeners();
  }
  handleRefresh()
  { 
    _state = 'loading';
    notifyListeners();
     print("page refreshing started");
    subscriptionsPageService.initLoading();
   
    _state = 'loaded';
    notifyListeners();
  }

  requestCoverArt(i) {
    print('the range req is $i');
   var _p =  subscriptionsPageService.getCoverArtURL(i);
   return _p;
    
  }

  int requestLength() {
    return subscriptionsPageService.getLength();
  }

  requestPodcastName(int i) {
    return subscriptionsPageService.getPodcastName(i);
  }

  requestUploadedTime(int i) {
    int _n = subscriptionsPageService.getUploadedTime(i);

    return _n.toString() + " hours ago";
  }

  requestEpisodeName(int i) {
    return subscriptionsPageService.getEpisodeName(i);
  }

  requestEpisodeLength(int i) {
    int _n = subscriptionsPageService.getEpisodeLength(i);

    return _n.toString() + " minutes";
  }


  


  tappedAction(BuildContext context, i) {
    Navigator.push(
      context,    
      MaterialPageRoute(
        builder: (_) => Player(
          trackNumber: i,
        ),
      ),
    );
  }

  List<String> imageURLS = [];
}
