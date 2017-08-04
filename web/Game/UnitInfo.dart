// Copyright (c) 2017, Crazy As (Egor Plotnikov). All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'EnemiesTypes.dart';

///Класс с информацией о юните
class UnitInfo {

  ///Положение на матрице _field
  Point<int> fieldCoords;
  ///Положение в canvas
  Point<int> gameCoords;
  ///Спрайт юнита
  ImageElement sprite;
  ///Тип юнита
  Units type;
  ///Путь до спрайта
  String path;

}