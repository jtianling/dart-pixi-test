import 'dart:html' hide Point;
import 'package:js/js.dart';
import "./point.dart";
import "./role.dart";
import 'package:pixi/pixi.dart' as PIXI;

class Player extends Role {
  PIXI.Graphics _graphics;

  Point _cur_speed;

  Function(KeyboardEvent) onKeyDown;
  Function(KeyboardEvent) onKeyUp;

  dynamic OnKeyDown(Event event) {
      var e = event as KeyboardEvent;
      if (e.keyCode == KeyCode.UP) {
        _cur_speed.y = -maxSpeed;
      } else if (e.keyCode == KeyCode.DOWN) {
        _cur_speed.y = maxSpeed;
      }

      if (e.keyCode == KeyCode.LEFT) {
        _cur_speed.x = -maxSpeed;
      }
      else if (e.keyCode == KeyCode.RIGHT) {
        _cur_speed.x = maxSpeed;
      }

      print('key down $_cur_speed');
  }

  dynamic OnKeyUp(Event event) {
      var e = event as KeyboardEvent;
      if (e.keyCode == KeyCode.UP) {
        _cur_speed.y = 0;
      } else if (e.keyCode == KeyCode.DOWN) {
        _cur_speed.y = 0;
      }

      if (e.keyCode == KeyCode.LEFT) {
        _cur_speed.x = 0;
      }
      else if (e.keyCode == KeyCode.RIGHT) {
        _cur_speed.x = 0;
      }
      print('key up $_cur_speed');
  }

  Player(Point pos, num maxSpeed) : super(pos, maxSpeed) {
    _graphics = PIXI.Graphics();

    _cur_speed = Point(0, 0);

    document.addEventListener('keydown', allowInterop(this.OnKeyDown));
    document.addEventListener('keyup', allowInterop(this.OnKeyUp));
  }

  void Move() {
    pos.x += _cur_speed.x;
    pos.y += _cur_speed.y;
  }

  @override
  void Draw() {
    _graphics.clear();
    _graphics.lineStyle(0);
    _graphics.beginFill(0xFFFFFF);
    _graphics.drawCircle(pos.x, pos.y, 3);
    _graphics.endFill();
  }

  PIXI.Graphics get graphics => _graphics;
}