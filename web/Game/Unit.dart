
import 'dart:html';
import 'EnemiesTypes.dart';

abstract class Unit {

  void _loadSprite();

  void _parseType(Units type);

  ImageElement getSprite();

  Point getFieldCoords();

  void setFieldCoords(Point point);

  Point getGameCoords();

  void setGameCoords(Point point);

  void _initInfo();

}