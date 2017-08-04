
import 'dart:html';
import 'Unit.dart';
import 'UnitInfo.dart';
import 'EnemiesTypes.dart';

class Enemy extends Unit {

  UnitInfo _info;

  Enemy() {
    this._info = new UnitInfo();
    _initInfo();
    _parseType(Units.Player);
    _loadSprite();
  }

  @override
  void _initInfo() {
    this._info.path = "";
    this._info.gameCoords = new Point(null, null);
    this._info.sprite = new ImageElement();
    this._info.fieldCoords = new Point(null, null);
  }


  @override
  void _parseType(Units type) {
    switch(type) {
      case Units.Soldier :
        break;

      case Units.Monster :
        break;

      case Units.Player :
        break;
    }
  }


  @override
  void _loadSprite() {
    this._info.sprite.src = this._info.path;
    this._info.sprite.onLoad.listen((e) {

    });
  }

  @override
  ImageElement getSprite() {
    return this._info.sprite;
  }

  @override
  Point getFieldCoords() {
    return this._info.fieldCoords;
  }


  @override
  void setFieldCoords(Point point) {
    this._info.fieldCoords = point;
  }

  @override
  Point getGameCoords() {
    return this._info.gameCoords;
  }

  @override
  void setGameCoords(Point point) {
    this._info.gameCoords = point;
  }

}