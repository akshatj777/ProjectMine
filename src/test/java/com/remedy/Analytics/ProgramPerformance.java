package com.remedy.Analytics;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.bytedeco.javacpp.BytePointer;
import org.bytedeco.javacpp.lept;
import org.bytedeco.javacpp.lept.PIX;
import org.bytedeco.javacpp.tesseract.TessBaseAPI;
import org.imgscalr.Scalr;
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
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class ProgramPerformance extends BaseClass{
	
	int ECEpiosdeCount,claimsEpiosdeCount,TotalNPRA,TotalProgram;
    Double savingRate;
	WebDriverWait wait = new WebDriverWait(driver, 300);

	public ProgramPerformance(WebDriver driver) {
		super(driver);
	}
	
	public void iWaitTillTheVisibilityOfFieldOLoginPage(String text){
		iWillWaitToSee(By.xpath("//input[@title='"+text+"']"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//input[@title='"+text+"']")));
	}
	
	public void iEnterInFieldsForAnalyticsOnLoginPage(String field,String value){
		iWillWaitToSee(By.xpath("//input[@title='"+field+"']"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//input[@title='"+field+"']")));
		iFillInText(driver.findElement(By.xpath("//input[@title='"+field+"']")), value);
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
		delay();
        swithToFrame(frameXpath);
        delay();
    }
	
	public void iValidateTextWhenIncorrectCredentialsEntered(String text,String message){
		isElementVisible(driver.findElement(By.xpath("//div[text()='"+text+"']")));
		isElementVisible(driver.findElement(By.xpath("//div[text()='"+message+"']")));
	}
	
	public void iValidateTextForDashboard(String text){
		iWillWaitToSee(By.cssSelector(".tabCanvas.tab-widget"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".tabCanvas.tab-widget")));
		isElementVisible(driver.findElement(By.xpath("//div[@id='dashboard-viewport']//span[text()='"+text+"']")));
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
	
	 public void greyscale()throws IOException{
		    BufferedImage img = null;
		    File f = null;

		    //read image
		    try{
		      f = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Blue.png");
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
				greyscale();	
				
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
	 
	 public void executejmeter(String location) throws IOException
	    {
		 File jmx=new File(System.getProperty("user.dir")+location);
//		 String jmeter=DriverScript.Config.getProperty("jmeterPath");
//	     Runtime.getRuntime().exec("cmd /c start cmd.exe /K \"cd C:\\apache-jmeter-4.0\\apache-jmeter-4.0\\bin && jmeter -n -t C:\\Users\\aseem.gupta\\Tableautestpaln\\Tableautestpaln\\TableauTest.jmx && exit\"");
		 Runtime.getRuntime().exec("cmd /c start cmd.exe /K \"cd "+DriverScript.Config.getProperty("jmeterPath")+" "+jmx+" && exit\"");
	    }
	 
	 public void iClickOnDashboard(String dashboard){
		 wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".ui.image.report-image")));
		 iWillWaitToSee(By.cssSelector(".report-title"));
		 selectElementByDesc(".report-title", dashboard);
	 }
	 
	 public void setAttributevalue(WebElement element, String attName, String attValue) {
		  JavascriptExecutor js = (JavascriptExecutor) driver;
		  js.executeScript("arguments[0].setAttribute(arguments[1], arguments[2]);", 
		                element, attName, attValue);
     }
	 
	 public void iSetCalendarAttributeValue(String date){
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
	 
	 public void iReadTextFromOutputfile(String location) throws IOException{
		 BufferedReader br=new BufferedReader(new FileReader(System.getProperty("user.dir")+location));
		 String names;
		 while ((names = br.readLine())!= null) {           

			 StringTokenizer st = new StringTokenizer(names, ",");     
			 List<String> elements = new ArrayList<String>();
		     while (st.hasMoreTokens()){
		      elements.add(st.nextToken());
		     } 
		      String ECCount=elements.get(0).trim();
		      String ec[]=ECCount.split("=");
		      ECEpiosdeCount=Integer.parseInt(ec[1]);
		      numberformat(ECEpiosdeCount);
		      System.out.println("The Episode Count value is"+ECEpiosdeCount);
		      String claimsCount=elements.get(1).trim();
		      String claims[]=claimsCount.split("=");
		      claimsEpiosdeCount=Integer.parseInt(claims[1]);
		      numberformat(claimsEpiosdeCount);
		      System.out.println("The Claims count value is"+claimsEpiosdeCount);
		      String sRate=elements.get(2).trim();
		      String saving[]=sRate.split("=");
		      Double sav=Double.parseDouble(saving[1]);
		      savingRate=sav;
		      System.out.println("The savings rate value is"+savingRate);
		      String TNPRA=elements.get(3).trim();
		      String npra[]=TNPRA.split("=");
		      TotalNPRA=Integer.parseInt(npra[1]);
		      numberformat(TotalNPRA);
		      System.out.println("The total npra value is"+TotalNPRA);
		      String TProgram=elements.get(4).trim();
		      String program[]=TProgram.split("=");
		      TotalProgram=Integer.parseInt(program[1]);
		      numberformat(TotalProgram);
		      System.out.println("The total program value is"+TotalProgram);
		      delay();
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
		 longDelay();
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
				File screenshotLocation = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
				if(screenshotLocation.exists())
				{
					screenshotLocation.delete();
				}
				FileUtils.copyFile(screenshot, screenshotLocation);
				TessBaseAPI instance=new TessBaseAPI();
				 instance.Init(System.getProperty("user.dir")+"\\src\\test\\Imports\\TestData\\tessdata", "eng");
				 PIX image=lept.pixRead(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image2.png");
				 instance.SetImage(image);
				 BytePointer bytePointer=instance.GetUTF8Text();
				 String output=bytePointer.getString();
				 System.out.println("Text in image is"+output);
				 String FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
				 if(text.equals("EC Episodes"))
				 {
				 Assert.assertEquals(numberformat(ECEpiosdeCount), FinalOutput.trim());
				 }else if(text.equals("Claims Episodes")){
					 Assert.assertEquals(numberformat(claimsEpiosdeCount), FinalOutput.trim()); 
				 }
	 }
	 
	 public void iSetStartAndEndDateForClaimsData(String start,String end){
		 longDelay();
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
		 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), start);
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
		 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), end);
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
		 iWillWaitToSee(By.cssSelector(".tabCanvas.tab-widget"));
		 longDelay();
		 delay();
	 }
	 
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
				greyscale();	
				
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
//				 Assert.assertEquals(a,FinalOutput.trim().contains(a.toString()));
				 }
	 }
}
