package com.remedy.Analytics;

import java.awt.Graphics2D;
import java.io.*;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;

import javax.imageio.ImageIO;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.commons.io.FileUtils;
import org.bytedeco.javacpp.BytePointer;
import org.bytedeco.javacpp.lept;
import org.bytedeco.javacpp.lept.PIX;
import org.bytedeco.javacpp.tesseract.TessBaseAPI;
import org.imgscalr.Scalr;
import org.jsoup.select.Evaluator.ContainsText;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.Color;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;
import com.sun.mail.imap.Utility.Condition;


public class ProgramPerformance extends BaseClass{
	
	int ECEpiosdeCount,claimsEpiosdeCount,TotalNPRA,TotalProgram;
    Double savingRate,DischargeToSNF,SNFDaysClaims, SNFDaysEC,EpisodesWithReadmissionClaims,dischargetoSNFBenchmarkClaims,DischargeToSNFEC,dischargetoSNFBenchmarkEC,EpisodesWithReadmissionEC,SNFDaysBenchmarkClaims,
    SNFDaysBenchmarkEC,EpisodesWithReadmissionBenchmarkClaims,EpisodesWithReadmissionBenchmarkEC;
    String facilityname,facilitybpid,episodeInitiatorNameInitCap_1,bpid_1,episodeInitiatorNameInitCap_2,bpid_2, facilityNameValidation,ccnValidation,
    bundleName1,bundleName2,bundleName3,bundleName4,region,market,regionPartner,marketPartner,participantName,model,facilityNameInitCap;
    List<String> bundle_Name= new ArrayList<>();
    List<String> DRG_fracture= new ArrayList<>();
    List<String> Physician_NPI= new ArrayList<>();
    Actions act=new Actions(driver);
	WebDriverWait wait = new WebDriverWait(driver, 300);
	public static ArrayList<String> col= new ArrayList<String>();
	public static HashMap<String, String> outputText =new HashMap<String,String>();
	public static String FinalOutput=null;
	public static List<String> arrayListTexts=new ArrayList<String>();
	public static PrintWriter writer = null;
	public static PrintWriter writerLog = null;
	public static Map<String,HashMap<String,String>> mapOfHmImageOuput = new HashMap<String,HashMap<String,String>>();
	public static HashMap<String, String> imageOutput;
	public static Map<String,HashMap<String,String>> mapOfHmFiltersValue = new HashMap<String,HashMap<String,String>>();
	public static HashMap<String, String> rowFilters;
	public static String rowFilterIndex;
	List<String> RegionMarketArrayList = new ArrayList<String>();
	public ProgramPerformance(WebDriver driver) {
		super(driver);
	}
	
	public void iWaitTillTheVisibilityOfFieldOLoginPage(String text){
		iWillWaitToSee(By.xpath("//input[@title='"+text+"']"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//input[@title='"+text+"']")));
	}
	
	public void iEnterInFieldsForAnalyticsOnLoginPage(String field,String value){
		iWillWaitToSee(By.name("email"));
		iFillInText(driver.findElement(By.name("email")), value);
	}
	
	public void iClickonSignInButtonOnAnalyticsLoginPage(String text){
		clickElement(driver.findElement(By.xpath("//button[@tb-test-id='button-"+text+"']")));
	}
	
	public void iWaitTillTheVisibilityOfSectionsOnProjectsPage(){
		iWillWaitToSee(By.cssSelector(".tb-thumbnail.tb-thumbnail-old.tb-project-thumbnail-old.ng-scope"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".tb-thumbnail.tb-thumbnail-old.tb-project-thumbnail-old.ng-scope")));
	}
	
	public void iClickOnSectionOnProjectsPage(String text){
		iWillWaitToSee(By.cssSelector(".tb-thumbnail.tb-thumbnail-old.tb-project-thumbnail-old.ng-scope"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".tb-thumbnail.tb-thumbnail-old.tb-project-thumbnail-old.ng-scope")));
		clickElement(driver.findElement(By.xpath("//a[text()='"+text+"']")));
	}
	
	public void iWaitToSeeTheWorkbooksOnWorkbooksPage(){
		iWillWaitToSee(By.cssSelector(".tb-thumbnail-overlay"));
	}
	
	public void iClickOnDashboardWithNameOnWorkBook(String dashboard){
		iWillWaitToSee(By.cssSelector(".tb-thumbnail-overlay"));
		selectElementByTextDescByXpath("//a[div[text()='View']/preceding-sibling::div]/../following-sibling::div/a", dashboard);
	}
	
	public void iWaitTillInvisibiltyOfLoaderAfterClickingDashboard(){
		iWillWaitToSee(By.cssSelector(".tabCanvas.tab-widget"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".tabCanvas.tab-widget")));
	}
	
	public void iSwitchToAnalyticsFrameWithXpath(String frameXpath){
		try{
		delay();
		iWillWaitToSee(By.xpath(frameXpath));
        swithToFrame(frameXpath);
        delay();}
		catch(Exception e){
    	    	ProgramPerformance.rowFilters.put("SwitchFrame","Failed on Switch Frame");
        	    ProgramPerformance.mapOfHmFiltersValue.put(ProgramPerformance.rowFilterIndex,ProgramPerformance.rowFilters);
			    e.printStackTrace();
	    	    ProgramPerformance.writer.print(System.lineSeparator());
	    		String flag="1";
	    		Assert.assertEquals("2", flag);
	     }
    }
	
	public void iValidateTextWhenIncorrectCredentialsEntered(String text,String message){
		isElementVisible(driver.findElement(By.xpath("//div[text()='"+text+"']")));
		isElementVisible(driver.findElement(By.xpath("//div[text()='"+message+"']")));
	}
	
	public void iValidateTextForDashboard(String text){
		try{
		iWillWaitToSee(By.xpath("//div[@class='tab-textRegion-content']/span/div/span[text()='"+text+"']"));}
		catch(Exception e){
	    	 ProgramPerformance.writer.print(System.lineSeparator());
	    		String flag="1";
	    		Assert.assertEquals("2", flag);
	     }
//		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".tabCanvas.tab-widget")));
//		isElementVisible(driver.findElement(By.xpath("//div[@id='dashboard-viewport']//span[text()='"+text+"']")));
	}
	
	public void iValidateTextForBANSections(String text){
		isElementVisible(driver.findElement(By.xpath("//div[@id='dashboard-viewport']//span[text()='"+text+"']")));
	}
	
	public void iVerifyCountSectionOnTheDashboards(String count,String text){
		isElementVisible(driver.findElement(By.xpath("//div[@tb-test-id='KPI_"+count+"']//div[@class='tvimagesContainer']/canvas")));
	}
	
	public void iVerifyTheLegendIsAppearingOnDashboard(String text){
		isElementVisible(driver.findElement(By.xpath("//div[@tb-test-id='"+text+"(legend)']")));
	}
	
	public void iVerifyColorCodeForLegegend(String field,String color,String code){
		String value=driver.findElements(By.xpath("//div[@tb-test-id='Performing(legend)']//div[@class='tvimagesContainer']")).get(6).getCssValue("color");
		System.out.println(value);
		String hex = Color.fromString(value).asHex();
		System.out.println(hex);
	}
	
	public void iVerifySavingsRateSectionOnTheDashboards(String text){
		isElementVisible(driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas")));
	}
	
	public void iVerifyReadmissionsSectionOnTheDashboards(){
		isElementVisible(driver.findElement(By.xpath("//div[@tb-test-id='Readmissions Current']//div[@class='tvimagesContainer']/canvas")));
	}
	
//	public void Screenshot1() throws Exception{
//		Screenshot screen=new AShot().takeScreenshot(driver, driver.findElement(By.xpath("//canvas[contains(@style,'position') and @class='tabCanvas tab-widget' and @width='152']")));
//		File fl = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
//		ImageIO.write(screen.getImage(), "PNG", fl);
//		TextFromImage();
//		testBarcodeNumber();
//		getImageAsString();
//		ITesseract tsc = new Tesseract();
//		String a = tsc.doOCR(fl);
//		Screen s=new Screen();
//		s.capture();
//		String inputFile=("user.dir")+"\\src\\test\\Imports\\Image1.png";
//		Tesseract tesseract=new Tesseract();
////		String importDir = System.getProperty("user.dir");
//		String newDir = (System.getProperty("user.dir")+"\\src\\test\\Imports\\Image1.png");
//		tesseract.setDatapath(newDir);
//		String fullText=tesseract.doOCR(fl);
//		System.out.println(fullText);
//		             Ocr.setUp(); // one time setup
//	                 Ocr ocr = new Ocr(); // create a new OCR engine
//	                 ocr.startEngine("eng", Ocr.SPEED_FASTEST); // English
//		BufferedImage image = ImageIO.read(new File(("user.dir")+"\\src\\test\\Imports\\Image1.png"));   
//		String imageText = new OCR().recognizeCharacters((RenderedImage) image);
//		System.out.println("Text From Image : \n"+ imageText);
//	                 String s = ocr.recognize(new File[] {new File(("user.dir")+"\\src\\test\\Imports\\Image1.png")},
//	    	                  Ocr.RECOGNIZE_TYPE_ALL, Ocr.OUTPUT_FORMAT_PLAINTEXT);
//	                 System.out.println("Result: " + s);
//	                 ocr.stopEngine();
//    }
	
//	public static byte[] readImageTextFile()
//	{
//		byte[] dataFile = null;
//		try
//		{
//			StringBuffer textData = new StringBuffer();
//			FileInputStream fstream = new FileInputStream(("user.dir")+"\\src\\test\\Imports\\Image1.png");
//			DataInputStream in = new DataInputStream(fstream);
//			BufferedReader br = new BufferedReader(new InputStreamReader(in));
//			String srtData;
//			while ((srtData = br.readLine()) != null) {
//				textData.append(srtData);
//			}
//			br.close();
//			fstream.close();
//			in.close();
//			dataFile = new sun.misc.BASE64Decoder().decodeBuffer(textData.toString());
//		}
//		catch( Exception e )
//		{
//			e.printStackTrace();
//		}
//		return dataFile;
//	}
//
//	public static String getImageAsString()
//	{
//		
//		String dataContents = null;
//		try
//		{
//			File file = new File(System.getProperty(("user.dir"))+"\\src\\test\\Imports\\Image1.png");
//			byte[] fileData = new byte[ (int)file.length()];
//			InputStream inStream = new FileInputStream( file );
//			inStream.read(fileData);
//			inStream.close();
//			String tempFileData = new String(fileData);
//			String finalData = tempFileData.substring(tempFileData
//					.indexOf(extraStr)
//					+ extraStr.length(), tempFileData.length());
//			byte[] temp = new sun.misc.BASE64Decoder().decodeBuffer(tempFileData);
//			dataContents = new String(temp);
//		}
//		catch( Exception e )
//		{
//			e.printStackTrace();
//		}
//		return dataContents;	
//		String imageString = null;
//		try
//		{
//			File f = new File(System.getProperty(("user.dir"))+"\\src\\test\\Imports\\Image1.png");
//			BufferedImage buffImage = ImageIO.read(f);
//			ByteArrayOutputStream os= new ByteArrayOutputStream();
//			ImageIO.write(buffImage, "PNG", os);
//			byte[] data= os.toByteArray();
//			imageString = new sun.misc.BASE64Encoder().encode(data);
//			System.out.println(imageString);
//		}
//		catch( FileNotFoundException fnfe )
//		{
//			fnfe.printStackTrace();
//			System.out.println("Image is not located in the proper path.");
//		}
//		catch (IOException e) 
//		{
//			e.printStackTrace();
//			System.out.println("Error in reading the image.");
//		}
//		return imageString;
//	}
//	}
	
//	 public void testBarcodeNumber() throws Exception {
//	        // get and capture the picture of the img element used to display the barcode image
////	        WebElement barcodeImage = driver.findElement(By.xpath("//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']"));
////	        File imageFile = captureElementPicture(barcodeImage);
//	 
//	        // get the Tesseract direct interace
//		 File imageFile = new File(System.getProperty(("user.dir"))+"\\src\\test\\Imports\\Image1.png");
//	        Tesseract instance = new Tesseract();
//	 
//	        // the doOCR method of Tesseract will retrive the text
//	        // from image captured by Selenium
//	        String result = instance.doOCR(imageFile);
//	 
//	        // check the the result
////	        assertEquals("Application number did not match", "123-45678", result.trim());
//	        System.out.println(result);
//	    }
	 
//	 public File captureElementPicture(WebElement element)
//	            throws Exception {
//	 
//	        // get the WrapsDriver of the WebElement
//	        WrapsDriver wrapsDriver = (WrapsDriver) element;
//	 
//	        // get the entire screenshot from the driver of passed WebElement
//	        File screen = ((TakesScreenshot) wrapsDriver.getWrappedDriver())
//	                .getScreenshotAs(OutputType.FILE);
//	 
//	        // create an instance of buffered image from captured screenshot
//	        BufferedImage img = ImageIO.read(screen);
//	 
//	        // get the width and height of the WebElement using getSize()
//	        int width = element.getSize().getWidth();
//	        int height = element.getSize().getHeight();
//	 
//	        // create a rectangle using width and height
//	        Rectangle rect = new Rectangle(width, height);
//	 
//	        // get the location of WebElement in a Point.
//	        // this will provide X & Y co-ordinates of the WebElement
//	        Point p = element.getLocation();
//	 
//	        // create image  for element using its location and size.
//	        // this will give image data specific to the WebElement
//	        BufferedImage dest = img.getSubimage(p.getX(), p.getY(), rect.width,
//	                rect.height);
//	 
//	        // write back the image data for element in File object
//	        ImageIO.write(dest, "png", screen);
//	 
//	        // return the File object containing image data
//	        return screen;
//	    } 
	 
	 public void TakeShotOFElement(String count,String element,String resolution) throws IOException {
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement ele = driver.findElement(By.xpath(element));
		 scrollIntoViewByJS(ele);
		 File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		 BufferedImage  fullImg = ImageIO.read(screenshot);
		 Point point = ele.getLocation();
//		 Point point = new Point(515,160);
		 point = point.moveBy(0, 87);
		 System.out.println(point);
		 int eleWidth = ele.getSize().getWidth();
		 int eleHeight = ele.getSize().getHeight();
		 
		 BufferedImage eleScreenshot= fullImg.getSubimage(point.getX(), point.getY(),
				    eleWidth, eleHeight);
//		 getScaledInstance(eleScreenshot,300,300,RenderingHints.VALUE_INTERPOLATION_BILINEAR,true);
		 BufferedImage scaledImg = Scalr.resize(eleScreenshot, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH,
				 height, width, Scalr.OP_ANTIALIAS); 
		 ImageIO.write(scaledImg, "png", screenshot);
//		 BufferedImage thumbImage = new BufferedImage(600, 500, BufferedImage.TYPE_INT_ARGB);
//		    Graphics2D g2d = thumbImage.createGraphics();
//		    g2d.drawImage(eleScreenshot.getScaledInstance(600, 500, Image.SCALE_SMOOTH), 0, 0, 600, 500, null);
//		    g2d.dispose();
//		    ImageIO.write(thumbImage, "png", screenshot);
//		 BufferedImage bigger = Thumbnails.of(eleScreenshot).size(800, 500).asBufferedImage();
//				ImageIO.write(bigger, "png", screenshot);
				File screenshotLocation = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
				if(screenshotLocation.exists())
				{
					screenshotLocation.delete();
				}
				FileUtils.copyFile(screenshot, screenshotLocation);
//				greyscale();
//				TextFromImage();
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 String FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
				 Assert.assertEquals(count.trim(), FinalOutput.trim());
	 }
	 
	 
	 //Main Method to fetch text from screenshot
	 public void TextFromImage(){
		 TessBaseAPI instance=new TessBaseAPI();
		 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
		 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
		 instance.SetImage(image);
		 BytePointer bytePointer=instance.GetUTF8Text();
		 String output=bytePointer.getString();
		 System.out.println("Text in image is"+output);
	 }
	 
	 public void IUploadImageInOnlineOCR(){
		 driver.findElement(By.cssSelector("body")).sendKeys(Keys.CONTROL +"t");
	 }
	 
	public BufferedImage getScaledInstance(BufferedImage img, int targetWidth,
			int targetHeight, Object hint, boolean higherQuality) {
		int type = (img.getTransparency() == Transparency.OPAQUE) ? BufferedImage.TYPE_INT_RGB
				: BufferedImage.TYPE_INT_ARGB;
		BufferedImage ret = (BufferedImage) img;
		int w, h;
		if (higherQuality) {
			// Use multi-step technique: start with original size, then
			// scale down in multiple passes with drawImage()
			// until the target size is reached
			w = img.getWidth();
			h = img.getHeight();
		} else {
			// Use one-step technique: scale directly from original
			// size to target size with a single drawImage() call
			w = targetWidth;
			h = targetHeight;
		}

		do {
			if (higherQuality && w > targetWidth) {
				w /= 2;
				if (w < targetWidth) {
					w = targetWidth;
				}
			}

			if (higherQuality && h > targetHeight) {
				h /= 2;
				if (h < targetHeight) {
					h = targetHeight;
				}
			}

			BufferedImage tmp = new BufferedImage(w, h, type);
			Graphics2D g2 = tmp.createGraphics();
			g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, hint);
			g2.drawImage(ret, 0, 0, w, h, null);
			g2.dispose();

			ret = tmp;
		} while (w != targetWidth || h != targetHeight);

		return ret;
	}
	
	 public void greyscale(String fileLocation)throws IOException{
		    BufferedImage img = null;
		    File f = null;

		    //read image
		    try{
		      f = new File(fileLocation);
		      img = ImageIO.read(f);
		    }catch(IOException e){
		      System.out.println(e);
		    }

		    //get image width and height
		    int width = img.getWidth();
		    int height = img.getHeight();

		    //convert to grayscale
		    for(int y = 0; y < height; y++){
		      for(int x = 0; x < width; x++){
		        int p = img.getRGB(x,y);

		        int a = (p>>24)&0xff;
		        int r = (p>>16)&0xff;
		        int g = (p>>8)&0xff;
		        int b = p&0xff;

		        //calculate average
		        int avg = (r+g+b)/3;

		        //replace RGB value with avg
		        p = (a<<24) | (avg<<16) | (avg<<8) | avg;

		        img.setRGB(x, y, p);
		      }
		    }

		    //write image
		    try{
		      f = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
		      ImageIO.write(img, "jpg", f);
		    }catch(IOException e){
		      System.out.println(e);
		    }
		  }//main() ends here
	 
	 public void TakeShotOFBlueColorElement(String count,String element,String resolution) throws IOException {
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement ele = driver.findElement(By.xpath(element));
		 scrollIntoViewByJS(ele);
		 File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		 BufferedImage  fullImg = ImageIO.read(screenshot);
		 Point point = ele.getLocation();
		 point = point.moveBy(0, 87);
		 System.out.println(point);
		 int eleWidth = ele.getSize().getWidth();
		 int eleHeight = ele.getSize().getHeight();
		 
		 BufferedImage eleScreenshot= fullImg.getSubimage(point.getX(), point.getY(),
				    eleWidth, eleHeight);
		 
		 BufferedImage scaledImg = Scalr.resize(eleScreenshot, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH,
				 height, width, Scalr.OP_ANTIALIAS); 
		 ImageIO.write(scaledImg, "png", screenshot);
				File screenshotLocation = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Blue.png");
				if(screenshotLocation.exists())
				{
					screenshotLocation.delete();
				}
				FileUtils.copyFile(screenshot, screenshotLocation);
				String fileLocation = System.getProperty("user.dir")+"\\src\\test\\Imports\\Blue.png";
				greyscale(fileLocation);	
				
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 String FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
				 Assert.assertEquals(count.trim(), FinalOutput.trim());
	 }
	 
	 public void executejmeter(String location) throws IOException, InterruptedException
	    {
		 File jmx=new File(System.getProperty("user.dir")+location);
		 final Process process = Runtime.getRuntime().exec("cmd /c start cmd.exe /K \"cd "+DriverScript.Config.getProperty("jmeterPath")+" && jmeter -n -t"+" "+jmx+" && exit\"");
	   
		 BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));

		 String line=null;

		 while((line=input.readLine()) != null) {
		 System.out.println(line);} 
		 final int exitVal = process.waitFor();
		 System.out.println("JMeter Execution over #"+exitVal);
		 Thread.sleep(5000);
	    }
	 
	 public void iClickOnDashboard(String dashboard) throws Exception{
		 try{
		 iWillWaitToSee(By.cssSelector(".report-title"));
		 if(DriverScript.Config.getProperty("Browser").equals("ie"))
	        {
			 Thread.sleep(2000);
			 List<WebElement> listItems = driver.findElements(By.cssSelector(".report-title"));
				System.out.println("List item is"+listItems);
				for (WebElement item : listItems) {
                 if (item.getText().equalsIgnoreCase(dashboard)) {
                	    ((JavascriptExecutor)driver).executeScript("arguments[0].click();", item);
					//     Thread.sleep(4000);
					     break;
					}
				}
			  }
		 else{
		 selectElementByDesc(".report-title", dashboard);}
		 longDelay();
		 iWillWaitToSee(By.cssSelector(".component-report-header"));
		 longDelay();}
		 catch(Exception e){
        		ProgramPerformance.rowFilters.put("ClickDashboard","Failed on ClickDashboard");
	    	 ProgramPerformance.mapOfHmFiltersValue.put(ProgramPerformance.rowFilterIndex,ProgramPerformance.rowFilters);
			 throw e;
	     }
	 }
	 
	 public void setAttributevalue(WebElement element, String attName, String attValue) {
		  JavascriptExecutor js = (JavascriptExecutor) driver;
		  js.executeScript("arguments[0].setAttribute(arguments[1], arguments[2]);", 
		                element, attName, attValue);
     }
	 
	 public void iSetCalendarAttributeValue(String date){
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
//		 setAttributevalue(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")),"value",date);
		 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), date);
