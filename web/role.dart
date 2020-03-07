import './point.dart';
import './player.dart';

abstract class Role {
  Point pos;
  int maxSpeed;
  Role(this.pos, this.maxSpeed);

  void Draw();

}