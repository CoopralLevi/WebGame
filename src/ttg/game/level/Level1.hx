package ttg.game.level;

import openfl.display.FPS;
import openfl.display.GradientType;
import openfl.display.Sprite;
import ttg.game.Game;
import ttg.game.Main;
import ttg.game.gameobject.TestObject;
import ttg.game.gameobject.Trigger;
import ttg.game.gameobject.ui.ButtonObject;
import ttg.game.physics.AABB;
import ttg.game.physics.BorderCollider;
import ttg.game.physics.TriggerCollider;

/**
 * ...
 * @author Tad
 */
class Level1 extends Level
{
	var transitionTimer:Int;
	var transitionGraphic:Sprite;
	var g:Game;
	
	public function new(m:Main) 
	{
		super(m);
	}
	
	override public function load(game:Game) 
	{
		super.load(game);
		
		g = game;
		
		bg = new TileBackground("levels/1");
		main.addChild(bg);
		
		new ButtonObject(this, 700, 500, 100, 50, "Menu", function(e) { 
			game.loadLevel(new LevelMenu(main));
		});
		var obj = new TestObject(this, 700, 300);
		var trigger = new Trigger(this, 50, 50, new TriggerCollider(new AABB(50, 50, 75, 75)), obj.hitBox, function() {trace("TRIGGERED!"); });
		
		addCollider(trigger.collider);
		addCollider(new AABB(150, 150, 500, 50));
		addCollider(new AABB(150, 200, 50, 200));
		addCollider(new AABB(150, 400, 500, 50));
		
		addCollider(new BorderCollider(false, false, 0));
		addCollider(new BorderCollider(true, false, 0));
		addCollider(new BorderCollider(false, true, 800));
		addCollider(new BorderCollider(true, true, 600));
		
		main.addChild(debugSprite);
		transitionGraphic = new Sprite();
		main.addChild(transitionGraphic);
		
		game.pause();
		transitionTimer = 240;
	}
	
	override public function pausedUpdate() 
	{
		transitionTimer--;
		
		transitionGraphic.graphics.clear();
		transitionGraphic.graphics.beginFill(0x000, transitionTimer / 240);
		transitionGraphic.graphics.drawRect(0, 0, 800, 600);
		transitionGraphic.graphics.endFill();
	
		if (transitionTimer <= 0)
		{
			g.unPause();
			main.removeChild(transitionGraphic);
		}
	}
	
}