//		 driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")).sendKeys(Keys.ENTER);
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
//		 clickElement(driver.findElement(By.xpath("//span[@class='tab-datepicker-today-date']")));
		 delay();
//		 longDelay();
//		 longDelay();
//		 delay();
//		 iWillWaitToSee(By.cssSelector("#svg-spinner"));
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 iWillWaitToSee(By.cssSelector(".tabCanvas.tab-widget"));
	 }
	 
	 public void iReadTextFromOutputfile(String location) throws IOException, InterruptedException{
		 Thread.sleep(5000);
		 BufferedReader br=new BufferedReader(new FileReader(System.getProperty("user.dir")+location));
				 String names;
				 System.out.println("Read Line "+br.lines());
//				 ArrayList<String> elements = new ArrayList<String>();
				 while ((names = br.readLine())!= null) {           
					 delay();
				     col.add(names);
				     System.out.println("Vivek Col"+col.toString());
//					 StringTokenizer st = new StringTokenizer(names, "*");     
					
					
//					 elements.add(names);
//					 while (st.hasMoreTokens()){
//				      elements.add(st.nextToken());
//				     }
//				     delay();
//				     col.add(names);
				  //   elements.clear();
//		      String ECCount=elements.get(0).trim();
//		      String ec[]=ECCount.split("=");
//		      ECEpiosdeCount=Integer.parseInt(ec[1]);
//		      numberformat(ECEpiosdeCount);
//		      System.out.println("The Episode Count value is"+ECEpiosdeCount);
//		      String claimsCount=elements.get(1).trim();
//		      String claims[]=claimsCount.split("=");
//		      claimsEpiosdeCount=Integer.parseInt(claims[1]);
//		      numberformat(claimsEpiosdeCount);
//		      System.out.println("The Claims count value is"+claimsEpiosdeCount);
//		      String sRate=elements.get(2).trim();
//		      String saving[]=sRate.split("=");
//		      Double sav=Double.parseDouble(saving[1]);
//		      savingRate=sav;
//		      System.out.println("The savings rate value is"+savingRate);
//		      String TNPRA=elements.get(3).trim();
//		      String npra[]=TNPRA.split("=");
//		      TotalNPRA=Integer.parseInt(npra[1]);
//		      numberformat(TotalNPRA);
//		      System.out.println("The total npra value is"+TotalNPRA);
//		      String TProgram=elements.get(4).trim();
//		      String program[]=TProgram.split("=");
//		      TotalProgram=Integer.parseInt(program[1]);
//		      numberformat(TotalProgram);
//		      System.out.println("The total program value is"+TotalProgram);
//		      String sDate=elements.get(5).trim();
//		      String startD[]=sDate.split("=");
//		      StartDate=startD[1];
//		      System.out.println("Start Date is"+StartDate);
//		      String dSNF=elements.get(6).trim();
//		      String Dtosnf[]=dSNF.split("=");
//		      Double snf=Double.parseDouble(Dtosnf[1]);
//		      DischargeToSNF=snf;
//		      System.out.println("The discharge to snf value is"+DischargeToSNF);
//		      String SnfDaysClaims=elements.get(7).trim();
//		      String snfDClaims[]=SnfDaysClaims.split("=");
//		      Double snfdaysClaims=Double.parseDouble(snfDClaims[1]);
//		      SNFDaysClaims=snfdaysClaims;
//		      System.out.println("The snf days Claims value is"+SNFDaysClaims);
//		      String EWReadmissionClaims=elements.get(8).trim();
//		      String EReadmissionClaims[]=EWReadmissionClaims.split("=");
//		      Double episodeRClaims=Double.parseDouble(EReadmissionClaims[1]);
//		      EpisodesWithReadmissionClaims=episodeRClaims;
//		      System.out.println("The episodes with readmissions value is Claims"+EpisodesWithReadmissionClaims);
//		      String dsnfbenchmarkclaims=elements.get(9).trim();
//		      String SNFBenchmarkClaims[]=dsnfbenchmarkclaims.split("=");
//		      Double BenchmarkSNFClaims=Double.parseDouble(SNFBenchmarkClaims[1]);
//		      dischargetoSNFBenchmarkClaims=BenchmarkSNFClaims;
//		      System.out.println("The discharge to snf benchmark value for claims is"+dischargetoSNFBenchmarkClaims);
//		      String dSNFEC=elements.get(10).trim();
//		      String DtosnfEC[]=dSNFEC.split("=");
//		      Double snfEC=Double.parseDouble(DtosnfEC[1]);
//		      DischargeToSNFEC=snfEC;
//		      System.out.println("The discharge to snf value for EC is"+DischargeToSNFEC);
//		      delay();
//		      String dsnfbenchmarkEC=elements.get(11).trim();
//		      String SNFBenchmarkEC[]=dsnfbenchmarkEC.split("=");
//		      Double BenchmarkSNFEC=Double.parseDouble(SNFBenchmarkEC[1]);
//		      dischargetoSNFBenchmarkEC=BenchmarkSNFEC;
//		      System.out.println("The discharge to snf benchmark value for EC is"+dischargetoSNFBenchmarkEC);
//		      String SnfDaysEC=elements.get(12).trim();
//		      String snfDEC[]=SnfDaysEC.split("=");
//		      Double snfdaysEC=Double.parseDouble(snfDEC[1]);
//		      SNFDaysEC=snfdaysEC;
//		      System.out.println("The snf days EC value is"+SNFDaysEC);
//		      String EWReadmissionEC=elements.get(13).trim();
//		      String EReadmissionEC[]=EWReadmissionEC.split("=");
//		      Double episodeREC=Double.parseDouble(EReadmissionEC[1]);
//		      EpisodesWithReadmissionEC=episodeREC;
//		      System.out.println("The episodes with readmissions value is EC"+EpisodesWithReadmissionEC);
//		      String EWReadmissionBenchmarkClaims=elements.get(14).trim();
//		      String EReadmissionBMClaims[]=EWReadmissionBenchmarkClaims.split("=");
//		      Double episodeRBMClaim=Double.parseDouble(EReadmissionBMClaims[1]);
//		      EpisodesWithReadmissionBenchmarkClaims=episodeRBMClaim;
//		      System.out.println("The episodes with readmissions value is EC"+EpisodesWithReadmissionBenchmarkClaims);
//		      String EWReadmissionBenhmarkEC=elements.get(15).trim();
//		      String EReadmissionBenchmarkEC[]=EWReadmissionBenhmarkEC.split("=");
//		      Double episodeRBenchmarkEC=Double.parseDouble(EReadmissionBenchmarkEC[1]);
//		      EpisodesWithReadmissionBenchmarkEC=episodeRBenchmarkEC;
//		      System.out.println("The episodes with readmissions value is EC"+EpisodesWithReadmissionBenchmarkEC);
//		      String snfDaysBMClaims=elements.get(16).trim();
//		      String SNFDaysBenchMClaims[]=snfDaysBMClaims.split("=");
//		      Double BenchmarkSNFDaysClaims=Double.parseDouble(SNFDaysBenchMClaims[1]);
//		      SNFDaysBenchmarkClaims =BenchmarkSNFDaysClaims;
//		      System.out.println("The episodes with SNF Days Benchmark Claims"+SNFDaysBenchmarkClaims);
//		      String snfDaysBMEC=elements.get(17).trim();
//		      String SNFDaysBenchMEC[]=snfDaysBMEC.split("=");
//		      Double BenchmarkSNFDaysEC=Double.parseDouble(SNFDaysBenchMEC[1]);
//		      SNFDaysBenchmarkEC =BenchmarkSNFDaysEC;
//		      System.out.println("The episodes with SNF Days Benchmark EC"+SNFDaysBenchmarkEC);
				 }
	 }
	 
	 public void iReadRowFilterValueFormTxt(String location) throws IOException{
		 BufferedReader br=new BufferedReader(new FileReader(System.getProperty("user.dir")+location));
		 String names;
		 while ((names = br.readLine())!= null) {           

			 StringTokenizer st = new StringTokenizer(names, "!");     
			 List<String> elements = new ArrayList<String>();
		     while (st.hasMoreTokens()){
		      elements.add(st.nextToken());
		     }
		     String episodeInitNamebpid=elements.get(1).trim();
		      String EpisodeInitNamebpid[]=episodeInitNamebpid.split("=");
		      episodeInitiatorNameInitCap_1=EpisodeInitNamebpid[1];
		      String episodeInitbpid=elements.get(2).trim();
		      String EpisodeInitBpid[]=episodeInitbpid.split("=");
		      bpid_1 =EpisodeInitBpid[1];
		      /** Concat Name and Id ex - Lawrence General Hospital - 2070-b72 **/
		      System.out.println("BPID Filter"+episodeInitiatorNameInitCap_1+" "+"-"+" "+bpid_1);
		      episodeInitiatorNameInitCap_1=episodeInitiatorNameInitCap_1+" "+"-"+" "+bpid_1;
		      String episodeInitNamebpid1=elements.get(3).trim();
		      String EpisodeInitNamebpid1[]=episodeInitNamebpid1.split("=");
		      episodeInitiatorNameInitCap_2=EpisodeInitNamebpid1[1];
		      String episodeInitbpid1=elements.get(4).trim();
		      String EpisodeInitBpid1[]=episodeInitbpid1.split("=");
		      bpid_2 =EpisodeInitBpid1[1];
		      /** Concat Name and Id ex - Lawrence General Hospital - 2070-b72 **/
		      System.out.println("BPID Filter"+episodeInitiatorNameInitCap_2+" "+"-"+" "+bpid_2);
		      episodeInitiatorNameInitCap_2=episodeInitiatorNameInitCap_2+" "+"-"+" "+bpid_2;
		      /** Validation of Facility Name & CCN value **/
		      String fnameValidation=elements.get(5).trim();
		      String facNameValidtn[]=fnameValidation.split("=");
		      facilityNameValidation=facNameValidtn[1];
		      String ccn_validtn=elements.get(6).trim();
		      String ccn_validatnArry[]=ccn_validtn.split("=");
		      ccnValidation=ccn_validatnArry[1];
		      System.out.println("Facility Name And CCN value:"+facilityname+" "+"-"+" "+ccnValidation);
		      /** BundleNames Validation **/
		      for (int i=7;i<=10;i++){
		    	  String bundle_NameTmp=elements.get(i).trim();
			      String bundle_NameTmpArry[]=bundle_NameTmp.split("=");
			      bundle_Name.add(bundle_NameTmpArry[1].trim());
			      System.out.println("bundle_Name: "+bundle_NameTmpArry[1]);
		      }
		      /**Region and Market filter**/
		      String regionTemp=elements.get(11).trim();
		      String regionTempArry[]=regionTemp.split("=");
		      region=regionTempArry[1];
		      String marketTemp=elements.get(12).trim();
		      String marketTempArry[]=marketTemp.split("=");
		      market=marketTempArry[1];
		      System.out.println("Region amd market value: "+"Remedy-"+region+"-"+market);
		      /** Verify Null value for Partner Region Market Filter **/
		      String regionPartnerTemp=elements.get(13).trim();
		      String regionPartnerTempArry[]=regionPartnerTemp.split("=");
		      regionPartner=regionPartnerTempArry[1];
		      String marketPartnerTemp=elements.get(14).trim();
		      String marketPartnerTempArry[]=marketPartnerTemp.split("=");
		      marketPartner=marketPartnerTempArry[1];
		      System.out.println("Value of Partner Region and Market:"+regionPartner+"<----->"+marketPartner);
		      /**Participant Data Filter  **/
		      String participantNameTemp=elements.get(15).trim();
		      String participantNameTempArry[]=participantNameTemp.split("=");
		      participantName=participantNameTempArry[1];
		      System.out.println("Value of ParticipantName: "+participantName);
		      /** Storing Values of DRG Fracture in list **/
		      for (int i=16;i<=36;i++){
		    	  String DRG_FractureTmp=elements.get(i).trim();
			      String DRG_FractureTmpArry[]=DRG_FractureTmp.split("=");
			      DRG_fracture.add(DRG_FractureTmpArry[1]);
			      System.out.println("DRG_Fracture: "+DRG_FractureTmpArry[1]);
		      }
		      /** Storing Values of Physician Npi Fracture in list **/
		      for (int i=37;i<=66;i++){
		    	  String Physician_NPITmp=elements.get(i).trim();
			      String Physician_NPITmpArry[]=Physician_NPITmp.split("=");
			      Physician_NPI.add(Physician_NPITmpArry[1]);
			      System.out.println("Physician_NPI: "+Physician_NPITmpArry[1]);
		      }
		      String modelTmp=elements.get(67).trim();
		      String modelTmpArry[]=modelTmp.split("=");
		      model=modelTmpArry[1];
		      System.out.println("Model: "+model);
		      
		      String facilityNameInitCapTemp=elements.get(68).trim();
		      String facilityNameInitCapTempArry[]=facilityNameInitCapTemp.split("=");
		      facilityNameInitCap=facilityNameInitCapTempArry[1];
		      System.out.println("Anchor Facility Details: "+facilityNameInitCap);
		     }
	 }

	public String numberformat(int number) {
	      NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
	      String numberAsString = numberFormat.format(number);
	      System.out.println(numberAsString);
		return numberAsString;
	   }
	 
	 public void GetTextFromScreenShot(String text,String element,String resolution) throws IOException {
		 delay();
		 longDelay();
//		 scrollToTopOfThePage();
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement ele = driver.findElement(By.xpath(element));
		 if(text.contains("Readmissions Current"))
		 {
		 scrollIntoViewByJS(ele);
		 delay();
		 }
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
				greyscale(fileLocation);
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 FinalOutput=output.replaceAll("\\s+", "").replace("$","").replaceAll(",", "").trim();
				 System.out.println(FinalOutput);
				 //Replacing l with 1
				 FinalOutput = FinalOutput.replaceAll("l", "1").trim();
				 System.out.println("FinalOutput="+FinalOutput);
				 if(FinalOutput.isEmpty()){
					 imageOutput.put(text, FinalOutput);
				 }
				 imageOutput.put(text, FinalOutput);
	 }
	 
	 public void iSetStartAndEndDateForClaimsData(String start){
		 longDelay();
//		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
		 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), start);
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
//		 *****************iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), StartDate);
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
		 iWillWaitToSee(By.cssSelector(".tabCanvas.tab-widget"));
		 longDelay();
		 delay();
	 }
	 
	 public void iSetDateInDateFieldAttribute(String field, String value){
		 try{
		 delay();
		 try{
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));}
		 catch(Exception e){
			 
		 }
		 if(field.equals("Start Date")){
			 if(value.contains("ECStartDate")){
				 if(DriverScript.Config.getProperty("Browser").equals("ie")){
					 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']"))); }else{
				 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));}
				 delay();
				 WebElement element=driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']"));
				 if(DriverScript.Config.getProperty("Browser").equals("ie")){
				 ((JavascriptExecutor)driver).executeScript("arguments[1].value = arguments[0];", element, DriverScript.Config.getProperty("ECStartDate"));}
