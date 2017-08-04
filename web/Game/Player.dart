
import 'dart:html';
import 'Unit.dart';
import 'UnitInfo.dart';
import 'EnemiesTypes.dart';

class Player implements Unit{

  UnitInfo _info;

  Player() {
    this._info = new UnitInfo();
    _initInfo();
    _parseType(Units.Player);
    _loadSprite();
  }

  @override
  void _parseType(Units type) {
    this._info.type = type;
    this._info.path = "Sprites/Knight/Knight.png";
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

  @override
  void _initInfo() {
    this._info.path = "";
    this._info.gameCoords = new Point(null, null);
    this._info.sprite = new ImageElement();
    this._info.fieldCoords = new Point(null, null);
  }

}