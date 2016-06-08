package ttg.game.gameobject;
import openfl.display.Sprite;
import ttg.game.level.Level;

/**
 * ...
 * @author Tad
 */
class GameObject
{
	var level:Level;
	var sprite:Sprite;
	var x:Float;
	var y:Float;
	
	public function new(l:Level, x:Float, y:Float) 
	{
		this.x = x;
		this.y = y; 
		sprite = new Sprite();
		level = l;
		l.main.addChild(sprite);
	}
	
	public function update()
	{
		
	}
	
	public function render()
	{
		sprite.graphics.clear();
	}
	
}