//				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")),outputText.get("ECStartDateDB"));
				 else{
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")),DriverScript.Config.getProperty("ECStartDate"));}
				 }else if(value.contains("ClaimsStartDate")){
					 if(DriverScript.Config.getProperty("Browser").equals("ie")){
						 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));  
					 }else{
					 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));}
					 delay();
//					 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")),outputText.get("ECStartDateDB"));
					 String date2=DriverScript.Config.getProperty("ClaimsStartDate");
					 if(DriverScript.Config.getProperty("Browser").equals("ie")){
						 ((JavascriptExecutor)driver).executeScript("arguments[1].value = arguments[0];", date2,driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")));	 
						 driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")).sendKeys(Keys.ENTER);
					 }else{
			        iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")),DriverScript.Config.getProperty("ClaimsStartDate"));}
					 }else {
				 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
				 delay();
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), value);
			 }
		 }else if (field.equals("End Date")){
			 if(value.contains("ClaimsCubeDate")){
				 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
				// clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
				 delay();
//				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), outputText.get("ClaimsCubeDateDB"));
				 if(DriverScript.Config.getProperty("Browser").equals("ie")){
				 ((JavascriptExecutor)driver).executeScript("arguments[1].value = arguments[0];", DriverScript.Config.getProperty("ClaimsCubeDate"), driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")));
				 }else{
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), DriverScript.Config.getProperty("ClaimsCubeDate"));}
				 }else if(value.contains("Today")){
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
				 delay();
				 clickElement(driver.findElement(By.xpath("//span[@class='tab-datepicker-today-date']")));
				 }else{
				 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
				 delay();
				 if(DriverScript.Config.getProperty("Browser").equals("ie")){
				 ((JavascriptExecutor)driver).executeScript("arguments[1].value = arguments[0];", driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")),value); 
				 }else{
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), value);}
				 }
		          }
		 delay();
//		 WebElement elem = driver.findElement(By.xpath("//span[text()='Bundle']/../../../../.. //span[@role='combobox']"));
		 WebElement elem =driver.findElement(By.xpath("//span[text()='Time']"));
		 if(DriverScript.Config.getProperty("Browser").equals("ie")){
	//		 driver.findElement(By.id("Value")).sendKeys(Keys.ENTER);
//		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector("td.tab-datepicker-day-cell-selected"))); 
		 }else{
		 act.moveToElement(elem).click().build().perform();}
		 delay();
		 if(driver.findElements(By.xpath("//div[@data-tb-test-id='Dialog-Provider-Dialog-CloseButton']")).size()==1){
			 driver.switchTo().defaultContent();
			 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@data-tb-test-id='Dialog-Provider-Dialog-CloseButton']"))); 
		 }
		 try{
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));}
		 catch(Exception e){
			 
		 }
