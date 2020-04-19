import 'dart:math' as math;

class SubscriptionsPageService {


  var x = math.Random();

  getCoverArtURL(int i) async {
    // print("trying to load url:  $url");
    //Podcast _podcast = await Podcast.loadFeed(url: url);
    // print(_podcast.image);
    return imageURLs[i];
  }

  getUploadedTime(int i) {
    return x.nextInt(23);
  }

  getPodcastName(int i) {
    return __podcastNames[i];
  }

  getEpisodeName(int i) {
    return "A new episode title goes here";
  }

  getEpisodeLength(int i) {
     return x.nextInt(120);
  }

  List imageURLs = [
    "http://static.libsyn.com/p/assets/e/5/6/1/e56169e9fd5e2571/wolf-final700.jpg",
    "https://images.theabcdn.com/i/24025650.jpg",
    "https://images.megaphone.fm/o4Oy-0xM8lh6zE95_-scE8_3bn-FT-Kof8Dw8ggueiw/plain/s3://megaphone-prod/podcasts/4c37eae2-3926-11e9-98ee-9b97407aee4b/image/uploads_2F1582904782001-jzprgxeiye-03d1a43c7400c809685525cb7f6e78be_2F_lore-cover-gm.png",
    "https://media.npr.org/assets/img/2019/11/20/npr_91201389-1-_sq-ca0128ef6da8bbc571cf2bc15e5aecb4d1b33fb4.jpg?s=1400",
    "http://static.libsyn.com/p/assets/4/0/e/8/40e82aebe44f8431/The_Spark_Gap.png",
    "https://d279m997dpfwgl.cloudfront.net/wp/2017/12/endless_thread.jpg",
    "http://static.libsyn.com/p/assets/7/b/0/3/7b03e748868ef23a/LPOTL_Poster_LPN.jpg",
    "https://cdn.simplecast.com/images/8b3f236d-3408-486d-a794-5d45794bcaa0/c46190ac-6d31-49c3-a2e5-ec2333516bdc/3000x3000/devdutt_podcast.jpg?aid=rss_feed",
    "https://content.production.cdn.art19.com/images/65/49/af/a2/6549afa2-dd2e-44f1-961d-aae37443582e/0b75b11fed2d3fc7e526c07c32fd7f65b690b6ed06f9e6f1003879f19820d4c0a5c7dceb7ff2023627577ac978586a2740ca354ff22d2f1923a4fecda1b59a36.jpeg",
    "https://media.wnyc.org/i/1860/1860/l/80/2019/07/the-new-yorker-fiction.png"
  ];

  List __podcastNames = [
    "Wolf 359",
    "No Such Thing As A Fish",
    "Lore",
    "Wait Wait ... Don't Tell Me!",
    "The Spark Gap",
    "Endless Thread",
    "The Last Podcast On The Left",
    "The Devdutt Patnaik Show",
    "Alba Salix",
    "The New Yorker Fiction"
  ];

  List<String> podcastURLs = [
    "http://wolf359radio.libsyn.com/rss",
    "https://audioboom.com/channels/2399216.rss",
    "https://feeds.megaphone.fm/lore",
    "https://www.npr.org/rss/podcast.php?id=344098539",
    "http://thesparkgap.libsyn.com/rss",
    "https://rss.wbur.org/endlessthread/podcast",
    "http://lpotl.libsyn.com/rss",
    "https://feeds.simplecast.com/pgsclD_d",
    "https://albasalix.libsyn.com/rss",
    "http://feeds.wnyc.org/tnyfiction"
  ];
}
