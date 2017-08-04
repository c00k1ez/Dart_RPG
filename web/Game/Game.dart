// Copyright (c) 2017, Crazy As (Egor Plotnikov). All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import '../Core/Core.dart';

///Класс-прослойка между ядром и игроком (возможно UI, пока не решил)
///TODO: Дописать это дерьмо
///TODO: Разобраться с добавлением юнитов (игрока, вражин) и их взаимодействием
class Game {

  Game() {
    var core = new Core();
    core.run();
  }

}