//		 longDelay();
//		 act.moveToElement(elem).click().build().perform();
		 delay();
	 }catch(Exception e){
		 if(field.equals("Start Date")){
		 ProgramPerformance.rowFilters.put("Set Start Time","Enter Set Start Time");
  	    ProgramPerformance.mapOfHmFiltersValue.put(ProgramPerformance.rowFilterIndex,ProgramPerformance.rowFilters);}
		 else{
			 ProgramPerformance.rowFilters.put("Set End Time","Enter Set End Time");
		  	    ProgramPerformance.mapOfHmFiltersValue.put(ProgramPerformance.rowFilterIndex,ProgramPerformance.rowFilters);
		 }
		 throw e;
     }}
	 
	 public void ReadTextFromSavingsRateField(String text,String element,String resolution) throws IOException {
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement ele = driver.findElement(By.xpath(element));
//		 scrollIntoViewByJS(ele);
		 File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		 BufferedImage  fullImg = ImageIO.read(screenshot);
		 Point point = ele.getLocation();
		 point = point.moveBy(100, 100);
		 System.out.println(point);
		 int eleWidth = ele.getSize().getWidth();
		 int eleHeight = ele.getSize().getHeight();
		 
		 BufferedImage eleScreenshot= fullImg.getSubimage(point.getX(), point.getY(),
				    eleWidth, eleHeight);
		 
		 BufferedImage scaledImg = Scalr.resize(eleScreenshot, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH,
				 height, width, Scalr.OP_ANTIALIAS); 
		 ImageIO.write(scaledImg, "png", screenshot);
				File screenshotLocation = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Blue.png");
				if(screenshotLocation.exists())
				{
					screenshotLocation.delete();
				}
				FileUtils.copyFile(screenshot, screenshotLocation);
				String fileLocation = System.getProperty("user.dir")+"\\src\\test\\Imports\\Blue.png";
				greyscale(fileLocation);	
				
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 String FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
				 Double a= ((float)(((int)Math.pow(10,1)*savingRate))/Math.pow(10,1));
				 if(text.equals("Savings Rate"))
				 {
					 Assert.assertTrue(FinalOutput.trim().contains(a.toString()));
				 }
	 }
	 
	 public void iSelectValuesFromDropDown(String text,String field,String apply){
		 if(!text.isEmpty()){
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//span[text()='"+field+"']/../../../../.. //span[@role='combobox']")));
//		 clickElement(driver.findElement(By.xpath("//input[contains(@name,'All')]")))
//		 iWillWaitToSee(By.xpath("//input[contains(@name,'All')]"));
		 delay();
		 WebElement elem = driver.findElement(By.xpath("//input[contains(@name,'All')]"));
		 
		 act.moveToElement(elem).click().build().perform();
		 if(text.contains(",")){
			 StringTokenizer st= new StringTokenizer(text, ",");
			 System.out.println(st.countTokens());
			 while (st.hasMoreTokens()){
				
//				 WebElement elem1 = driver.findElement(By.xpath("//a[contains(@title,'"+st.nextToken()+"')]/../input"));
//				 Actions act=new Actions(driver);
//				 act.moveToElement(driver.findElement(By.xpath("//a[contains(@title,'"+st.nextToken()+"')]/../input"))).click().build().perform();
				 driver.findElement(By.xpath("//a[contains(@title,'"+st.nextToken()+"')]/../input")).click();
				 delay();
			 }
		 } else {
			 driver.findElement(By.xpath("//a[contains(@title,'"+text+"')]/../input")).click();
			 delay();
		 }
		 clickElement(driver.findElement(By.xpath("//span[text()='"+apply+"']")));
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
//		 clickElement(driver.findElement(By.xpath("//span[text()='"+field+"']/../../../../.. //span[@role='combobox']")));
//		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='"+field+"']/../../../../.. //span[@role='combobox']")));
		 WebElement elem2 = driver.findElement(By.xpath("//span[text()='"+field+"']/../../../../.. //span[@role='combobox']"));
		 act.moveToElement(elem2).click().build().perform();
	 }
	 }
	 
	 public void iSetCalendarAttributeValueForEndingTodayDate(){
//		 WebElement elem = driver.findElement(By.xpath("//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']/canvas"));
//		 scrollIntoViewByJS(elem);
//		 act.moveToElement(elem).click().build().perform();
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
		 clickElement(driver.findElement(By.xpath("//span[@class='tab-datepicker-today-date']")));
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
//		 ********************iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), StartDate);
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
	 }
	 
	 public void iSetCalendarAttributeValueForTodaysEndDate(){
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
		 clickElement(driver.findElement(By.xpath("//span[@class='tab-datepicker-today-date']")));
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
		 longDelay();
	 }
	 
	 public void ireadtextfromimage() throws IOException{
		 TessBaseAPI instance=new TessBaseAPI();
		  File screenshot= new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
		  BufferedImage eleScreenshot = ImageIO.read(screenshot);
		 BufferedImage scaledImg = Scalr.resize(eleScreenshot, Scalr.Method.QUALITY, Scalr.Mode.FIT_TO_WIDTH,
				 500, 500, Scalr.OP_ANTIALIAS); 
		 ImageIO.write(scaledImg, "png", screenshot);
		 greyscale(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
		 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
		 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
		 instance.SetImage(image);
		 BytePointer bytePointer=instance.GetUTF8Text();
		 String output=bytePointer.getString();
		 System.out.println("Text in image is"+output);
		 String FinalOutput=output.replaceAll("\\s+", "");
		 System.out.println(FinalOutput);
	 }
	 
	 public void iSetCalendarstartingDateAndEndDateToToday(String text){
		 delay();
//		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
		 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), text);
		 longDelay();
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 longDelay();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
		 clickElement(driver.findElement(By.xpath("//span[@class='tab-datepicker-today-date']")));
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
	 }
	 
	 public void iReadValuesForOutputFileForIPECDashboard(String location) throws IOException{
		 BufferedReader br=new BufferedReader(new FileReader(System.getProperty("user.dir")+location));
		 String names;
		 while ((names = br.readLine())!= null) {           

			 StringTokenizer st = new StringTokenizer(names, ",");     
			 List<String> elements = new ArrayList<String>();
		     while (st.hasMoreTokens()){
		      elements.add(st.nextToken());
		     }
    	  String facility=elements.get(0).trim();
	      String nameoffacility[]=facility.split("=");
	      facilityname=nameoffacility[1];
	      System.out.println("The facility name is"+facilityname);
	      String facbpid=elements.get(1).trim();
	      String bpid[]=facbpid.split("=");
	      facilitybpid=bpid[1];
	      System.out.println("The facility bpid is"+facilitybpid);
		 }
	 }
	 
	 public void iVerifyTextInFiterFieldValues(String filter){
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//span[text()='"+filter+"']/../../../../.. //span[@role='combobox']")));
		 delay();
		 String observed=getTextForElement(driver.findElement(By.xpath("//a[contains(text(),'"+facilitybpid+"')]")));
		 String Actual=""+facilityname+" - "+facilitybpid+"";
		 Assert.assertEquals(observed.trim(), Actual.trim());
	 }
	 
	 public void iVerifyInavlidTextAppearingWhenTriedWithIncorrectCredentials(String text){
		 isElementVisible(driver.findElement(By.xpath("//span[text()='"+text+"']")));
	 }
	 
	 public void GetTextFromLegends(String text,String element,String resolution) throws IOException {
		 delay();
		 longDelay();
		 longDelay();
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement ele = driver.findElement(By.xpath(element));
		 if(text.equals("%Episodes with a Readmission"))
		 {
		 scrollIntoViewByJS(ele);
		 }
		 File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		 BufferedImage  fullImg = ImageIO.read(screenshot);
		 Point point = ele.getLocation();
		 System.out.println("XXXXXXXXXXXXXXXX"+point.getX());
		 System.out.println("YYYYYYYYYYYYYYYYY"+point.getY());
		 point = point.moveBy(80, 100);
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
				greyscale(fileLocation);
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 String FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
				 Assert.assertEquals(text, FinalOutput.trim());
	 }
	 
	 public void iVerifyDischargeToSNFSectionOnTheDashboards(){
		 isElementVisible(driver.findElement(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")));
	 }
	 public void iVerifySNFDaysSectionOnTheDashboards(){
		 isElementVisible(driver.findElement(By.xpath("//div[@tb-test-id='SNF Days Current']//div[@class='tvimagesContainer']/canvas")));
	 }
	 public void iVerifyBenchmarkVarianceFieldsOnProgramOverview(String text){
		 isElementVisible(driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas")));
	 }
	 
	 public void iVerifyFilterValueAppearingOnDasboard(String value,String filter){
		 isElementVisible(driver.findElement(By.xpath("//span[@class='tabComboBoxName'][text()='"+value+"']")));
	 }
	 
	 public void iVerifyTheGraphsAppearingOnDashboard(String text){
		 isElementVisible(driver.findElement(By.xpath("//div[contains(@tb-test-id,'"+text+"']")));
	 }
	 
	 public void iValidateMouseHoverText(String element,String verifytext){
		 WebElement elem = driver.findElement(By.xpath(element));
		 act.moveToElement(elem).click().build().perform();
		 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
		 System.out.println(gettext);
		 String a = gettext.replaceAll("\\d+.\\d+%", "");
		 a = a.replaceAll("\\d", "");
		 a = a.replaceAll("\\s+", " ");
		 System.out.println(a);
		 Assert.assertTrue(a.trim().contains(verifytext.trim()));
	 }
	 
	 public void iValidateAdjHistText(String text,String element){
		 WebElement elem = driver.findElement(By.xpath(element));
		 act.moveToElement(elem).click().build().perform();
		 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
		 System.out.println(gettext);
		 Assert.assertTrue(gettext.trim().contains(text.trim()));
	 }
	 
	 public void iValidateFilterName(String text){
		 isElementVisible(driver.findElement(By.xpath("//span[text()='"+text+"']")));
	 }
	 
	 public void iClickOnFilterName(String text,String dashboard){
         try{
          if(text.equals("Time")) {
             try{
               longDelay();
          wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
             }catch(Exception e){
             }
          delay();
         WebElement elem = driver.findElement(By.xpath("//span[text()='"+text+"']/../../../../.. /span//button[@type='button']"));
         if(DriverScript.Config.getProperty("Browser").equals("ie")){
         ((JavascriptExecutor)driver).executeScript("arguments[0].click();", elem);
         }else{
         act.moveToElement(elem).click().build().perform();}
         delay();
          }
       else if(!dashboard.contains("Skip")){
        try{
        longDelay();
        wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
        }catch(Exception e){
        }
        delay();
        WebElement elem = driver.findElement(By.xpath("//span[text()='"+text+"']/../../../../.. //span[@role='combobox']"));
        if(DriverScript.Config.getProperty("Browser").equals("ie")){
        ((JavascriptExecutor)driver).executeScript("arguments[0].click();", elem);
         }else{
        act.moveToElement(elem).click().build().perform();}
      delay();}
     }  catch(Exception e){
        throw e;
      }
  }
	 
	 public void iValidateTitleNameOnDashbaord(String text){
		 isElementVisible(driver.findElement(By.xpath("//span[text()='"+text+"']")));
	 }
	 
	 public void GetTextFromBenchmarks(String text,String element,String resolution) throws IOException {
		 delay();
		 longDelay();
		 longDelay();
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement ele = driver.findElement(By.xpath(element));
		 if(text.equals("%Episodes with a Readmission"))
		 {
		 scrollIntoViewByJS(ele);
		 }
		 File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		 BufferedImage  fullImg = ImageIO.read(screenshot);
		 Point point = ele.getLocation();
		 point = point.moveBy(80, 100);
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
				greyscale(fileLocation);
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 String FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
				 Assert.assertTrue(FinalOutput.trim().contains(text.trim()));
	 }
	 
	 public void GetTextForEpisodesWithReadmission(String text,String element,String resolution) throws IOException {
		 delay();
		 longDelay();
		 longDelay();
		 String[] str=resolution.split("X");
		 String h_value=str[0];
		 String w_value=str[1];
		 int height=Integer.parseInt(h_value);
		 int width=Integer.parseInt(w_value);
		 WebElement graphele = driver.findElement(By.xpath("//div[@tb-test-id='Readmissions Trend']//div[@class='tab-tvBottomAxis tvimagesNS']/div/canvas"));
		 act.moveToElement(graphele).click().build().perform();
		 longDelay();
		 WebElement ele = driver.findElement(By.xpath(element));
//		 scrollIntoViewByJS(ele);
		 File screenshot = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
		 BufferedImage  fullImg = ImageIO.read(screenshot);
		 Point point = ele.getLocation();
		 point = point.moveBy(80, 0);
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
				greyscale(fileLocation);
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\GreyScale.jpg");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 String FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
				 Assert.assertTrue(FinalOutput.trim().contains(text.trim()));
	 }
	 
	 public void iValidateMouseHoverTextForReadmissions(String element,String verifytext){
		 WebElement graphele = driver.findElement(By.xpath("//div[@tb-test-id='Readmissions Trend']//div[@class='tab-tvBottomAxis tvimagesNS']/div/canvas"));
		 act.moveToElement(graphele).click().build().perform();
		 longDelay();
		 WebElement elem = driver.findElement(By.xpath(element));
		 act.moveToElement(elem).click().build().perform();
		 longDelay();
		 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
		 System.out.println(gettext);
		 String a = gettext.replaceAll("\\d+.\\d+%", "");
		 a = a.replaceAll("\\d", "");
		 a = a.replaceAll("\\s+", " ");
		 System.out.println(a);
		 Assert.assertTrue(a.trim().contains(verifytext.trim()));
	 }
	 
	 public void iSaveBenchmarkToolTipText(String text,String data){
		 WebElement elem = null;
		 elem=driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas"));
		 act.moveToElement(elem).click().build().perform();
		 longDelay();
		 String getText = "null";
		 if(driver.findElements(By.xpath("//div[@class='tab-ubertipTooltip']/span")).size()>0){
		  getText=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
		 }
		 //Handle exception in else condition
		 System.out.println(getText);
		 imageOutput.put(text, getText);
		 
//		 if(text.contains("SNF Disch Benchmark Variance")){
//			 String SNF_Discharge_BM_Variance=getText;
//			 imageOutput.put(text, getText);
//			 String snfDischargeBenchMark=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
//			 System.out.println(snfDischargeBenchMark);
			 
//			 Assert.assertTrue(gettext.trim().contains(outputText.get("dischtoSNFBenchmark"+data)));
//		 }else if (text.contains("SNF Days Benchmark Variance")){
//			 String SNF_Days_BM_Variance=getText;
////			 if(outputText.get("SNFDaysBenchmark"+data).contains("${SNFDaysBenchmark"+data+"_1}")){
////				 Assert.assertFalse(isElementPresent(By.xpath("//div[@class='tab-ubertipTooltip']/span")));
////				 }
////			 else{
////				 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
////				 System.out.println(gettext);
////				 Assert.assertTrue(gettext.trim().contains(outputText.get("SNFDaysBenchmark"+data)));
////		 }
//		 }else if(text.contains("Readmissions Benchmark Variance")){
//			 String Readmissions_BM_Variance=getText;
////			 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
////			 System.out.println(gettext);
////			 Assert.assertTrue(gettext.trim().contains(outputText.get("EpisodesWithReadmissionBenchmark"+data)));
//		 }else{
//			 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
//			 System.out.println(gettext);
//			 Assert.assertTrue(gettext.trim().contains(text.toString()));
//		 }
	 }
	 
	 public void iVeriyEpisodeIntiatorBPID(){
		Assert.assertEquals(driver.findElements(By.cssSelector("#tableau_base_widget_LegacyCategoricalQuickFilter_0_menu a")).get(1).getText().trim(),episodeInitiatorNameInitCap_1);
		Assert.assertEquals(driver.findElements(By.cssSelector("#tableau_base_widget_LegacyCategoricalQuickFilter_0_menu a")).get(2).getText().trim(),episodeInitiatorNameInitCap_2);
	 }
	 
	 public void iVeriyAnchorFacilityCCN(){
			Assert.assertEquals(driver.findElements(By.cssSelector("#tableau_base_widget_LegacyCategoricalQuickFilter_1_menu a")).get(1).getText().trim(),facilityNameValidation+" "+"-"+" "+ccnValidation);
		 }
	 
	 public void iVeriyBundleNameInRowLevelSecurityForSelectedBPID(){
		 
		//div[@class='tileContainer']//a
		 List<String> value = new ArrayList<String>();
		 List<WebElement> element1 = driver.findElements(By.xpath("//div[@class='tileContainer']//a"));
		 for (int i =0;i<element1.size();i++){
			 value.add(element1.get(i).getText().trim());
			 System.out.println("For Loop Value for BundleName---"+element1.get(i).getText().trim());
		 }
		 /** comparing list values **/
		 Assert.assertTrue(bundle_Name.containsAll(value));
//		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_2_menu']//a[@title='"+bundleName1+"']")));
//		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_2_menu']//a[@title='"+bundleName2+"']")));
//		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_2_menu']//a[@title='"+bundleName3+"']")));
//		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_2_menu']//a[@title='"+bundleName4+"']")));
	 }
	 
	 public void iVeriyRemedyRegionMarketInRowLevelSecurityForSelectedBPID(){
//		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_4_menu']//a[@title='Remedy-"+region+" "+market+"']")));
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_4_menu']//a[@title='Remedy-"+region+"-"+market+"']")));
	 }
	 
	 public void iVeriyPartnerRegionMarketInRowLevelSecurityForSelectedBPID(){
		 if(regionPartner.contains("regionPartner_1")&&marketPartner.contains("marketPartner_1")){
			 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_3_menu']//a[@title='Null']")));
		 }
		 else{
			 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_3_menu']//a[@title='"+regionPartner+"-"+marketPartner+"']")));
		 }
	 }
	 public void iVeriyParticipantFilterForSelectedBPID(){
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[@title='(All)']")));
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='tileContainer']//a[@title='"+participantName+"']")));
	 }
	 
	 public void iVeriyDRGFractureFilterForSelectedBPID(){
		 List<String> value = new ArrayList<String>();
		 List<WebElement> element1 = driver.findElements(By.xpath("//div[@class='tileContainer']//a"));
		 for (int i =0;i<element1.size();i++){
			 value.add(element1.get(i).getText().trim());
			 System.out.println("For Loop Value---"+element1.get(i).getText().trim());
		 }
		 /** comparing list values **/
		 Assert.assertTrue(DRG_fracture.containsAll(value));
	 }
	 
	 public void iVeriyPhysicanNPIFilterForSelectedBPID(){
		 List<String> value = new ArrayList<String>();
		 List<WebElement> element1 = driver.findElements(By.xpath("//div[@class='tileContainer']//a"));
		 for (int i=0;i<element1.size();i++){
			 value.add(element1.get(i).getText().trim());
			 System.out.println("For Loop Value Physician NPI---"+element1.get(i).getText().trim());
		 }
		 /** comparing list values **/
		 Assert.assertTrue(Physician_NPI.containsAll(value));
	 }
	 
	 public void iVeriyModelFilterForSelectedBPID(){
		 List<String> value = new ArrayList<String>();
		 List<String> modelDBValue = new ArrayList<String>();
		 List<WebElement> element1 = driver.findElements(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_9_menu']//a"));
		 for (int i =1;i<element1.size();i++){
			 value.add(element1.get(i).getText().trim());
		 }
		 modelDBValue.add(model);
		 /** comparing list values **/
		 Assert.assertTrue(modelDBValue.containsAll(value));
	 }
	 
	 public void iVeriyAnchorFacilityDetailsFilterForSelectedBPID(){
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@id='tableau_base_widget_LegacyCategoricalQuickFilter_8_menu']//a[@title='Null']")));
	 }
	 
	 public void iClickRefreshDBData(){
		 try{
		 iWillWaitToSee(By.xpath("//span[text()='Refresh']"));
		 delay();
	//	 waitTo().until(ExpectedConditions.elementToBeClickable(By.xpath("//span[text()='Refresh']")));
		 scrollIntoViewByJS(driver.findElement(By.xpath("//span[text()='Refresh']")));
		 if(DriverScript.Config.getProperty("Browser").equals("ie")){
		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Refresh']"))); }else{
		 clickElement(driver.findElement(By.xpath("//span[text()='Refresh']")));}
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		 delay();
		 if(driver.findElements(By.xpath("//div[@id='tabZoneId225']")).size()>0) {
		 scrollIntoViewByJS(driver.findElement(By.xpath("//div[@id='tabZoneId225']")));
		 }
		 driver.switchTo().defaultContent();
		 scrollToTopOfThePage();}
		 catch(Exception e){
			 ProgramPerformance.rowFilters.put("ClickRefresh","Failed on ClickRefresh");
     	    ProgramPerformance.mapOfHmFiltersValue.put(ProgramPerformance.rowFilterIndex,ProgramPerformance.rowFilters);
			 throw e;
	     }
	 }
	 
	 public void readDataMetricsValueFromQuery(int index){
		 StringTokenizer st = new StringTokenizer(col.get(index), "*");
		 while(st.hasMoreTokens()){
			 String var[] =st.nextToken().trim().split("=");
			 outputText.put(var[0], var[1]);
		 }
		 System.out.println("Value of Output File Size:"+outputText.size());
	 }
	 
	 public void clearDataFromOutputFile(String path) throws FileNotFoundException {
		 PrintWriter wr = new PrintWriter(System.getProperty("user.dir")+path);
		 wr.print("");
		 wr.close();
	 }
	 
	 public void saveDataMetricValueWithdatabase(String text,String data, String resolution) throws IOException{
		 String xpath="//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas";
		 GetTextFromScreenShot(text, xpath, resolution);
/**		 
//		 -------
		 if(data.equalsIgnoreCase("EC")){
			 if(text.contains("Episode")){
//				 Assert.assertEquals(outputText.get("ECEpisodeCount").trim(), FinalOutput.replaceAll(",","").trim());
			 }else if(text.contains("Program_size")){
				 Assert.assertTrue(FinalOutput.isEmpty());
			 }else if(text.contains("NPRA")){
				 Assert.assertTrue(FinalOutput.isEmpty());
			 }else if(text.contains("Savings Rate")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().equals("SavingsRate"));
			 }else if(text.contains("SNF Disch Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("dischargetoSNFEC").trim()));
			 }else if(text.contains("SNF Days Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 if(!outputText.get("SNFDaysEC").trim().equals("${SNFDaysEC_1}")){
					 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("SNFDaysEC").trim()));
				 }else{
					 Assert.assertTrue(FinalOutput.isEmpty());
				 }
				
			 }else if(text.contains("Readmissions Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("EpisodesWithReadmissionEC").trim()));
			 }
			 
		 }else if (data.equalsIgnoreCase("Claims")){
			 if(text.contains("Episode")){
//				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
//				 Assert.assertEquals(outputText.get("claimsEpisodeCount").trim(), FinalOutput.replaceAll(",","").trim());
			 }else if(text.contains("Program_size")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertEquals(outputText.get("Claims_TotalProgram").trim(), FinalOutput.replace("$", "").replaceAll(",","").trim());
			 }else if(text.contains("NPRA")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertEquals(outputText.get("Claims_TotalNPRA").trim(), FinalOutput.replace("$", "").replaceAll(",","").trim());
			 }else if(text.contains("Savings Rate")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("savingRate")));
			 }else if(text.contains("SNF Disch Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("dischargetoSNFClaims").trim()));
			 }else if(text.contains("SNF Days Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("SNFDaysClaims").trim()));
			 }else if(text.contains("Readmissions Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("EpisodesWithReadmissionClaims").trim()));
			 }
		 }else{
			 
		 }
		 **/
	 }
	 
	 public void iSelectCheckboxValuesInFilter(String checkbox,String filter,String dashboard) throws FileNotFoundException{
		 if(!checkbox.contains("Skip")){
			 WebElement elem = driver.findElement(By.xpath("//input[contains(@name,'All')]"));
			 act.moveToElement(elem).click().build().perform();
			 List<WebElement> listItems = driver.findElements(By.cssSelector(".FIText"));
			 Random rand = new Random();
			 if(checkbox.contains("Random")){
			            int n=listItems.size();
			            int random_n=getRandomNumberInRange(1,n);
			            for (int i = 1; i < random_n; i++) {
			             int randomIndex = rand.nextInt(listItems.size());
			             WebElement randomElement = listItems.get(randomIndex);
			             String val=randomElement.getText();
			             for (int itr=0;itr<=val.length();itr++) {
								val=val.substring(val.indexOf("- ")+1).trim();
							}
			             driver.findElement(By.xpath("//a[contains(@title,'"+val+"')]/../input")).click();
			             val="'"+val+"'";
			             arrayListTexts.add(val);
			             listItems.remove(randomIndex);}
			          
			 }else if(checkbox.contains("All")){
				 for(int i =1;i<listItems.size();i++){
						String val=listItems.get(i).getText();
						for (int itr=0;itr<=val.length();itr++) {
							val=val.substring(val.indexOf("- ")+1).trim();
						}
						driver.findElement(By.xpath("//a[contains(@title,'"+val+"')]/../input")).click();
						val="'"+val+"'";
						arrayListTexts.add(val);
					}
			 }
			 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
	   		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
	   		 delay(); 
			 
		 }
		 else{
			 arrayListTexts.add("Skip");
		 }
		 writeDataToOutputFile("Path");
	 }
	 
	 public void iselectstaticvalues(){
		 String text = null;
		
		 String question1 ="('6005-160')|('030083', '030043', '030016', '030001', '030085', '030137', '030002', '030030', '030110', '030061', '030011', '030094', '030010', '030089')|('Simple pneumonia and respiratory infections', 'Medical peripheral vascular disorders')|(Skip)|(Skip)|(Skip)|(Skip)|('Sound Physicians')|('194', '177', '179', '299', '301', '300', '193', '178', '195')|('1952663627', '1902028871', '1285642108', '1124316856', '1285675439', '1306072905', '1932390432', '1154633626')|('2')|"; 
		 String[] question2=question1.split("\\|");
		 System.out.println("Question"+question2);
		 for(int i=0;i<question2.length;i++){
			 question2[i]= question2[i].replaceAll("\\(", "");
			 question2[i]= question2[i].replaceAll("\\)", "");
             String[] question3=question2[i].split(", ");
             try{
 				wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));}
 			 catch(Exception e){
 				 delay();
 			 } 
             if(i==0){
            	 text = "Episode Initiator - BPID";
             }else  if(i==1){
            	 text = "Anchor Facility - CCN";
             }else  if(i==2){
            	 text = "Bundle";
             }else  if(i==3){
            	 text = "Remedy Region Market";
             }else  if(i==4){
            	 text = "Partner Region Market";
             }else  if(i==5){
            	 text = "Participant";
             }else  if(i==6){
            	 text = "DRG";
             }else  if(i==7){
            	 text = "Physician - NPI";
             }else  if(i==8){
            	 text = "Model";
             }
             
             WebElement elem2 = driver.findElement(By.xpath("//span[text()='"+text+"']/../../../../.. //span[@role='combobox']"));
    		act.moveToElement(elem2).click().build().perform();
    		 try{
 				wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));}
 			 catch(Exception e){
 				 delay();
 			 }
 		 WebElement elem = driver.findElement(By.xpath("//input[contains(@name,'All')]"));
 		 JavascriptExecutor executor = (JavascriptExecutor)driver;
 		 executor.executeScript("arguments[0].click();", elem);
			 for(int j=0;j<question3.length;j++){
				String value=question3[j].replaceAll("'", "");
				JavascriptExecutor executor1 = (JavascriptExecutor)driver;
				executor1.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,'"+value+"')]/../input")));
			}
			 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
			 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
			 delay();
			 act.moveToElement(elem2).click().build().perform();
		 }
	 }
	 
	 public void iSelectCheckboxValuesInFilter1(String checkbox,String filter,String dashboard) throws FileNotFoundException{ 
		 try{
 			wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));}
		 catch(Exception e){
			 delay();
		 }
		 ArrayList<String> arrayListTextsA=new ArrayList<String>();
		 ArrayList<String> arrayListTextsB=new ArrayList<String>();
		 ArrayList<String> arrayListTextsC=new ArrayList<String>();
		 if(!checkbox.contains("Skip")){
			 delay();
			 WebElement elem = driver.findElement(By.xpath("//input[contains(@name,'All')]"));
			 JavascriptExecutor executor = (JavascriptExecutor)driver;
			 executor.executeScript("arguments[0].click();", elem);
			 List<WebElement> listItems = driver.findElements(By.cssSelector(".FIText"));
			 List<String> listItemsText= getTextForElementfromList(".FIText");
			 Random rand = new Random();
         if(checkbox.contains("Random")){
			            int n=listItems.size();
			            String valA = null;
						String valB= null;
			            int random_n=getRandomNumberInRange(1,n);
		                 for (int i = 1; i <= random_n; i++) {
    		             int randomIndex = rand.nextInt(listItems.size());
					     WebElement randomElement = listItems.get(randomIndex);
			          	 String val=randomElement.getAttribute("title");
			             String valarr[] = null;
			             String valarr1[] = null;
			             if(random_n==1 && val.equals("(All)")){
			            	 listItems.remove(randomIndex); 
			            	 n=listItems.size();
			            	if(n==1){
			            		  val=listItems.get(0).getText();
			            		 if(filter.equals("BPID") || filter.equals("Physician - NPI")){
			            			 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
			            			 if((val.equals("No Name - No NPI") && filter.equals("Physician - NPI") )|| (val.equals("Not Available") && filter.equals("BPID")) ){
			            				 val= "null";
			                             val = val.replaceAll("'","''"); 
			                             val="'"+val+"'";
			                       		  arrayListTexts.add(val);
			                       		writeDataToOutputFile("Path");
			                       		clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
			                   		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
			                   		 delay();
			                       		  return;
			            			 } else {
			            		 	  for (int itr=0;itr<=val.length();itr++) {
		                        	        val=val.substring(val.indexOf("- ")+1).trim();
		                        	       }
			            		 	 val = val.replaceAll("'","''");
		                       		  val="'"+val+"'";
		                       		  arrayListTexts.add(val);
		                       		  writeDataToOutputFile("Path");
		                       		clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
		                   		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		                   		 delay();
		                       		  return;
			            			 }
			            		 }
			            		 
			            		 else if(filter.equals("CCN")) {
//			            			 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,'"+val+"')]/../input")));
			            			 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
	                            	 valA=val.substring(0, val.lastIndexOf("-")).trim();
	                            	 valB=val.substring(val.lastIndexOf("-")+1).trim();
	                            	 for(int k=0;k<2;k++){
	    			            		 if(k==0){
	    			            			 valA = valA.replaceAll("'","''");
	    			            			 val="'"+valA+"'"; 
	    			            			 arrayListTextsA.add(val);
	    			            			 arrayListTexts.addAll(arrayListTextsA);
	    			            			 writeDataToOutputFile("Path");
	    			            			 continue;
	    			            			 
	    			            		 }else{
	    			            			 valB = valB.replaceAll("'","''");
	    			            			 val="'"+valB+"'"; 
	    			            			 arrayListTextsB.add(val);
	    			            			 arrayListTexts.addAll(arrayListTextsB);
	    			            			 
	    			            		 }writeDataToOutputFile("Path");}   
	    			            		 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
	    			            		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
	    			            		 delay();
	    			            		 return;
	                            	 
			            		 }
			            		 else if(filter.contains("Market") || filter.contains("Region")){
			            			 if(val.equals("Not Available")){
			            				 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
			            				 for(int l=0;l<2;l++){
		                        		  arrayListTexts.add("'null'"); 
		                        		  writeDataToOutputFile("Path");
		                        		  }
			            				 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
				                   		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
				                   		 delay();
				                   		 return;
			            		 }else {
			            			 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
			            			 val=val.substring(val.indexOf(" ")+1).trim(); 
	                            	 valarr=val.split("-");
	                            	 valA=valarr[0];
	                            	 valB=valarr[1];
	                            	 for(int k=0;k<valarr.length;k++){
	    			            		 if(k==0){
	    			            			 valA = valA.replaceAll("'","''");
	    			            			 val="'"+valA+"'"; 
	    			            			 arrayListTextsA.add(val);
	    			            			 arrayListTexts.addAll(arrayListTextsA);
	    			            			 writeDataToOutputFile("Path");
	    			            			 continue;
	    			            			 
	    			            		 }else{
	    			            			 valB = valB.replaceAll("'","''");
	    			            			 val="'"+valB+"'"; 
	    			            			 arrayListTextsB.add(val);
	    			            			 arrayListTexts.addAll(arrayListTextsB);
	    			            		 }   writeDataToOutputFile("Path");
	    			            		 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
	    			            		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
	    			            		 delay();
	    			            		 return;
	                            	 }
			            		 
			            		 
			            	 }
			            			 
			            			 
			            		 } else if(filter.contains("DRG")){
//			            			 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,'"+val+"')]/../input")));
			            			 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
		                     //   	 val=val.substring(val.length() - 4);
			            			 
			            			    valarr1=val.split("-");
				            			String val12=valarr1[0].trim();
				            			val="'"+val12+"'";
				            			arrayListTextsA.add(val12);
				            			
				            			String new1;

		     	            			if(valarr1[0].trim().contains("469") || valarr1[0].trim().contains("470")){
		            				    String val1=valarr1[1].trim();
		            				    if(val1.endsWith(")")){
		            					String val3=val1;
				            			String[] val4=val3.split("\\(");
				            			val3=val4[0].trim();
				            			val3="'"+val3+"'";
				            			arrayListTextsB.add(val3);
				            			new1=val1.substring(val1.indexOf("(")+1,val1.indexOf(")"));
				            			if(new1.equals("F")){
			            					new1=new1.replace("F", "1");
			            				}else if(new1.equals("NF")){
			            					new1=new1.replace("NF", "0");
			            				}else if(new1.equals("U")){
			            					new1=new1.replace("U", "-99");
			            				}
				            			new1="'"+new1+"'";
				            			arrayListTextsC.add(new1);
				            			arrayListTexts.addAll(arrayListTextsA);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsB);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsC);
				            			writeDataToOutputFile("Path");
				            	clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
		                   		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		                   		 delay();
		                       		 return;
				            		    }else{
		            					String val3=val1;
				            			String[] val4=val3.split("\\(");
				            			val3=val4[0].trim();
				            			val3="'"+val3+"'";
				            			arrayListTextsB.add(val3);	
				            			arrayListTextsC.add("'Null'");
				            			arrayListTexts.addAll(arrayListTextsA);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsB);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsC);
				            			writeDataToOutputFile("Path");
				            	        clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
		                   		        wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		                   		        delay();
		                       		    return;
				            			}}else{
		            					String val1=valarr1[1].trim();
		            					String val3=val1;
		            					val3="'"+val3+"'";
				            			arrayListTextsB.add(val3);
				            			arrayListTextsC.add("'Null'");
				            	    	arrayListTexts.addAll(arrayListTextsA);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsB);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsC);
				            			writeDataToOutputFile("Path");
				            	clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
		                   		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		                   		 delay();
		                       		 return;
		                         }}
			            		 
			            		 else{
			            			 val=val.trim();
//	                	    	     executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,'"+val+"')]/../input")));
	                	    	     executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
	                	    	     if(val.equals("Not Available")){
	                	    	    	 val="null"; 
	                	    	     }
	                	    	     val = val.replaceAll("'","''");
	                	    	     val="'"+val+"'";
									 arrayListTexts.add(val);
									 writeDataToOutputFile("Path");
									 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
									 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
									 delay();
									 return;
	                	       }
			            		 
			            	}
			            	 else{
			            	 random_n=getRandomNumberInRange(1,n);
			            	 i=0;
			            	 continue;
			            	 }
			            	 
			             }else if(random_n!=1 && val.equals("(All)")){
			             listItems.remove(randomIndex);
			             continue;
                      }
                      if(filter.equals("BPID") || filter.equals("Physician - NPI")){
                     	 if((val.equals("No Name - No NPI") && filter.equals("Physician - NPI") )|| (val.equals("Not Available") && filter.equals("BPID")) ){
                     		 executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
                     		 val= "null";
                          val = val.replaceAll("'","''"); 
                          val="'"+val+"'";
                    		  arrayListTexts.add(val);
                    		  listItems.remove(randomIndex);
                    		  continue;
                          }else{
                     	 for (int itr=0;itr<=val.length();itr++) {
                     	        val=val.substring(val.indexOf("- ")+1).trim();
                     	       }
                     	 }
                      }
                      else if(filter.contains("DRG")){
                    	  listItems.remove(randomIndex);
                    	  executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
                     	  valarr1=val.split("-");
	            			String val9=valarr1[0].trim();
	            			String val10="'"+val9+"'";
	            			arrayListTextsA.add(val10);
	                        String new1;

	     	            			if(val9.contains("469") || val9.contains("470")){
	            				String val1=valarr1[1].trim();
	            				if(val1.endsWith(")")){
	            					String val3=val1;
			            			String[] val4=val3.split("\\(");
			            			val3=val4[0].trim();
			            			val3="'"+val3+"'";
			            			arrayListTextsB.add(val3);
			            			new1=val1.substring(val1.indexOf("(")+1,val1.indexOf(")"));
			            			if(new1.equals("F")){
		            					new1=new1.replace("F", "1");
		            				}else if(new1.equals("NF")){
		            					new1=new1.replace("NF", "0");
		            				}else if(new1.equals("U")){
		            					new1=new1.replace("U", "-99");
		            				}
			            			new1="'"+new1+"'";
			            			arrayListTextsC.add(new1);
			            			if(i==random_n){
				            			arrayListTexts.addAll(arrayListTextsA);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsB);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsC);
				            			writeDataToOutputFile("Path");
				            			
				            			 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
				            			 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
				            			 delay();
				            			 return;
				            			}
			            		    continue;
	            				}else{
	            					String val3=val1;
			            			String[] val4=val3.split("\\(");
			            			val3=val4[0].trim();
			            			val3="'"+val3+"'";
			            			arrayListTextsB.add(val3);	
			            			arrayListTextsC.add("'Null'");
			            			if(i==random_n){
				            			arrayListTexts.addAll(arrayListTextsA);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsB);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsC);
				            			writeDataToOutputFile("Path");
				            			
				            			 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
				            			 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
				            			 delay();
				            			 return;
				            			}
			            			continue;
	            				}}else{
	            					String val1=valarr1[1].trim();
	            					String val3=val1;
	            					val3="'"+val3+"'";
			            			arrayListTextsB.add(val3);
			            			arrayListTextsC.add("'Null'");
			            			if(i==random_n){
			            			arrayListTexts.addAll(arrayListTextsA);
			            			writeDataToOutputFile("Path");
			            			arrayListTexts.addAll(arrayListTextsB);
			            			writeDataToOutputFile("Path");
			            			arrayListTexts.addAll(arrayListTextsC);
			            			writeDataToOutputFile("Path");
			            			
			            			 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
			            			 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
			            			 delay();
			            			 return;
			            			}
			            			continue;
									}
                     	
                      }
                      
                      else if(filter.equals("CCN")) {
                     	 valA=val.substring(0, val.lastIndexOf("-")).trim();
                     	 valB=val.substring(val.lastIndexOf("-")+1).trim();
                      }
                      
                       else if(filter.contains("Market") || filter.contains("Region")){
                    	   if(val.equals("Not Available")){
                               executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
                               val = "null";
                               val = val.replaceAll("'","''");
                               val="'"+val+"'";
                               arrayListTexts.add(val);
                               listItems.remove(randomIndex);
                               if((listItems.get(0).getText().equals("(All)") && listItems.size()==1)){
                              for(int k=0;k<2;k++){
                               if(k==0){
                               writeDataToOutputFile("Path");}else
                               {
                                arrayListTexts.add("'null'");
                                writeDataToOutputFile("Path");
                                     clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
                                  wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
                                  delay();
                                return;
                               }
                              }}
                              
                               if(listItems.isEmpty()){
                               for(int k=0;k<2;k++){
                                if(k==0){
                                writeDataToOutputFile("Path");}else
                                {
                                 arrayListTexts.add("'null'");
                                 writeDataToOutputFile("Path");
                                     clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
                                  wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
                                  delay();
                                 return;
                                }
                               }
                              }
                     		  else{
                     		  continue;}
                           }else{
                         	  val=val.substring(val.indexOf(" ")+1).trim(); 
                               valarr=val.split("-");
                         	  valA=valarr[0].trim();
                         	  valB=valarr[1].trim();
                           }
			             }
