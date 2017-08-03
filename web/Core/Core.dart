
import 'dart:html';
import 'Resources.dart';
import 'Keyboard.dart';

CanvasElement canvas;
CanvasRenderingContext2D ctx;
Keyboard keyboard = new Keyboard();

class Core {

  Resources resources;
  var _field = [ [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0],
                 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] ];

  List< Point<int> > _objects;

  static const num GAME_SPEED = 50;
  num _lastTimeStamp = 0;

  Core() {
    _init();
  }

  void _init() {
    _objects = new List< Point<int> >();
    resources = new Resources();
    _loadImages();
  }

  void _clear() {
    ctx..fillStyle = "white"
      ..fillRect(0, 0, canvas.width, canvas.height);
  }

  void _loadImages() {
    resources.grass = new ImageElement(src: "Sprites/Grass.png");
    resources.grass.onLoad.listen((e) {

    });

    resources.stone = new ImageElement(src: "Sprites/Stone.png");
    resources.stone.onLoad.listen((e) {

    });
  }

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

  void run() {
    window.animationFrame.then(update);
  }

  void update(num delta) {
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