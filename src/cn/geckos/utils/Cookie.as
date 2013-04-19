package cn.geckos.utils 
{
import flash.net.SharedObject;
/**
 * ...本地存储工具
 * @author ...Kanon
 * 
 * Sample
 * if (Cookie.read("username") == null) {
 *    Cookie.save("username", "jeff");
 * }
 *
 */
public class Cookie 
{
	//共享对象
	private static var so:SharedObject;
	//共享对象名字
	public static var name:String = "cookie";

    private static function init():void {
        if (!Cookie.so) 
            Cookie.so = SharedObject.getLocal(Cookie.name);
    }
	
	/**
	 * 保存数据
	 * @param	key		存储键值
	 * @param	value	需要存储的值
	 */
	public static function save(key:String, value:String):void
	{
		init();
		Cookie.so.data[key] = value;
		Cookie.so.flush();
	}
	
	/**
	 * 读取数据
	 * @param	key		存储键值
	 * @return	需要读取的数据
	 */
	public static function read(key:String):String
	{
		init();
		return Cookie.so.data[key];
	}
	
	/**
	 * 删除一条数据
	 * @param	key 数据对应的key
	 */
	public static function remove(key:String):void
	{
		if (!Cookie.so) return;
		if (Cookie.so.data[key])
		{
			Cookie.so.data[key] = null;
			Cookie.so.flush();
			delete Cookie.so.data[key];
		}
	}
	
	/**
	 * 清除所有cookie数据
	 */
	public static function clearAll():void
	{
		if (Cookie.so)
		{
			for (var key:String in Cookie.so.data) 
			{
				Cookie.so.data[key] = null;
				delete Cookie.so.data[key];
			}
		}
	}
}
}