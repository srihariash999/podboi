import 'package:flutter/material.dart';
import 'package:podboi/models/subscriptions_page_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/widgets/subscription_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class SubscriptionsPageView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ScopedModel<SubscriptionsPageModel>(
      model: locator<SubscriptionsPageModel>(),
      child: ScopedModelDescendant<SubscriptionsPageModel>(
        builder: (context, child, model) => Scaffold(
          body: ListView.builder(
            itemCount: model.getLength(),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  model.tappedAction(context,i);
                },
                child: SubscriptionListItem(
                  coverArtURL: model.getCoverArt(i),
                  podcastAuthor: model.getAuthor(i),
                  podcastTitle: model.getTitle(i),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
