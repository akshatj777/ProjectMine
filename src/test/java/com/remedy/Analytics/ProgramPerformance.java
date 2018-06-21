package com.remedy.Analytics;

import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

import javax.imageio.ImageIO;

import org.bytedeco.javacpp.tesseract.TessBaseAPI;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Point;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.internal.WrapsDriver;
import org.openqa.selenium.support.Color;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.sikuli.script.Screen;
import org.sikuli.script.TextRecognizer;

import com.asprise.ocr.Ocr;

import ru.yandex.qatools.ashot.AShot;
import ru.yandex.qatools.ashot.Screenshot;

import com.remedy.baseClass.BaseClass;

public class ProgramPerformance extends BaseClass{
	
	private static String IMAGE_TYPE = "png";
	
	WebDriverWait wait = new WebDriverWait(driver, 180);

	public ProgramPerformance(WebDriver driver) {
		super(driver);
	}
	
	public void iWaitTillTheVisibilityOfFieldOLoginPage(String text){
		iWillWaitToSee(By.xpath("//input[@title='"+text+"']"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//input[@title='"+text+"']")));
	}
	
	public void iEnterInFieldsForAnalyticsOnLoginPage(String field,String value){
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
		clickElement(driver.findElement(By.xpath("//a[text()='"+text+"']")));
	}
	
	public void iWaitToSeeTheWorkbooksOnWorkbooksPage(){
		iWillWaitToSee(By.cssSelector(".tb-thumbnail-overlay"));
	}
	
	public void iClickOnDashboardWithNameOnWorkBook(String dashboard){
		selectElementByTextDescByXpath("//a[div[text()='View']/preceding-sibling::div]/../following-sibling::div/a", dashboard);
	}
	
	public void iWaitTillInvisibiltyOfLoaderAfterClickingDashboard(){
		iWillWaitToSee(By.cssSelector(".tabCanvas.tab-widget"));
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".tabCanvas.tab-widget")));
	}
	
	public void iSwitchToAnalyticsFrameWithXpath(String frameXpath){
        swithToFrame(frameXpath);
        delay();
    }
	
	public void iValidateTextWhenIncorrectCredentialsEntered(String text,String message){
		isElementVisible(driver.findElement(By.xpath("//div[text()='"+text+"']")));
		isElementVisible(driver.findElement(By.xpath("//div[text()='"+message+"']")));
	}
	
	public void iValidateTextForDashboard(String text){
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
	
	public void Screenshot1() throws Exception{
		Screenshot screen=new AShot().takeScreenshot(driver, driver.findElement(By.xpath("//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']/canvas")));
		File fl = new File(System.getProperty("user.dir")+"\\src\\test\\Imports\\Image1.png");
		ImageIO.write(screen.getImage(), "PNG", fl);
		testBarcodeNumber();
//		getImageAsString();
//		ITesseract tsc = new Tesseract();
//		String a = tsc.doOCR(fl);
//		Screen s=new Screen();
//		s.capture();
//		String inputFile=("user.dir")+"\\src\\test\\Imports\\Image1.png";
		//Tesseract tesseract=new Tesseract();
////		String importDir = System.getProperty("user.dir");
		//String newDir = "user.dir" + "\\" + "src" + "\\" + "test" + "\\" + "Imports" + "\\" + "TestData";
		//tesseract.setDatapath(newDir);
		//String fullText=tesseract.doOCR(fl);
		//System.out.println(fullText);
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
    }
	
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

	public static String getImageAsString()
	{
		
		String dataContents = null;
		try
		{
			File file = new File(System.getProperty(("user.dir"))+"\\src\\test\\Imports\\Image1.png");
			byte[] fileData = new byte[ (int)file.length()];
			InputStream inStream = new FileInputStream( file );
			inStream.read(fileData);
			inStream.close();
			String tempFileData = new String(fileData);
//			String finalData = tempFileData.substring(tempFileData
//					.indexOf(extraStr)
//					+ extraStr.length(), tempFileData.length());
			byte[] temp = new sun.misc.BASE64Decoder().decodeBuffer(tempFileData);
			dataContents = new String(temp);
		}
		catch( Exception e )
		{
			e.printStackTrace();
		}
		return dataContents;	
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
	}
	
	 public void testBarcodeNumber() throws Exception {
	        // get and capture the picture of the img element used to display the barcode image
//	        WebElement barcodeImage = driver.findElement(By.xpath("//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']"));
//	        File imageFile = captureElementPicture(barcodeImage);
	 
	        // get the Tesseract direct interace
		 File imageFile = new File(System.getProperty(("user.dir"))+"\\src\\test\\Imports\\Image1.png");
	        Tesseract instance = new Tesseract();
	 
	        // the doOCR method of Tesseract will retrive the text
	        // from image captured by Selenium
	        String result = instance.doOCR(imageFile);
	 
	        // check the the result
//	        assertEquals("Application number did not match", "123-45678", result.trim());
	        System.out.println(result);
	    }
	 
	 public static File captureElementPicture(WebElement element)
	            throws Exception {
	 
	        // get the WrapsDriver of the WebElement
	        WrapsDriver wrapsDriver = (WrapsDriver) element;
	 
	        // get the entire screenshot from the driver of passed WebElement
	        File screen = ((TakesScreenshot) wrapsDriver.getWrappedDriver())
	                .getScreenshotAs(OutputType.FILE);
	 
	        // create an instance of buffered image from captured screenshot
	        BufferedImage img = ImageIO.read(screen);
	 
	        // get the width and height of the WebElement using getSize()
	        int width = element.getSize().getWidth();
	        int height = element.getSize().getHeight();
	 
	        // create a rectangle using width and height
	        Rectangle rect = new Rectangle(width, height);
	 
	        // get the location of WebElement in a Point.
	        // this will provide X & Y co-ordinates of the WebElement
	        Point p = element.getLocation();
	 
	        // create image  for element using its location and size.
	        // this will give image data specific to the WebElement
	        BufferedImage dest = img.getSubimage(p.getX(), p.getY(), rect.width,
	                rect.height);
	 
	        // write back the image data for element in File object
	        ImageIO.write(dest, "png", screen);
	 
	        // return the File object containing image data
	        return screen;
	    }
}
