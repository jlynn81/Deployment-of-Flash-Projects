package com.flowers
{
	public class DailyData
	{
		public function DailyData()
		{
		}
		
		public static function getDays():Array
		{
			// This array will hold one FlowerVO for each day of the week.
			var flowerArray:Array = [];
			
			var f1:FlowerVO = new FlowerVO();
			f1.flowerName = "Rose";
			f1.info = "The color of a rose is also associated with symbolic meanings. Each rose color, and even the rose blossom shape and " +
					  "age (i.e. rose buds as opposed to fully bloomed roses), conveys a different meaning or silent message from the giver " +
					  "to the recipient." + "- http://www.harlowgardens.com/symbolism-and-meaning-of-roses/";
			flowerArray.push(f1);
			
			var f2:FlowerVO = new FlowerVO();
			f2.flowerName = "Violets";
			f2.info = "In dreams, violets are positive. For instance, according to folklore, dreaming of violets is a sign that a fortune is " +
					  "coming your way.  Read more: Meaning of Violet Flowers | " +
					  "Garden Guides http://www.gardenguides.com/82340-meaning-violet-flowers.html#ixzz2iCjHcFqY";
			flowerArray.push(f2);
			
			var f3:FlowerVO = new FlowerVO();
			f3.flowerName = "Tulip";
			f3.info = "The tulip originated centuries ago in Persia and Turkey, where it played a significant role in the art and culture " +
					  "of the time." + "- www.proflowers.com";
			flowerArray.push(f3);
			
			var f4:FlowerVO = new FlowerVO();
			f4.flowerName = "Bird of Paradise";
			f4.info = "Expressing freedom, joy and a clear perspective on life, this flower brings happiness wherever it is displayed." + "- www.proflowers.com";
			flowerArray.push(f4);
			
			var f5:FlowerVO = new FlowerVO();
			f5.flowerName = "Calla";
			f5.info = "Calla Lilies signify magnificence and beauty. Further combined with the attributes associated " +
					  "with the color you choose, Calla lilies can convey a wealth of meaning." + "- theflowerexpert.com";
			flowerArray.push(f5);
			
			var f6:FlowerVO = new FlowerVO();
			f6.flowerName = "Freesia";
			f6.info = "Freesia flowers convey a variety of meanings, including friendship, innocence, thoughtfulness, perseverance and being high-spirited. " +
				      "- http://www.ehow.com/about_6514432_meaning-freesia-flower_.html#ixzz2i8sGTVXh";
			flowerArray.push(f6);
			
			var f7:FlowerVO = new FlowerVO();
			f7.flowerName = "Sunflower";
			f7.info = " They are used for decoration and the seeds are a source of food - sunflower butter, made from sunflower " +
					  "seeds, is often used as a substitute for peanut butter." + "- teleflora.com";
			flowerArray.push(f7);
			
			// Output the array to whichever class requested it.
			return flowerArray;
		}
	}
}