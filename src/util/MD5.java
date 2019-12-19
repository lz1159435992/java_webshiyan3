package util;

import java.net.URLEncoder;
import java.security.MessageDigest;

public class MD5 {
	public String s;
	public MD5(){} 
	public String toMD5(String plainText){
		try{
			String plainTextx = URLEncoder.encode(plainText, "utf-8");
			//生成实现指定摘要算法的MessageDigest对象。
			MessageDigest md=MessageDigest.getInstance("MD5");
			//使用指定的字节数组更新摘要
			md.update(plainTextx.getBytes());
			//通过执行诸如填充之类的最终操作完成哈希计算。
			byte b[] =md.digest();
			//生成具体的md5密码到buf数组
			int i;
			StringBuffer buf=new StringBuffer("");
			for(int offset=0;offset<b.length;offset++){
				i=b[offset];
				if(i<0){
					i+=256;
				}
				if(i<16){
					buf.append("0");
				}
				buf.append(Integer.toHexString(i));
			}
			s = buf.toString().substring(8,24);
			//System.out.println("32位:"+buf.toString());
			//System.out.println("16位:"+buf.toString().substring(8,24));
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(s);
		return s;
		
	}
}
