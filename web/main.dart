import 'dart:async';
import 'dart:math';
import 'dart:html' hide Point;
import 'package:pixi/pixi.dart' as PIXI;
import 'package:js/js.dart';
import './point.dart';
import './player.dart';
import './enemy.dart';

class Game {
  PIXI.Application app;

  Player player;
  Enemy enemy;

  Game(this.app) {
    player = Player(Point(100, 100), 2);
    app.stage.addChild(player.graphics);

    enemy = Enemy(Point(100, 200), 1);
    app.stage.addChild(enemy.graphics);
  }

  void Loop() {
    Update();
    Draw();
  }

  void Update() {
    player.Move();
    enemy.Chase(player);
  }

  void Draw() {
    player.Draw();
    enemy.Draw();
  }

}

void GameLoop(Game game) {
  game.Loop();
}

PIXI.Application app;

dynamic Resize(Event e) {
  app.renderer.resize(window.innerWidth-100, window.innerHeight-100);
  print('resize, width=${window.outerWidth}, height=${window.outerHeight}');
  print('resize, width=${window.innerWidth}, height=${window.innerHeight}');
}

void main() {
  var option = PIXI.Options(antialias: true );
  app	= PIXI.Application(option);
  document.body.append(app.view);
  //Resize(null);
  //window.addEventListener("resize", allowInterop(Resize));

  var game = Game(app);

  app.ticker.add(allowInterop(
      (_) => GameLoop(game)
    ));
}
