// Copyright (c) 2017, Crazy As (Egor Plotnikov). All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'Unit.dart';
import 'UnitInfo.dart';
import 'EnemiesTypes.dart';

///Класс врага, реализует методы из абстрактного класса Unit
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
  Point<int> getFieldCoords() {
    return this._info.fieldCoords;
  }


  @override
  void setFieldCoords(Point<int> point) {
    this._info.fieldCoords = point;
  }

  @override
  Point<int> getGameCoords() {
    return this._info.gameCoords;
  }

  @override
  void setGameCoords(Point<int> point) {
    this._info.gameCoords = point;
  }

}