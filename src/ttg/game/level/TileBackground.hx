package ttg.game.level;

import flash.display.Sprite;
import haxe.ds.Vector;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.Tilesheet;
import openfl.geom.Matrix;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import ttg.game.Main;

/**
 * ...
 * @author Tad
 */
class TileBackground extends Sprite
{
	private static var bgBitmap:BitmapData;
	public static var bgTileSheet:Tilesheet;
	
	var map:Array<Array<Int>>;
	
	public static function init()
	{
		bgBitmap = Assets.getBitmapData("img/tlo.png");
		bgTileSheet = new Tilesheet(bgBitmap);
		
		var sheetWidth:Int = cast(bgBitmap.width / 40, Int);
		var sheetHeight:Int = cast(bgBitmap.height / 40, Int);
		for (i in 0...sheetWidth)
		{
			for (j in 0...sheetHeight)
			{
				bgTileSheet.addTileRect(new Rectangle(j * 40, i * 40, 40, 40));
			}
		}
	}
	
	public function new(m:Array<Array<Int>>) 
	{
		super();
		map = m;
	}
	
	private function createBackground(map:Array<Array<Int>>)
	{
		for (i in 0...map.length)
		{
			var row:Array<Int> = map[i];
			for (j in 0...row.length)
			{
				bgTileSheet.drawTiles(graphics, [j * 40, i * 40, row[j]]);
			}
		}
	}
	
	public function render()
	{
		graphics.clear();
		createBackground(map);
	}
	
}