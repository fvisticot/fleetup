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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Trouver des événements près de'),
          Row(children: <Widget>[
            Text('Pessac, France'),
            CupertinoButton(child: Text('Modifier le logo'))
          ]),
          Image.network(
              'https://secure.meetupstatic.com/photos/event/6/5/c/6/600_475586054.jpeg')
        ],
      ),
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
          Text('Découvrir des événements'),
          SizedBox(height: 12),
          Text('Populaire'),
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
          Text('JEUDI 19:00'),
          Text('BordeauxJUG'),
          Text('Java 11, 12, c est le moment de remplacer son JDK 8')
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Parcourir les catégories',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryGridTile();
                    })
              ],
            )
          ],
        ));
  }
}

class CategoryGridTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image.network(
              'https://secure.meetupstatic.com/photos/event/6/5/c/6/600_475586054.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            'Nature et aventure',
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
