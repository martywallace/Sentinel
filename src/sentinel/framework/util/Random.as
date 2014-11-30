package sentinel.framework.util
{
	
	import flash.geom.Point;
	
	
	/**
	 * Utilities related to random values.
	 * @author Marty Wallace.
	 */
	public class Random
	{
		
		/**
		 * Returns true if a randomly generated value is less than or equal to the supplied value.
		 * @param chance Percent chance to return true.
		 */
		public static function roll(chance:Number):Boolean
		{
			return base <= chance;
		}
		
		
		/**
		 * Generates a random number between two supplied values.
		 * @param min Number A.
		 * @param max Number B.
		 */
		public static function between(min:Number, max:Number):Number
		{
			return min + (max - min) * base;
		}
		
		
		/**
		 * Returns a Point whose x and y values are randomly assigned within a rectangular area.
		 * @param x X coordinate.
		 * @param y Y coordinate.
		 * @param width Rectangle width.
		 * @param height Rectangle height.
		 */
		public static function inRectangle(x:int, y:int, width:int, height:int):Point
		{
			return new Point(
				between(x, width),
				between(y, height)
			);
		}
		
		
		/**
		 * Returns a Point whose x and y values are randomly assigned within a circular area.
		 * @param x Center x position of the circle.
		 * @param y Center y position of the circle.
		 * @param radius Circle radius.
		 */
		public static function inCircle(x:int, y:int, radius:Number):Point
		{
			var ang:Number = angle;
			
			return new Point(
				x + Math.cos(ang) * radius,
				y + Math.sin(ang) * radius
			);
		}
		
		
		/**
		 * Returns a Point whose x and y values are randomly assigned within a ring.
		 * @param x Center x position of the ring.
		 * @param y Center y position of the ring.
		 * @param innerRadius The inner ring radius.
		 * @param outerRadius The outer ring radius.
		 */
		public static function inRing(x:int, y:int, innerRadius:Number, outerRadius:Number):Point
		{
			var ang:Number = angle;
			
			return new Point(
				x + Math.cos(ang) * between(innerRadius, outerRadius),
				y + Math.sin(ang) * between(innerRadius, outerRadius)
			);
		}
		
		
		/**
		 * Returns a random element from an array.
		 * @param array The subject array.
		 */
		public static function fromArray(array:Array):*
		{
			return array[int(base * array.length)];
		}
		
		
		/**
		 * // Todo: This is weird, change to getBase() or something.
		 * A random number between 0 and 1, not including 1.
		 */
		public static function get base():Number{ return Math.random(); }
		
		
		/**
		 * Todo: This is weird, change to getAngle().
		 * A random angle, in radians.
		 */
		public static function get angle():Number{ return Math.random() * Math.PI * 2; }
		
	}

}