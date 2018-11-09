package com.remedy.Analytics;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.bytedeco.javacpp.BytePointer;
import org.bytedeco.javacpp.lept;
import org.bytedeco.javacpp.lept.PIX;
import org.bytedeco.javacpp.tesseract.TessBaseAPI;
import org.imgscalr.Scalr;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.remedy.baseClass.BaseClass;

public class IpecDashboard extends BaseClass {
	public IpecDashboard(WebDriver driver) {
		super(driver);
	}
	ProgramPerformance performOver = new ProgramPerformance(driver);
	public static String FinalOutputIpec=null;
	public static HashMap<String, String> imageOutputIpec;
	
	
	public void saveDataMetricValueWithdatabaseIPEC(String text,String data, String resolution) throws IOException{
		 String xpath="//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/img";
		 GetTextFromScreenShotIPEC(text, xpath, resolution);
	}
	public void GetTextFromScreenShotIPEC(String text,String element,String resolution) throws IOException {
		 delay();
		 longDelay();
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement ele = driver.findElement(By.xpath(element));
//		 if(text.contains("Readmissions Current"))
//		 {
//		 scrollIntoViewByJS(ele);
//		 delay();
//		 }
		 File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		 BufferedImage  fullImg = ImageIO.read(screenshot);
		 Point point = ele.getLocation();
		 if(text.contains("Readmissions Current")){
			 System.out.println("VVVV"+point.getX()+"YYYYYYYYY"+point.getY());
			 point = point.moveBy(60, -60);
		 }else{
			 System.out.println("Value+++++++++"+point.getX()+"YYYYYYYYY"+point.getY());
			 point = point.moveBy(80, 100);
		 }
		 
		 System.out.println(point);
		 int eleWidth = ele.getSize().getWidth();
		 int eleHeight = ele.getSize().getHeight();
		 
		 BufferedImage eleScreenshot= fullImg.getSubimage(point.getX(), point.getY(),
				    eleWidth, eleHeight);
		 BufferedImage scaledImg = Scalr.resize(eleScreenshot, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH,
				 height, width, Scalr.OP_ANTIALIAS); 
		 ImageIO.write(scaledImg, "png", screenshot);
				File screenshotLocation = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
				if(screenshotLocation.exists())
				{
					screenshotLocation.delete();
				}
				FileUtils.copyFile(screenshot, screenshotLocation);
				String fileLocation = System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png";
				performOver.greyscale(fileLocation);
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 FinalOutputIpec=output.replaceAll("\\s+", "").replace("$","").replaceAll(",", "").trim();
				 System.out.println(FinalOutputIpec);
				 if(FinalOutputIpec.isEmpty()){
					 imageOutputIpec.put(text, FinalOutputIpec);
				 }
				 imageOutputIpec.put(text, FinalOutputIpec);
	 }
	
}
