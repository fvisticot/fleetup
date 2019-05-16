import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const cardTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'NotoSans',
    fontSize: 22.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const nextEventTitleText = TextStyle(
    color: lightGrayColor,
    fontFamily: 'NotoSans',
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const nextEventDescText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const nextEventInfoText = TextStyle(
    color: lightGrayColor,
    fontFamily: 'NotoSans',
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const explorerTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 14.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const explorerLocationText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 24.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const explorerUpdateLocationText = TextStyle(
    color: Color.fromRGBO(222, 75, 93, 1),
    fontFamily: 'NotoSans',
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const explorerCategoryText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const explorerTileDateText = TextStyle(
    color: Color.fromRGBO(143, 128, 99, 1),
    fontFamily: 'NotoSans',
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
  static const explorerTileGroupNameText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 13.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
  static const explorerTileDescText = TextStyle(
    color: Color.fromRGBO(118, 118, 118, 1),
    fontFamily: 'NotoSans',
    fontSize: 11.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const topicCategoriesTitleText = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'NotoSans',
    fontSize: 24.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const topicCategoryTitleText = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'NotoSans',
    fontSize: 12.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const Color topicCategoriesBackgroundColor =
      Color.fromRGBO(33, 33, 33, 1.0);

  static const Color lightGrayColor = Color.fromRGBO(117, 117, 117, 1.0);
}
