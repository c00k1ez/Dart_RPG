// Copyright (c) 2017, Crazy As (Egor Plotnikov). All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'Resources.dart';
import 'Keyboard.dart';

///Переменная, в которой хранится canvas
CanvasElement canvas;
///Хрень для отрисовки всего и вся
CanvasRenderingContext2D ctx;

///Взаимодействие с клавиатурой
Keyboard keyboard = new Keyboard();

///TODO: переписать нахуй этот класс, архитектура говно!
///Класс, отввечающий за сам движок игры (пока это рендеринг сцены)
class Core {

  //Объект с ресурсами
  Resources resources;
  //Игровое поле
  //TODO: по-человечески реализовать поддержку сцены
  var _field = [ [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
                 [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                 [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ];

  //Список объектов для отрисовки
  List< Point<int> > _objects;

  //Часть магии. НЕ ТРОГАТЬ
  static const num GAME_SPEED = 50;
  //Продолжение магии. НЕ ТРОГАТЬ!!!!
  num _lastTimeStamp = 0;

  //Конструктор класса
  Core() {
    _init();
  }

  //Начальная инициализация
  void _init() {
    _objects = new List< Point<int> >();
    resources = new Resources();
    _loadImages();
  }

  //Очистка канваса
  void _clear() {
    ctx..fillStyle = "white"
      ..fillRect(0, 0, canvas.width, canvas.height);
  }

  //Подрузка изображений в кэш
  //TODO: разобраться с кэшированием изображений.
  void _loadImages() {
    resources.grass = new ImageElement(src: "Sprites/Grass.png");
    resources.grass.onLoad.listen((e) {

    });

    resources.stone = new ImageElement(src: "Sprites/Stone.png");
    resources.stone.onLoad.listen((e) {

    });
  }

  //Отрисовка фона
  void _drawBackground() {
    for(int i = 0; i < 12; i ++) {
      for(int j = 0; j < 9; j ++) {
        if (_field[j][i] != 0) {
          _objects.add(new Point(i, j));
        }
        ctx.drawImage(resources.grass, i * 70, j * 70);
      }
    }
  }

  //Отрисовка объектов
  void _drawObjects() {
    if(_objects.isEmpty) {
      return;
    }

    for(Point point in _objects) {
      switch(_field[point.y][point.x]) {
        case 1 :
          ctx.drawImage(resources.stone, point.x * 70, point.y * 70);
          break;
      }
    }
  }

  ///Начало игрового цикла
  void run() {
    window.animationFrame.then(_update);
  }

  ///Ебаная магия.
  ///НЕ ЛЕЗЬ БЛЯТЬ, ОНО ТЕБЯ СОЖРЕТ!!!!
  ///TODO: разобраться с этой магией
  void _update(num delta) {
    final num diff = delta - _lastTimeStamp;

    if (diff > GAME_SPEED) {
      _lastTimeStamp = delta;
      _clear();
      _drawBackground();
      _drawObjects();
    }

    // keep looping
    run();
  }

}