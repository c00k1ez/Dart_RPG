// Copyright (c) 2017, Crazy As (Egor Plotnikov). All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'EnemiesTypes.dart';

///Класс-родитель
abstract class Unit {

  ///Метод для загрузки спрайта
  void _loadSprite();

  ///Парсин типа юнита
  void _parseType(Units type);

  ///Возвращение спрайта юнита
  ImageElement getSprite();

  ///Вернуть координаты на матрице _field
  Point<int> getFieldCoords();

  ///Обновить координаты на матрице _field
  void setFieldCoords(Point<int> point);

  ///Венуть координаты в canvas
  Point<int> getGameCoords();

  ///Одновить canvas координаты
  void setGameCoords(Point<int> point);

  ///Начальная инициализация
  void _initInfo();

}