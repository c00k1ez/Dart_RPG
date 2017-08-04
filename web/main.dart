// Copyright (c) 2017, egorp. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'Core/Core.dart';
import 'Game/Game.dart';


void main() {

  canvas = querySelector('#canvas')..focus();
  ctx = canvas.getContext('2d');

  new Game();
}
