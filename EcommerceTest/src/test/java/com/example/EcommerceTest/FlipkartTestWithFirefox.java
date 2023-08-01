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
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import io.github.bonigarcia.wdm.WebDriverManager;

public class FlipkartTestWithFirefox {
	
	WebDriver wd;
	
	@BeforeTest
	public void initialize() {
		WebDriverManager.firefoxdriver().setup();
		wd=new FirefoxDriver();
		wd.manage().window().maximize();
		wd.get("https://www.flipkart.com");
	}
	
	@Test(priority=1)
  	public void searchAndPageLoadTest() throws InterruptedException {
		try {
			wd.findElement(By.xpath("/html/body/div[2]/div/div/button"));
		}
		catch(Exception e) {
			
		}

		wd.manage().timeouts().pageLoadTimeout(5000,TimeUnit.MILLISECONDS);
		Thread.sleep(2000);
		wd.findElement(By.name("q")).sendKeys("iphone");
		wd.manage().timeouts().implicitlyWait(1000, TimeUnit.MILLISECONDS);
		wd.findElement(By.name("q")).submit();
		wd.manage().timeouts().implicitlyWait(3000, TimeUnit.MILLISECONDS);
		String actual=wd.findElement(By.xpath("//*[@id=\"container\"]/div/div[3]/div[1]/div[2]/div[1]/div/div/span/span")).getText();
		assertEquals(actual,"iphone");
		Thread.sleep(2000);
		
	}
	
	@Test(priority=2)
	public void scrollFeatureTest() throws InterruptedException {
		JavascriptExecutor je=(JavascriptExecutor)wd;
		boolean hasScroll=(boolean)je.executeScript("return document.body.scrollHeight > window.innerHeight");
		assertTrue(hasScroll);
		Thread.sleep(2000);
		
	}
	
	@Test(priority=3)
	public void downloadImageAtParticularScrollPosition() throws InterruptedException, IOException {
		JavascriptExecutor je=(JavascriptExecutor)wd;
		je.executeScript("window.scrollBy(0,3000)");
		//take the screenshot and store it as a file format
		File file=((TakesScreenshot)wd).getScreenshotAs(OutputType.FILE);
		assertNotNull(file);
		//now copy the screen shot to the specified location 
		FileUtils.copyFile(file,new File("E:\\image.png"));
		Thread.sleep(2000);

	}
	
	@Test(priority=4)
	public void scrollToTheEnd() throws InterruptedException {
		JavascriptExecutor je=(JavascriptExecutor)wd;
		je.executeScript("window.scrollBy(0,document.body.scrollHeight)");
		long scrollPosition=(long) je.executeScript("return document.body.scrollHeight");
		assertTrue(scrollPosition>0);
		Thread.sleep(2000);
		
	}
	
	
	
	
	@AfterTest
	public void closeDriver() {
		wd.close();
	}
}
