package com.example.EcommerceTest;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.testng.Assert.assertEquals;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import io.github.bonigarcia.wdm.WebDriverManager;

public class FlipkartTestWithChrome {
	
	
	//declaration of web driver
	WebDriver wd;
	
	@BeforeTest
	public void initialize() {
		//setting up chrome driver
		WebDriverManager.chromedriver().setup();
		//initializing web driver
		wd=new ChromeDriver();
		//maximizing the screen
		wd.manage().window().maximize();
		//locating the URL using web driver
		wd.get("https://www.flipkart.com");
	}
	
	@Test(priority=1)
  	public void searchAndPageLoadTest() throws InterruptedException {
		try {
			wd.findElement(By.xpath("/html/body/div[2]/div/div/button"));
		}
		catch(Exception e) {
			
		}
		//setting a page load out time
		wd.manage().timeouts().pageLoadTimeout(5000,TimeUnit.MILLISECONDS);
		Thread.sleep(2000);
		//searching iphone in search bar
		wd.findElement(By.name("q")).sendKeys("iphone");
		//setting maximum loading time of the page
		wd.manage().timeouts().implicitlyWait(1000, TimeUnit.MILLISECONDS);
		wd.findElement(By.name("q")).submit();
		wd.manage().timeouts().implicitlyWait(3000, TimeUnit.MILLISECONDS);
		//checking whether search is successful
		String actual=wd.findElement(By.xpath("//*[@id=\"container\"]/div/div[3]/div[1]/div[2]/div[1]/div/div/span/span")).getText();
		assertEquals(actual,"iphone");
		Thread.sleep(2000);
		
	}
	
	@Test(priority=2)
	public void scrollFeatureTest() throws InterruptedException {
		JavascriptExecutor je=(JavascriptExecutor)wd;
		//checking height of the web page with the height of screen/window 
		boolean hasScroll=(boolean)je.executeScript("return document.body.scrollHeight > window.innerHeight");
		assertTrue(hasScroll);
		Thread.sleep(2000);
		
	}
	
	@Test(priority=3)
	public void downloadImageAtParticularScrollPosition() throws InterruptedException, IOException {
		JavascriptExecutor je=(JavascriptExecutor)wd;
		//scrolling to specific height of web page
		je.executeScript("window.scrollBy(0,3000)");
		//take the screenshot and store it as a file format
		File file=((TakesScreenshot)wd).getScreenshotAs(OutputType.FILE);
		//checking whether screenshot is succeeded
		assertNotNull(file);
		//now copy the screen shot to the specified location 
		if(file!=null) {
			FileUtils.copyFile(file,new File("E:\\image.png"));
		}
		Thread.sleep(2000);

	}
	
	@Test(priority=4)
	public void scrollToTheEnd() throws InterruptedException {
		JavascriptExecutor je=(JavascriptExecutor)wd;
		//scrolling to end of web page
		je.executeScript("window.scrollBy(0,document.body.scrollHeight)");
		long scrollPosition=(long) je.executeScript("return document.body.scrollHeight");
		//checking whether scroll happens
		assertTrue(scrollPosition>0);
		Thread.sleep(2000);
		
	}
	
	
	
	
	@AfterTest
	public void closeDriver() {
		wd.close();
	}
}
