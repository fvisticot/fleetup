import 'package:fleetup/api/meetup_json_source.dart';
import 'package:fleetup/api/meetup_repository.dart';
import 'package:fleetup/api/topic_category.dart';
import 'package:fleetup/communs_widgets/fleetup_button.dart';
import 'package:fleetup/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          middle: Text('Explorer'),
        ),
        child: ListView(
          children: <Widget>[
            FindEventWidget(),
            DiscoverWidget(),
            CategoriesWidget()
          ],
        ));
  }
}

class FindEventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.expand,
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 12.0),
                child: Text('Trouver des événements près de',
                    style: Styles.explorerTitleText),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Pessac, France',
                          style: Styles.explorerLocationText),
                      CupertinoButton(
                          child: Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.location,
                              color: Color.fromRGBO(222, 75, 93, 1)),
                          Text('Modifier le logo',
                              style: Styles.explorerUpdateLocationText)
                        ],
                      ))
                    ]),
              ),
              Image.network(
                  'https://secure.meetupstatic.com/photos/event/6/5/c/6/600_475586054.jpeg'),
              Container(
                height: 100,
              ),
              FleetupButton(
                  child: Row(
                children: <Widget>[
                  Icon(CupertinoIcons.search),
                  Text('Trouver un groupe spécifique')
                ],
              )),
            ],
          ),
        ),
        Align(alignment: Alignment.bottomCenter, child: EventDateFilter())
      ],
    );
  }
}

class DiscoverWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Découvrir des événements',
            style: Styles.cardTitleText,
          ),
          SizedBox(height: 12),
          Text('Populaire', style: Styles.explorerCategoryText),
          Container(
            height: 280,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) {
                  return EventListTile();
                }),
          )
        ],
      ),
    );
  }
}

class EventListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            child: Stack(fit: StackFit.expand, children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Image.network(
                  'https://secure.meetupstatic.com/photos/event/6/5/c/6/600_475586054.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  CupertinoIcons.add,
                  color: Colors.grey,
                ),
              )
            ]),
          ),
          Text('JEUDI 19:00', style: Styles.explorerTileDateText),
          Text('BordeauxJUG', style: Styles.explorerTileGroupNameText),
          Text('Java 11, 12, c est le moment de remplacer son JDK 8',
              style: Styles.explorerTileDescText)
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Styles.topicCategoriesBackgroundColor,
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  child: Text(
                    'Parcourir les catégories',
                    style: Styles.topicCategoriesTitleText,
                  ),
                ),
                FutureBuilder(
                    future: MeetupRepository(MeetupJsonSource(context))
                        .topicCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              final topicCategory = snapshot.data[index];
                              return CategoryGridTile(topicCategory);
                            });
                      } else {
                        return Container();
                      }
                    })
              ],
            )
          ],
        ));
  }
}

class CategoryGridTile extends StatelessWidget {
  final TopicCategory topicCategory;

  CategoryGridTile(this.topicCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image.network(
              topicCategory.photo.highresLink,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            topicCategory.name,
            style: Styles.topicCategoryTitleText,
          )
        ],
      ),
    );
  }
}

class EventDateFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: new Offset(3.0, 3.0),
        )
      ])*/
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: FleetupDateButton("Aujourd'hui")),
              Flexible(child: FleetupDateButton('Demain'))
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: FleetupDateButton("Cette semaine")),
              Flexible(child: FleetupDateButton('Ce week-end'))
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(child: FleetupDateButton("La semaine prochaine")),
              Flexible(child: FleetupDateButton('Toutes les dates'))
            ],
          )
        ],
      ),
    );

    //return FleetupButton(child: Text("Aujourd'hui"));
  }
}
