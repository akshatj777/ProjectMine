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
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;


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
	String StartDate = null;
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
		 Runtime.getRuntime().exec("cmd /c start cmd.exe /K \"cd "+DriverScript.Config.getProperty("jmeterPath")+" && jmeter -n -t"+" "+jmx+" && exit\"");
	    Thread.sleep(20000);
	    }
	 
	 public void iClickOnDashboard(String dashboard){
		 iWillWaitToSee(By.cssSelector(".report-title"));
		 selectElementByDesc(".report-title", dashboard);
		 longDelay();
		 iWillWaitToSee(By.cssSelector(".component-report-header"));
		 longDelay();
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
		 Thread.sleep(18000);
		 BufferedReader br=new BufferedReader(new FileReader(System.getProperty("user.dir")+location));
				 String names;
				 System.out.println(br.lines());
//				 ArrayList<String> elements = new ArrayList<String>();
				 while ((names = br.readLine())!= null) {           
					 delay();
				     col.add(names);
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
			 point = point.moveBy(00, -40);
//			 point = point.moveBy(325, 104);
//			 point = point.moveBy(80, 20);
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
				 FinalOutput=output.replaceAll("\\s+", "");
				 System.out.println(FinalOutput);
//				 if(text.equals("EC Episodes"))
//				 {
//				 Assert.assertEquals(numberformat(ECEpiosdeCount), FinalOutput.trim());
//				 }else if(text.equals("Claims Episodes")){
//					 Assert.assertEquals(numberformat(claimsEpiosdeCount), FinalOutput.trim()); 
//				 }else if(text.equals("Program Size")){;
//					 Assert.assertTrue(FinalOutput.trim().contains(numberformat(TotalProgram)));
//				 }else if(text.equals("NPRA")){
//					 Assert.assertTrue(FinalOutput.trim().contains(numberformat(TotalNPRA)));
//				 }else if(text.equals("%Discharge to SNF Claims")){
//					 Double a= ((float)(((int)Math.pow(10,1)*DischargeToSNF))/Math.pow(10,1));
//					 Assert.assertTrue(FinalOutput.trim().contains(a.toString()));
//				 }else if(text.equals("SNF Days Claims")){
//					 Double a= ((float)(((int)Math.pow(10,1)*SNFDaysClaims))/Math.pow(10,1));
//					 Assert.assertTrue(FinalOutput.trim().contains(a.toString()));
//				 }else if(text.equals("SNF Days EC")){
//					 Double a= ((float)(((int)Math.pow(10,1)*SNFDaysEC))/Math.pow(10,1));
//					 Assert.assertTrue(FinalOutput.trim().contains(a.toString()));
//				 }else if(text.equals("%Episodes with a Readmission Claims")){
//					 Assert.assertTrue(FinalOutput.trim().contains(EpisodesWithReadmissionEC.toString()));
//				 }else if(text.equals("%Discharge to SNF EC")){
//					 Double a= ((float)(((int)Math.pow(10,1)*DischargeToSNFEC))/Math.pow(10,1));
//					 Assert.assertTrue(FinalOutput.trim().contains(a.toString()));
//				 }else if(text.equals("%Episodes with a Readmission EC")){
//					 Assert.assertTrue(FinalOutput.trim().contains(EpisodesWithReadmissionEC.toString()));
//				 }
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
		 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), StartDate);
		 driver.findElements(By.xpath("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas")).get(1).click();
		 delay();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 delay();
		 iWillWaitToSee(By.cssSelector(".tabCanvas.tab-widget"));
		 longDelay();
		 delay();
	 }
	 
	 public void iSetDateInDateFieldAttribute(String field, String value){
		 longDelay();
		 if(field.equals("Start Date")){
			 if(value.contains("ClaimsCubeDate")){
				 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), StartDate);
			 }else {
				 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domLowerText']")));
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), value);
			 }
		 }else if (field.equals("End Date")){
			 if(value.contains("ClaimsCubeDate")){
				 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), StartDate);
			 }else if(value.contains("Today")){
				 clickElement(driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
				 clickElement(driver.findElement(By.xpath("//span[@class='tab-datepicker-today-date']")));
				 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
			 }else{
				 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@dojoattachpoint='domUpperText']")));
				 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domUpperInput']")), value);
				 }
		 }
		 longDelay();
		 WebElement elem = driver.findElement(By.xpath("//span[text()='Bundle']/../../../../.. //span[@role='combobox']"));
		 act.moveToElement(elem).click().build().perform();
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@style='transition: opacity 250ms; opacity: 1;']")));
		 longDelay();
		 act.moveToElement(elem).click().build().perform();
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
		 iFillInText(driver.findElement(By.xpath("//input[@dojoattachpoint='domLowerInput']")), StartDate);
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
	 
	 public void iClickOnFilterName(String text){
//		 clickElement(driver.findElement(By.xpath("//span[text()='"+text+"']/../../../../.. //span[@role='combobox']")));
//		 delay();
		 WebElement elem = driver.findElement(By.xpath("//span[contains(text(),'"+text+"')]/../../../../.. //span[@role='combobox']"));
		 act.moveToElement(elem).click().build().perform();
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
	 
	 public void iValidateBenchmarkToolTipText(String text,String data){
		 WebElement elem = null;
		 elem=driver.findElement(By.xpath("//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas"));
		 act.moveToElement(elem).click().build().perform();
		 longDelay();
		 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
		 System.out.println(gettext);
		 if(text.contains("SNF Disch Benchmark Variance")){
			 Assert.assertTrue(gettext.trim().contains(outputText.get("dischtoSNFBenchmark"+data)));
		 }else if (text.contains("SNF Days Benchmark Variance")){
			 Assert.assertTrue(gettext.trim().contains(outputText.get("SNFDaysBenchmark"+data)));
		 }else if(text.contains("Readmissions Benchmark Variance")){
			 Assert.assertTrue(gettext.trim().contains(outputText.get("EpisodesWithReadmissionBenchmark"+data)));
		 }else{
			 Assert.assertTrue(gettext.trim().contains(text.toString()));
		 }
		 
		 
//		 WebElement elem = null;
//		 if(text.contains("Readmission benchmark")){
//			 WebElement graphele = driver.findElement(By.xpath("//div[@tb-test-id='Readmissions Trend']//div[@class='tab-tvBottomAxis tvimagesNS']/div/canvas"));
//			 act.moveToElement(graphele).click().build().perform();
//			 longDelay();
//			 elem=driver.findElement(By.xpath("//div[@tb-test-id='Readmissions Benchmark Variance']//div[@class='tvimagesContainer']/canvas"));
//		 }
//		 else if(text.contains("Discharge to snf benchmark")){
//			 elem=driver.findElement(By.xpath("//div[@tb-test-id='% SNF Disch Benchmark Variance']//div[@class='tvimagesContainer']/canvas"));
//		 }
//		 else if(text.contains("SNF Days benchmark")){
//			 longDelay();
//			 elem=driver.findElement(By.xpath("//div[@tb-test-id='SNF Days Benchmark Variance']//div[@class='tvimagesContainer']/canvas"));
//		 }
//		 act.moveToElement(elem).click().build().perform();
//		 longDelay();
//		 String gettext=driver.findElement(By.xpath("//div[@class='tab-ubertipTooltip']/span")).getText();
//		 System.out.println(gettext);
		 
//		 if (text.contains("Discharge to snf benchmark Claims")){
//			 Double a= ((float)(((int)Math.pow(10,1)*dischargetoSNFBenchmarkClaims))/Math.pow(10,1));
//			 Assert.assertTrue(gettext.trim().contains(a.toString()));
//		 }else if (text.contains("Discharge to snf benchmark EC")){
//			 Assert.assertTrue(gettext.trim().contains(dischargetoSNFBenchmarkEC.toString()));
//		 }else if (text.contains("Episodes with a Readmission benchmark Claims")){
//			 Assert.assertTrue(gettext.trim().contains(EpisodesWithReadmissionBenchmarkClaims.toString()));
//		 }else if (text.contains("Episodes with a Readmission benchmark EC")){
//			 Assert.assertTrue(gettext.trim().contains(EpisodesWithReadmissionBenchmarkEC.toString()));
//		 }else if (text.contains("SNF Days benchmark EC")){
//			 Assert.assertTrue(gettext.trim().contains(SNFDaysBenchmarkEC.toString()));
//		 }else if (text.contains("SNF Days benchmark Claims")){
//			 Assert.assertTrue(gettext.trim().contains(SNFDaysBenchmarkClaims.toString()));
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
		 clickElement(driver.findElement(By.xpath("//span[text()='Refresh']")));
		 wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@class='wcGlassPane' and contains(@style,'cursor: wait;')]")));
		 delay();
		 driver.switchTo().defaultContent();
		 scrollToTopOfThePage();
	 }
	 
	 public void readDataMetricsValueFromQuery(int index){
		 System.out.println(col.get(index));
		 System.out.println(col.size());
		 StringTokenizer st = new StringTokenizer(col.get(index), "*");
		 while(st.hasMoreTokens()){
			 String var[] =st.nextToken().trim().split("=");
			 outputText.put(var[0], var[1]);
		 }
		 System.out.println("Value of Output File Size:"+outputText.size());
		 StartDate=outputText.get("StartDate");
	 }
	 
	 public void clearDataFromOutputFile(String path) throws FileNotFoundException {
		 PrintWriter writer = new PrintWriter(System.getProperty("user.dir")+path);
		 writer.print("");
		 writer.close();
	 }
	 
	 public void verifyDataMetricValueWithdatabase(String text,String data, String resolution) throws IOException{
		 String xpath="//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas";
		 GetTextFromScreenShot(text, xpath, resolution);
		 if(data.equalsIgnoreCase("EC")){
			 if(text.contains("Episode")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertEquals(outputText.get("ECEpisodeCount").trim(), FinalOutput.trim());
			 }else if(text.contains("Program_size")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.isEmpty());
			 }else if(text.contains("NPRA")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
//				 Assert.assertNu
				 Assert.assertTrue(FinalOutput.isEmpty());
			 }else if(text.contains("Savings Rate")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
//				 Assert.assertTrue(FinalOutput.trim().equals("SavingsRate"));
			 }else if(text.contains("SNF Disch Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("dischargetoSNFEC").trim()));
			 }else if(text.contains("SNF Days Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 if(!outputText.get("SNFDaysEC").trim().equals("${SNFDaysEC_1}")){
					 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("SNFDaysEC").trim()));
				 }else{
					 
				 }
				
			 }else if(text.contains("Readmissions Current")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().contains(outputText.get("EpisodesWithReadmissionEC").trim()));
			 }
			 
		 }else if (data.equalsIgnoreCase("Claims")){
			 if(text.contains("Episode")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertEquals(outputText.get("claimsEpisodeCount").trim(), FinalOutput.trim());
			 }else if(text.contains("Program_size")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertEquals(outputText.get("Claims_TotalProgram").trim(), FinalOutput.trim());
			 }else if(text.contains("NPRA")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertEquals(outputText.get("Claims_TotalNPRA").trim(), FinalOutput.trim());
			 }else if(text.contains("Savings Rate")){
				 System.out.println(data+"=="+text+"=="+FinalOutput.trim());
				 Assert.assertTrue(FinalOutput.trim().equals("Saving Rate"));
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
	 }
	 
}
