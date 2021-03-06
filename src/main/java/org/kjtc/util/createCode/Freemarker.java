package org.kjtc.util.createCode;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.kjtc.util.SystemUtils;

import java.io.*;
import java.util.Locale;
import java.util.Map;

/**
 * 
 * 创建人：FH 创建时间：2015年2月8日
 * @version
 */
public class Freemarker {

	/**
	 * 打印到控制台(测试用)
	 *  @param ftlName
	 */
	public static void print(String ftlName, Map<String,Object> root, String ftlPath) throws Exception{
		try {
			Template temp = getTemplate(ftlName, ftlPath);		//通过Template可以将模板文件输出到相应的流
			temp.process(root, new PrintWriter(System.out));
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 输出到输出到文件
	 * @param ftlName   ftl文件名
	 * @param root		传入的map
	 * @param outFile	输出后的文件全部路径
	 * @param filePath	输出前的文件上部路径
	 */
	public static void printFile(String ftlName, Map<String,Object> root, String outFile, String filePath, String ftlPath) throws Exception{
		try {
			String dir ="";
			//判断系统
			if (SystemUtils.getSystem()==true){
				dir = PathUtil.getClasspath();
			}else {
				dir = "/home"+ File.separator;
			}
			File file = new File(dir+ filePath + outFile);
			if(!file.getParentFile().exists()){				//判断有没有父路径，就是判断文件整个路径是否存在
				file.getParentFile().mkdirs();				//不存在就全部创建
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
			Template template = getTemplate(ftlName, ftlPath);
			template.process(root, out);					//模版输出
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过文件名加载模版
	 * @param ftlName
	 */
	public static Template getTemplate(String ftlName, String ftlPath) throws Exception{
		try {
			Configuration cfg = new Configuration();  												//通过Freemaker的Configuration读取相应的ftl
			cfg.setEncoding(Locale.CHINA, "utf-8");
			String path ="";
			//判断系统
			if (SystemUtils.getSystem()==true){
				path = PathUtil.getClassResources().replace("/target/classes/","")+"/src/main/resources";
			}else {
				path = "/home"+ File.separator+"ftl"+ File.separator;
			}
			 cfg.setDirectoryForTemplateLoading(new File(path+"/"+ftlPath));		//设定去哪里读取相应的ftl模板文件
			Template temp = cfg.getTemplate(ftlName);												//在模板文件目录中找到名称为name的文件
			return temp;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}	/**
	 * 通过文件名加载模版
	 * @param ftlName
	 */
	public static Template getTemplatenew(String ftlName, String ftlPath) throws Exception{
		try {
			Configuration cfg = new Configuration();  												//通过Freemaker的Configuration读取相应的ftl
			cfg.setEncoding(Locale.CHINA, "utf-8");
			String path = "D:"+ File.separator+"ftl";
			//判断系统
			if (SystemUtils.getSystem()==true){
				path = PathUtil.getClassResources().replace("/target/classes/","")+"/src/main/resources";
			}else {
				path = "/home"+ File.separator+"tamp"+ File.separator;
			}


			cfg.setDirectoryForTemplateLoading(new File(path+"/"));		//设定去哪里读取相应的ftl模板文件
			Template temp = cfg.getTemplate(ftlName);												//在模板文件目录中找到名称为name的文件
			return temp;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 *
	 * @param ftlName
	 * @param root
	 * @param outFile
	 * @param filePath
	 * @param ftlPath  模板路径
	 * @throws Exception
	 */

	public static void printFilenew(String ftlName, Map<String,Object> root, String outFile, String filePath, String ftlPath)  throws Exception{
		try {
			String dir ="";
			//判断系统
			if (SystemUtils.getSystem()==true){
				dir = PathUtil.getClasspath();
			}else {
				dir = "/home"+ File.separator;
			}
			File file = new File(dir + filePath + outFile);
			if(!file.getParentFile().exists()){				//判断有没有父路径，就是判断文件整个路径是否存在
				file.getParentFile().mkdirs();				//不存在就全部创建
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
			Template template = getTemplatenew(ftlName, ftlPath);
			template.process(root, out);					//模版输出
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