//                      executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,'"+val+"')]/../input")));
                      executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
			             if(filter.contains("Market") || filter.contains("Region")||filter.equals("CCN")){

			            	 if(!val.equals("Null") || !val.equals("Not Available")){
			            	 for(int k=0;k<2;k++){
			            		 if(k==0){
			            			 valA = valA.replaceAll("'","''");
			            			 val="'"+valA+"'"; 
			            			 arrayListTextsA.add(val);
			            		 }else{
			            			 valB = valB.replaceAll("'","''");
			            			 val="'"+valB+"'"; 
			            			 arrayListTextsB.add(val);
			            		 }
			            	 }}}else{
			            		 if(val.equals("Not Available")){
                	    	    	 val="null"; 
                	    	     }
			                 val=val.trim();
			                 val = val.replaceAll("'","''");
			            	 val="'"+val+"'";
				             arrayListTexts.add(val);
				             
			             }
			             listItems.remove(randomIndex);
			            }
			          
				 
			 }else if(checkbox.contains("All")){ 
		     delay();
			 executor.executeScript("arguments[0].click();", elem);
		     for(int i =1;i<listItems.size();i++){
		         String val=listItems.get(i).getText();
		         
		         if(filter.equals("BPID") || filter.equals("Physician - NPI")){
		        	 if((val.equals("No Name - No NPI") && filter.equals("Physician - NPI") )|| (val.equals("Not Available") && filter.equals("BPID")) ){
     				 val= "null";
		        	  val = val.replaceAll("'","''");
		                               val="'"+val+"'";
		                               arrayListTexts.add(val);
		                               continue;
		                                 }
		          for (int itr=0;itr<=val.length();itr++) {
		                            val=val.substring(val.indexOf("- ")+1).trim();
		                           }
		          val = val.replaceAll("'","''");                 
		          val="'"+val+"'";
		               arrayListTexts.add(val);}
		          else if(filter.contains("DRG")){
				      //  	executor.executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@title,\""+val+"\")]/../input")));
			        	 
	        		  String[] valarr1=val.split("-");
	        		  String val7=valarr1[0].trim();
	         			 val7="'"+val7+"'";
	         			arrayListTextsA.add(val7);
	         		    String new1;
	         		
	         		   
	         		  String[] valarr2=val.split("-");
	         		  if(valarr1[0].trim().contains("469") || valarr1[0].trim().contains("470")){
	         				
	         				String val1=valarr2[1].trim();
	         				if(val1.endsWith(")")){
	         					String val3=val1;
			            			String[] val4=val3.split("\\(");
			            			val3=val4[0].trim();
			            			val3="'"+val3+"'";
			            			arrayListTextsB.add(val3);
			            			new1=val1.substring(val1.indexOf("(")+1,val1.indexOf(")"));
			            			if(new1.equals("F")){
		            					new1=new1.replace("F", "1");
		            				}else if(new1.equals("NF")){
		            					new1=new1.replace("NF", "0");
		            				}else if(new1.equals("U")){
		            					new1=new1.replace("U", "-99");
		            				}
			            			new1="'"+new1+"'";
			            			arrayListTextsC.add(new1);
			            		    continue;
	         				}else{
	         					   String val3=val1;
			            			String[] val4=val3.split("\\(");
			            			val3=val4[0].trim();
			            			val3="'"+val3+"'";
			            			arrayListTextsB.add(val3);	
			            			arrayListTextsC.add("'Null'");
			            			continue;
	         				}}else{
	         					String val1=valarr2[1].trim();
	         					String val3=val1;
	         					val3="'"+val3+"'";
			            			arrayListTextsB.add(val3);
			            			arrayListTextsC.add("'Null'");
			            			
			            		    if(i==listItemsText.size()-1){
				            			arrayListTexts.addAll(arrayListTextsA);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsB);
				            			writeDataToOutputFile("Path");
				            			arrayListTexts.addAll(arrayListTextsC);
				            			writeDataToOutputFile("Path");
				            			clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
				            			wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
				            			delay();
						            	return;		
												}
				        		 
			            			
			            			}continue;}
		          else if (filter.equals("CCN")) {
                   String valA = null;
                   String valB= null;
                   valA=val.substring(0, val.lastIndexOf("-")).trim();
              	  valB=val.substring(val.lastIndexOf("-")+1).trim();
              	 for(int k=0;k<2;k++){
              		if(k==0){
                 	   valA = valA.replaceAll("'","''");
                 	   val="'"+valA+"'"; 
                        arrayListTextsA.add(val);
//                        arrayListTexts.addAll(arrayListTextsA);
              		}else{
                 	   valB = valB.replaceAll("'","''");
                        val="'"+valB+"'"; 
                        arrayListTextsB.add(val);
//                        arrayListTexts.addAll(arrayListTextsB);
                    }
                   }
		        	  
		          }
		         
		          else if (filter.contains("Market") || filter.contains("Region")){
		                            if(val.equals("Not Available")){
		                            	val = "null";
		                            	val=val.trim();
				                        val = val.replaceAll("'","''");
				                        val="'"+val+"'";
				                        arrayListTexts.add(val);
		                      }else{
		                      String valA = null;
		             String valB= null;
		             val=val.substring(val.indexOf(" ")+1).trim();
		                String[] valarr=val.split("-");
		                                   valA=valarr[0].trim();
		                                   valB=valarr[1].trim();
		                         for(int k=0;k<valarr.length;k++){
		                       if(k==0){
		                    	   valA = valA.replaceAll("'","''");
		                    	   val="'"+valA+"'"; 
		                        arrayListTextsA.add(val);
		                       }else{
		                    	   valB = valB.replaceAll("'","''");
		                        val="'"+valB+"'"; 
		                        arrayListTextsB.add(val);
		                       }
		                      }} 
		                           }
		                           else{
		                        	   if(val.equals("Not Available")){
		                	    	    	 val="null"; 
		                	    	     }
		                              val=val.trim();
		                              val = val.replaceAll("'","''");
		                              val="'"+val+"'";
		            arrayListTexts.add(val);
		                           }
		         
		        }}
			 
		 }
		 else{
			 if(filter.contains("Region") || filter.contains("Market")||filter.equals("CCN")){
				 for(int k=0;k<2;k++){
					 arrayListTexts.add("Skip");
					 writeDataToOutputFile("Path");
					}return;} else if(filter.contains("DRG")){
						 if(arrayListTextsA.size()==1 && arrayListTextsA.contains("Null")){
							 for(int i=0;i<3;i++){
							 arrayListTexts.add("Null");
							 writeDataToOutputFile("Path"); }
							 return;
						 }else{
						 for(int k=0;k<3;k++){
							 if(k==0){
								 arrayListTexts.add("Skip");
								 writeDataToOutputFile("Path"); }else if(k==1){
									 arrayListTexts.add("Skip");
									 writeDataToOutputFile("Path"); }else{
									 arrayListTexts.add("Skip");
								 writeDataToOutputFile("Path"); 
								 return;
							 }
						 }}
					 }else{
			 arrayListTexts.add("Skip");
			 writeDataToOutputFile("Path");
			 return;
					 }
			 
			
		 }
		 
		 
		 
		 if(filter.contains("Market") || filter.contains("Region") || filter.equals("CCN")){
			 if(arrayListTextsA.size()==1 && arrayListTextsA.contains("null")){
				 for(int i=0;i<2;i++){
				 arrayListTexts.add("null");
				 writeDataToOutputFile("Path"); }
				 return;
			 }else{
			 for(int k=0;k<2;k++){
				 if(k==0){
					 arrayListTexts.addAll(arrayListTextsA);
					 writeDataToOutputFile("Path"); }else{
						 arrayListTexts.addAll(arrayListTextsB);
					 writeDataToOutputFile("Path"); 
				 }
			 }}
		 }else{
		 writeDataToOutputFile("Path");		
		 }
		 
		 clickElement(driver.findElement(By.xpath("//span[text()='Apply']")));
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		 delay();
	 }
	 
	 public void iOpenTheInputFile(String path,String row) throws FileNotFoundException{
		 try{
			 rowFilterIndex=row;
		 if(row.equals("1")){
			 arrayListTexts.clear();
			 writer=new PrintWriter(System.getProperty("user.dir")+path);
			 arrayListTexts.add("1");
			 writeDataToOutputFile("Path");
			 col.clear();
		 }else{
			 arrayListTexts.clear();
			 writer.print(System.lineSeparator());
			 arrayListTexts.add("0");
			 writeDataToOutputFile("Path");
		 }
		 imageOutput=new HashMap<String,String>();
		 rowFilters=new HashMap<String,String>();}
		 catch(Exception e){
			 rowFilters.put("OpenOutputFile","Failed on Opening Output File");
			 mapOfHmFiltersValue.put(rowFilterIndex,rowFilters);
		 }
	 }
	 
	 public void iOpenTheLogFile(String path,String row) throws FileNotFoundException{
		 try{
		 if(row.equals("1")){
			 writerLog=new PrintWriter(System.getProperty("user.dir")+path);
			 writeDataToLogFile("1"+" Row");
		 }else{
			 writerLog.print(System.lineSeparator());
			 writeDataToLogFile(row+" Row");
		 }}catch(Exception e){
			 rowFilters.put("OpenOutputFileLogs","Failed on Opening Output File log");
			 mapOfHmFiltersValue.put(rowFilterIndex,rowFilters);
		 }
	 }
	 
	 
	 public void writeDataToOutputFile(String path) throws FileNotFoundException {
		 if(!path.equals("Date_Range")) {
		 writer.print("("+arrayListTexts.toString().replace("]", "").replace("[", "").trim()+")|");
		 }else {
			 writer.print(arrayListTexts.toString().replace("]", "").replace("[", "").trim()+"|");
		 }
//		 System.out.println("Values in arrayList Before Clear"+arrayListTexts.toString());
//		 arrayListTexts.clear();
//		 System.out.println("Values in arrayList After Clear"+arrayListTexts.toString());
	 }
	 
	 public void writeDataToLogFile(String frontEndFilterValues) throws FileNotFoundException {
		 if(frontEndFilterValues.contains("Row")) {
			 writerLog.print(frontEndFilterValues+"-->");
		 }else {
			 writerLog.print("*"+frontEndFilterValues);
		 }
	 }
	 
	 public void iVerifyDBandFEForMetrics(String text,String row,String data){
		 if(!text.contains("Variance")){
//		 if (data.equalsIgnoreCase("Claims")){
			 System.out.println("Main Hash Map value::: "+mapOfHmImageOuput.toString());
			 System.out.println("Hash Map"+row+" value::: "+mapOfHmImageOuput.get(row).toString());
				 System.out.println("Value Fetched="+mapOfHmImageOuput.get(row).get(text)+"Asserted With ==="+outputText.get(text+"_"+data));
//				 Assert.assertEquals(outputText.get(text+"_"+data).trim(),mapOfHmImageOuput.get(row).get(text));
				 if(!outputText.get(text+"_"+data).contains(data+"_1")){
					 if(text.contains("% SNF Disch Current")){
					 System.out.println("Actual"+mapOfHmImageOuput.get(row).get(text).trim());
					 System.out.println("Expected"+outputText.get(text+"_"+data));}
					
					 if(mapOfHmImageOuput.get(row).get(text).trim().contains("Performance")){
						 mapOfHmImageOuput.get(row).get(text).replaceAll("Performance", ""); 
					 }
					 String expected=mapOfHmImageOuput.get(row).get(text).trim().toString();
					 if(expected.contains("l")){
						 expected=expected.replace("l", "1");
					 }
					 if(expected.equals("DaysPerformance")){
						 expected=expected.replaceAll("DaysPerformance", "").trim(); 
						 System.out.println("Remvoe string after DaysPerformance"+expected);
					 }
					 if(expected.equals("%Performance")){
						 expected=expected.replaceAll("%Performance", "").trim(); 
						 System.out.println("Remvoe string after %Performance"+expected);
					 }
					 String actual=outputText.get(text+"_"+data).trim().toString();
					 if(actual.contains("l")){
						 actual=actual.replace("l", "1");
					 }
					 try{
						 Assert.assertTrue(expected.contains(actual));
					 }catch(Exception e){
//						 actual=actual.substring(0,actual.indexOf('.'));
//						 expected=expected.substring(0,expected.indexOf('.'));
//						 Assert.assertTrue(expected.substring(0,expected.indexOf('.')).contains(actual));
					 }
				     
				   
				 }
				 else{
					 //Asserted Empty value
					 try{
						 //Asserted Not Available 
						 Assert.assertTrue(mapOfHmImageOuput.get(row).get(text).trim().contains("N/A"));
					 } catch (Exception e){
					 Assert.assertTrue(mapOfHmImageOuput.get(row).get(text).trim().isEmpty());}
				 }
				 }
//		 }
		 else{
			 if(outputText.get(text+"_"+data).contains(data+"_1")){
				 try{
					 //Asserted Not Available 
					 Assert.assertTrue(mapOfHmImageOuput.get(row).get(text).trim().contains("Not Available"));
				 } catch (Exception e){
					 //Asserted Null 
					 Assert.assertTrue(mapOfHmImageOuput.get(row).get(text).trim().equals("null"));
				 }
			 }
			 else{
				 Assert.assertTrue(mapOfHmImageOuput.get(row).get(text).trim().contains(outputText.get(text+"_"+data)));
			 }
		 }
		 }
	 
	 public void iCloseTheInputFile(){
		 writer.close();
		 writerLog.close();
	 }
	 
	 public void iSaveAllOutputImagesInIndexInHashMap(String index){
		 mapOfHmImageOuput.put(index, imageOutput);
	 }
	 
	 public static int getRandomNumberInRange(int min, int max) {
		 if (min >= max) { 
			 throw new IllegalArgumentException("max must be greater than min");
		  	}
		  Random r = new Random();
		  return r.nextInt((max - min) + 1) + min;
	 }
	 
	 public void iPerformTestWithUserInAnalytics(String user) throws FileNotFoundException{
		 try{
		 arrayListTexts.add("'"+user+"'");
		 writeDataToOutputFile("Path");}
		 catch(Exception e){
			 ProgramPerformance.rowFilters.put("TestUser","Perform TestUser");
	     	    ProgramPerformance.mapOfHmFiltersValue.put(ProgramPerformance.rowFilterIndex,ProgramPerformance.rowFilters);
		 }
	 }
	 
	 public void iSaveAllRowFiltersInIndexInHashMap(String index){
		 mapOfHmFiltersValue.put(index,rowFilters);
		 System.out.println(mapOfHmFiltersValue.toString());
	 }
	 
	 public void iFetchStoreValuesOnDashboard(String filter,String dashboard) throws FileNotFoundException{
	     List<WebElement> listItems = driver.findElements(By.cssSelector(".FIText"));
		 List<String> values = new ArrayList<String>();
		 System.out.println("Size="+listItems);
		 for(int i =1;i<listItems.size();i++){
			String val=listItems.get(i).getAttribute("title").trim();
//			System.out.println("VAlue  "+val+"===Item "+listItems.get(i).getAttribute("title"));
			if(val.equals("Null")) {
				val=val.replace("Null", "null");
			}
			values.add(val);
			
		  }
		 System.out.println("Filter Values to string"+values.toString());
		 rowFilters.put(filter, values.toString());
		 System.out.println("Hashmap row filter values "+rowFilters.toString());
		 writeDataToLogFile(filter+"="+values.toString());
	 }
	 
	 public void igetDateForDataFetchedForDashboard(String range) throws FileNotFoundException{
		 String dateFetched = driver.findElement(By.xpath("//span[@dojoattachpoint='domPreview']")).getAttribute("textContent").trim();
		 getDateFForDB(dateFetched, "StartDate");
		 getDateFForDB(dateFetched, "EndDate");
		 arrayListTexts.add(range);
		writeDataToOutputFile("Date_Range");
	 }
	 
	 public void getDateFForDB(String dat,String range) throws FileNotFoundException{
		 String dateFE[] = dat.split("to");
		 System.out.println("Date;;"+dateFE[0]+"==="+dateFE[1]);
		 String dateToBreak =null; 
		 if (range.equals("StartDate")){
			 dateToBreak=dateFE[0].trim();
		 }else if(range.equals("EndDate")){
			 dateToBreak=dateFE[1].trim();
		 }
			String monthFE= dateToBreak.substring(0, dateToBreak.indexOf("/"));
			if(monthFE.length()==1){
				monthFE="0"+monthFE;
			}
			dateToBreak = dateToBreak.substring(dateToBreak.indexOf("/")+1);
			String dayFE= dateToBreak.substring(0, dateToBreak.indexOf("/"));
			if(dayFE.length()==1){
				dayFE="0"+dayFE;
			}
			dateToBreak = dateToBreak.substring(dateToBreak.indexOf("/")+1);
			String yearFE = dateToBreak;
			String dbDate= yearFE+monthFE+dayFE;
			arrayListTexts.add("'"+dbDate+"'");
			writeDataToOutputFile("Path");
	 }

	 public void set_time_in_time_field(String action) {
			if(action.contains("year")){
				System.out.println("Page html is-------"+driver.findElement(By.xpath("//div[@role='presentation' and contains(@id,'popup') and contains(@class,'dijitPopup') and contains(@style,'visibility: visible')]")).getAttribute("innerHTML")+"-------------");
				iWillWaitToSee(By.xpath("//span[text()='Years' and contains(@class,'dijitReset dijitInline dijitButtonText')]"));
				clickElement(driver.findElement(By.xpath("//span[text()='Years' and contains(@class,'dijitReset dijitInline dijitButtonText')]")));
				delay();
				iWillWaitToSee(By.xpath("//*[@id='svg-spinner-container']"));
				wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
				delay();
				if(action.contains("previous")){
				clickElement(driver.findElement(By.xpath("//span[text()='Previous year' and contains(@dojoattachpoint,'textLast')]")));
				iWillWaitToSee(By.xpath("//*[@id='svg-spinner-container']"));
				wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
				delay();}
	          }else if(action.contains("month") || action.contains("months")){
	        	  longDelay();
	        	  if(action.contains("last")){
                    longDelay();
	        		System.out.println(driver.findElement(By.xpath("//input[@dojoattachpoint='inputLastn']")).getAttribute("value"));
	        	    while(!driver.findElement(By.xpath("//input[@dojoattachpoint='inputLastn']")).getAttribute("value").equals("3")){
	        	    ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='spinnerElement spinnerDown' and @dojoattachpoint='lastDown']")));
	        	    driver.findElement(By.xpath("//input[@dojoattachpoint='inputLastn']")).sendKeys(Keys.ENTER);
	        		delay();
	        	    iWillWaitToSee(By.xpath("//*[@id='svg-spinner-container']"));
	  				wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
	        	    longDelay();
	        		System.out.println(driver.findElement(By.xpath("//input[@dojoattachpoint='inputLastn']")).getAttribute("value"));
	        		}
	        	
	  			}
			}
			
		}

	public void verifyfiltervalues(String text, String row, String data) {
		System.out.println("Assertion for "+row+"::"+text);
		ArrayList<String> al_DB = new ArrayList<String>();
		ArrayList<String> al_FE = new ArrayList<String>();
		al_DB.add(outputText.get(text).replace("\"[", "").replace("]\"", "").replaceAll("\"", "").trim());
		al_FE.add(mapOfHmFiltersValue.get(row).get(text).replace("[", "").replace("]", "").trim());
		System.out.println("DB Value="+outputText.get(text).replace("\"[", "").replace("]\"", "").replaceAll("\"", "").trim());
		System.out.println("FE Value="+mapOfHmFiltersValue.get(row).get(text).trim().replace("[", "").replace("]", ""));
		
		Assert.assertTrue(al_DB.equals(al_FE));
	}

	public void readFilterValueFromQuery(int index) throws IOException, InterruptedException {
		outputText.clear();
		int indexIncrement = index+1;
		System.out.println("Col value: "+col.toString());
//		System.out.println("FE HashMap:"+mapOfHmFiltersValue.get(indexIncrement).toString());
		StringTokenizer st = new StringTokenizer(col.get(index), "*");
		 while(st.hasMoreTokens()){
			 String var[] =st.nextToken().trim().split("=");
			 outputText.put(var[0], var[1]);
		 }
		 System.out.println("^^^^^^^^^^"+outputText.toString());
		}
	
	public void iGetAndFillDaysInTimeFilter(String startDay, String endDay) throws FileNotFoundException {
		CalcuateTimeFilterDay(startDay, endDay);
	}
	
	public void CalcuateTimeFilterDay(String startDay, String endDay) throws FileNotFoundException {
		 String startDate = DriverScript.Config.getProperty(startDay);
		 SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		 String days = null;
		 Date date = new Date(); 
		   String presentDate =formatter.format(date);
		   if(endDay.equalsIgnoreCase("today")) {
		 try {
			 	Date dateBefore = formatter.parse(startDate);
			 	Date dateAfter = formatter.parse(presentDate);
		        long difference = (dateAfter.getTime() - dateBefore.getTime())/86400000;
		        days = String.valueOf(++difference);
		        System.out.println("Number of Days between dates: "+difference);
		 } catch (Exception e) {
		       e.printStackTrace();
		 }
		   }
		   iFillDaysInTimeFilter(days);
	}

	public void iFillDaysInTimeFilter(String days) throws FileNotFoundException {
//		longDelay();
		 driver.findElement(By.xpath("//input[@dojoattachpoint='inputLastn']")).clear();
		 delay();
		 driver.findElement(By.xpath("//input[@dojoattachpoint='inputLastn']")).sendKeys(days);
//		 String dateFetched = driver.findElement(By.xpath("//span[@dojoattachpoint='domPreview']")).getAttribute("textContent").trim();
		 arrayListTexts.add(days);
		writeDataToOutputFile("Date_Range");
		wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
	    
	 }
	
	public void ClickOnTillTipLinkOnPerformnaceOverviewDashboard(String link,String text) {
		WebElement elem = null;
		 elem=driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas"));
		 act.click(elem).build().perform();
		 delay();
		 elem=driver.findElement(By.cssSelector(".tab-link-button.tab-widget.tab-action"));
//		 act.moveToElement(driver.findElement(By.cssSelector(".tab-tooltip.tab-widget.tab-tooltipBR"))).click(elem).build().perform();
		 JavascriptExecutor executor = (JavascriptExecutor)driver;
		 executor.executeScript("$('.tab-link-button.tab-widget.tab-action').trigger('click');");
//		 executor.executeScript("arguments[0].click();", elem);
		 wait.until(ExpectedConditions.refreshed(
			        ExpectedConditions.elementToBeClickable(By.cssSelector(".tab-link-button.tab-widget.tab-action"))));
		 System.out.println(isElementPresent(By.xpath("//a[@href='#']")));
		 act.moveToElement(driver.findElement(By.xpath("//a[@href='#']"))).click().build().perform();
//		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[@href='#']")));
//		 driver.findElement(By.xpath("//a[@href='#']")).click();
		 
		 /**elem=driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas"));
		 act.moveToElement(elem).click(elem).build().perform();
		 longDelay();
		 
		 elem=driver.findElement(By.cssSelector(".tab-link-button.tab-widget.tab-action"));
		 wait.until(ExpectedConditions.refreshed(
			        ExpectedConditions.elementToBeClickable(By.cssSelector(".tab-link-button.tab-widget.tab-action"))));
		 System.out.println(driver.findElement(By.cssSelector(".tab-tooltip.tab-widget.tab-tooltipBR")).toString());
		 act.moveToElement(driver.findElement(By.cssSelector(".tab-tooltip.tab-widget.tab-tooltipBR"))).build().perform();
		 **/
		 act.moveToElement(driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas"))).click(driver.findElement(By.linkText("Click here to go to Next Site of Care Dashboard"))).build().perform();
		 longDelay();
		 act.moveToElement(driver.findElement(By.linkText("Click here to go to Next Site of Care Dashboard"))).perform();
		 act.click().perform();
//		 act.moveToElement(driver.findElement(By.cssSelector(".tab-tooltipContainer"))).build().perform();
//		 act.moveToElement(driver.findElement(By.cssSelector(".tab-tooltipConten"))).build().perform();
//		 act.moveToElement(driver.findElement(By.cssSelector(".tab-ubertipActions"))).build().perform();
		 act.moveToElement(driver.findElement(By.cssSelector(".tab-tooltip.tab-widget.tab-tooltipBR .tab-link-button.tab-widget.tab-action"))).click().build().perform();
		 
		 elem.click();
		 longDelay();
		 WebElement elem1=driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas"));
		 act.moveToElement(elem1);
		 longDelay();
		 act.click(elem).build().perform();
		 
//		 act.moveToElement(elem).click(elem).build().perform();
//		 wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector(".tab-link-button.tab-widget.tab-action")));
//		 System.out.println(driver.findElement(By.cssSelector(".tab-link-button.tab-widget.tab-action")).getAttribute("href"));
//		 driver.findElement(By.cssSelector(".tab-link-button.tab-widget.tab-action")).click();
//		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector(".tab-link-button.tab-widget.tab-action")));
		 //		 act.moveToElement(driver.findElement(By.cssSelector(".tab-link-button.tab-widget.tab-action"))).click().build().perform();
		 delay();
		 
//		 act.moveToElement(driver.findElement(By.cssSelector("body > div.tab-tooltip.tab-widget.tab-tooltipBR > div.tab-tooltipContainer > div > div > div.tab-ubertipContent > div.tab-ubertipActions > ul"))).click().build().perform();
//		 act.click().build();
//		 act.perform();
//		 act.clickAndHold().moveToElement(elem);
//		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", elem);
		 longDelay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		 if(driver.findElements(By.xpath("//div[@class='tab-ubertipTooltip']/span")).size()>0){
			 isElementPresent(By.xpath("//div[@class='tab-ubertipContent']//div[@class='tab-ubertipActions']"));
//			 elem = driver.findElement(By.xpath("//div[@class='tab-ubertipContent']"));
//			 System.out.println(elem.getText());
//			 driver.findElement(By.linkText("Click here to go to Next Site of Care Dashboard")).click();
			 driver.findElement(By.cssSelector("body > div.tab-tooltip.tab-widget.tab-tooltipBR > div.tab-tooltipContainer > div > div > div.tab-ubertipContent > div.tab-ubertipActions > ul")).click();
			 System.out.println(elem.getText());
			 elem = driver.findElement(By.cssSelector("body > div.tab-tooltip.tab-widget.tab-tooltipBR > div.tab-tooltipContainer > div > div > div.tab-ubertipContent > div.tab-ubertipActions > ul"));					
//		        act.moveToElement(elem).build().perform(); 
			 act.moveToElement(elem).build().perform();
			 act.click(elem).build().perform();
//			 act.click(elem);
//			 elem.click();
//			 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", elem);
		 }
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//*[@id='svg-spinner-container']")));
		
	}
	
	public void IGetRegionMarketWithoutParticipant() throws FileNotFoundException{
		//Region - Market
		iClickOnFilterName("Region - Market", "value");
		List<WebElement> listItems = driver.findElements(By.cssSelector(".FIText"));
		 List<String> values = new ArrayList<String>();
		 System.out.println("Size="+listItems);
		 for(int i =1;i<listItems.size();i++){
			String val=listItems.get(i).getText().trim();
//			if(val.equals("Null")) {
//				val=val.replace("Null", "null");
//			}
			values.add(val);
		  }
			 RegionMarketArrayList=values;
			 iClickOnFilterName("Region - Market", "value");
			 
			 //Participant
			 iClickOnFilterName("Participant", "value");
			 listItems = driver.findElements(By.cssSelector(".FIText"));
			 values = new ArrayList<String>();
			 System.out.println("Size="+listItems);
			 for(int i =1;i<listItems.size();i++){
				String val=listItems.get(i).getText().trim();
//				if(val.equals("Null")) {
//					val=val.replace("Null", "null");
//				}
				values.add(val);
			  }
			 iClickOnFilterName("Participant", "value");
			 //Extracting "Region" and "Market" removing Participant
			 ArrayList<String> arrayListTextsA=new ArrayList<String>();
			 ArrayList<String> arrayListTextsB=new ArrayList<String>();
			 String[] valarr;
			 String valA = null;
			 String valB = null;
			 for(int i =0; i<RegionMarketArrayList.size();i++) {
				 String tempVar=RegionMarketArrayList.get(i).trim();
					if(tempVar.equals("Not Available")) {
					tempVar=tempVar.replace("Not Available", "null");
					tempVar = "'"+tempVar+"'";
					arrayListTextsA.add(tempVar);
					arrayListTextsB.add(tempVar);
				}else if (!tempVar.equals("Not Available")) {
				valarr=tempVar.split(" - ");
				valA=valarr[0].trim();
				valB=valarr[1].trim();
				for(int j=0;j<values.size();j++) {
					valA=valA.replace(values.get(j), "");
					valA=valA.trim();
				}
				valA = valA.replaceAll("'","''");
				tempVar="'"+valA+"'"; 
			 	arrayListTextsA.add(tempVar);
			    valB = valB.replaceAll("'","''");
			    tempVar="'"+valB+"'"; 
		 		arrayListTextsB.add(tempVar);
				}
			 }
			 if (arrayListTextsA.isEmpty()) {
				 arrayListTextsA.add("Skip");
			}
			 if (arrayListTextsB.isEmpty()) {
				 arrayListTextsB.add("Skip");
			}
			 arrayListTexts.addAll(arrayListTextsA);
			 System.out.println("Value of A="+arrayListTexts);
			 writeDataToOutputFile("Path");
			 arrayListTexts.addAll(arrayListTextsB);
			 System.out.println("Value of B="+arrayListTexts);
			 writeDataToOutputFile("Path");
			 RegionMarketArrayList.clear();
			 
	}	
}
