// Copyright (c) 2017, Crazy As (Egor Plotnikov). All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'Unit.dart';
import 'UnitInfo.dart';
import 'EnemiesTypes.dart';

///Класс игрока, реализует методы из абстрактного класса Unit
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
  Point<int> getFieldCoords() {
    return this._info.fieldCoords;
  }


  @override
  void setFieldCoords(Point<int> point) {
    this._info.fieldCoords = point;
    this._info.gameCoords = new Point(point.x * 70, point.y * 70);
  }

  @override
  Point<int> getGameCoords() {
    return this._info.gameCoords;
  }

  @override
  void setGameCoords(Point<int> point) {
    this._info.gameCoords = point;
    this._info.fieldCoords = new Point(point.x ~/ 70, point.y ~/ 70);
  }

  @override
  void _initInfo() {
    this._info.path = "";
    this._info.gameCoords = new Point<int>(0, 0);
    this._info.sprite = new ImageElement();
    this._info.fieldCoords = new Point<int>(0, 0);
  }

}