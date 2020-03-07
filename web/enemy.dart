import "./point.dart";
import "./role.dart";
import 'package:pixi/pixi.dart' as PIXI;

class Enemy extends Role {
  PIXI.Graphics _graphics;
  Enemy(Point pos, int maxSpeed) : super(pos, maxSpeed) {
    _graphics = PIXI.Graphics();
  }

  @override
  void Draw() {
    _graphics.clear();
    _graphics.lineStyle(0);
    _graphics.beginFill(0xFF0000);
    _graphics.drawRect(pos.x, pos.y, 6, 6);
    _graphics.endFill();
  }

  PIXI.Graphics get graphics => _graphics;

  void Chase(Role player) {
    if (pos.x < player.pos.x) {
      pos.x += maxSpeed;
    }
    else if (pos.x > player.pos.x) {
      pos.x -= maxSpeed;
    }

    if (pos.y < player.pos.y) {
      pos.y += maxSpeed;
    }
    else if (pos.y > player.pos.y) {
      pos.y -= maxSpeed;
    }
  }
}