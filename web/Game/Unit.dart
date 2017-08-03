
import 'dart:html';
import 'EnemiesTypes.dart';

class Unit {

  Point _fieldCoords;
  Point _gameCoords;
  ImageElement _sprite;
  Enemies _type;
  String _path;

  void _loadSprite() {
    _sprite.onLoad.listen((e) {

    });
  }

  /*Unit() {
    _sprite = new ImageElement(src: "Sprites/Knight/Knight.png");
    _loadSprite();
  }*/



  void _getType(Enemies type) {
    this._type = type;
    if(type == Enemies.Monster) {
      _path = "Sprites/Enemy/Monster.png";
    }else if (type == Enemies.Soldier) {
      _path = "Sprites/Enemy/Soldier.png";
    }
  }

  ImageElement getSprite() {
    return _sprite;
  }

}