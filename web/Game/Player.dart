
import 'dart:html';
import 'Unit.dart';

class Player extends Unit{

  Player() {
    _sprite = new ImageElement(src: "Sprites/Knight/Knight.png");
    _loadSprite();
  }



}