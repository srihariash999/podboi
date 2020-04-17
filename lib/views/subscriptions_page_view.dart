import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:podboi/models/subscriptions_page_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/widgets/subscription_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     //TODO -  Change the scaffold being the descendent to the child that's actually changing.

    return ScopedModel<SubscriptionsPageModel>(
      model: locator<SubscriptionsPageModel>(),
      child: ScopedModelDescendant<SubscriptionsPageModel>(
          builder: (context, child, model) {
        String _imageLoadingState = model.getImageLoadingState();
        if (_imageLoadingState == "notLoaded") {
          model.startLoadingImages();
        }
        return model.getView() == "listview"
            ? Scaffold(
                body: ListView.builder(
                  itemCount: model.getLength(),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        model.tappedAction(context, i);
                      },
                      child: SubscriptionListItem(
                        coverArtURL: model.getCoverArt(i),
                        podcastAuthor: model.getAuthor(i),
                        podcastTitle: model.getTitle(i),
                      ),
                    );
                  },
                ),
              )
            : Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black,
                  title: Text("podboi"),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 350,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10.0),
                          itemCount: model.getLength(),
                          shrinkWrap: true,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 5.0,
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Neumorphic(
                              style: NeumorphicStyle(
                                  color: Colors.black,
                                  shape: NeumorphicShape.convex,
                                  lightSource: LightSource.bottomRight),
                              boxShape: NeumorphicBoxShape.roundRect(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                // margin: EdgeInsets.all(8.0),
                                child: _imageLoadingState == "loading" ||
                                        _imageLoadingState == "notLoaded"
                                    ? Center(
                                        child: Text(
                                        "loading..",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                    : Image.network(
                                        model.getCoverArt(index),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 250,
                        child: Placeholder(),
                      ),
                      Container(
                        height: 200,
                        child: Center(
                          child: Text("poop"),
                        ),
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
