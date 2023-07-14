package com.camera.rental.app;
import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Scanner;
class Camera{
	String brand;
	String model;
	float pricePerDay;
	String id;
	String status;
	
	// camera constructor
	public Camera(String brand, String model, float pricePerDay,int numberOfCameras) {
		this.brand = brand;
		this.model = model;
		this.pricePerDay = pricePerDay;
		this.id=""+numberOfCameras;
		this.status="Available";
	}
	public String toString() {
		return "    "+id+"\t\t"+brand+"\t\t"+model+"\t\t"+pricePerDay+"\t\t"+status;
		
	}
	
	//setting status rented / available
	public void setStatus(String status) {
		this.status=status;
		
	}
}
public class CameraRentalApplication {
	static ArrayList<Camera> cameras=new ArrayList<>();
	static int numberOfCameras;//for icrmentiong cammera ID's
	static Scanner scan=new Scanner(System.in);
	static float walletBalance=2000f;
	
	
	public static void main(String[] args) {
		System.out.println("+--------------------------------------+\n| WELCOME TO CAMERA RENTAL APPLICATION |\n+--------------------------------------+");
		System.out.println("PLEASE LOGIN TO CONTINUE -");
		System.out.print("USERNAME - ");
		String u_name=scan.next();
		System.out.print("PASSWORD - ");
		String u_pass=scan.next();
		
		// checking login details
		//successful login
		if(u_name.equalsIgnoreCase("admin") && u_pass.equals("admin123")) {

			cameras.add(new Camera("Samsung","DS123",500,1));
			numberOfCameras++;
			cameras.add(new Camera("Sony","HD214",500,2));
			numberOfCameras++;
			cameras.add(new Camera("Canon","XLR",500,3));
			numberOfCameras++;
			cameras.add(new Camera("Fujitsu","J5",500,4));
			numberOfCameras++;
			cameras.add(new Camera("LG","L123",500,5));
			numberOfCameras++;
			

			//displaying menu of options
			displayMenus();
			//unsuccessful login
		}
		else {
			System.out.println("LOGIN FAILED !");
		}
		
	}

	private static void displayMenus() {
		boolean flag=true;
		while(flag) {
			System.out.println("1. MY CAMERA");
			System.out.println("2. RENT A CAMERA");
			System.out.println("3. VIEW ALL CAMERAS");
			System.out.println("4. MY WALLET");
			System.out.println("5. EXIT");
			String choice=scan.next();
			switch(choice) {
			case "1":
				displaySecondMenu();
				break;
			case "2":
				if(displayAvailableCameraDetails()>0) {
					rentCamera();
					
				}
				break;
			case "3":
				displayCameraDetails();
				break;
				
			case "4":
				walletDetails();
				break;
			
			case "5":
				flag=false;
				System.out.println("THANK YOU , VISIT AGAIN !");
				break;
			default:
				System.out.println("INVALID CHOICE !");
			}
		}
	}


	private static void displaySecondMenu() {
		
		boolean flag=true;
		while(flag) {
			System.out.println("1. ADD");
			System.out.println("2. REMOVE");
			System.out.println("3. VIEW MY CAMERAS");
			System.out.println("4. GO TO PREVIOUS MENU");
			String choice=scan.next();
			switch(choice) {
			case "1":
				addCamera();
				break;
				
			case "2":
				displayCameraDetails();
				removeCamera();
				break;

			case "3":
				displayRentedCameraDetails();
				break;
				
			case "4":
				flag=false;
				break;
				
			default:
				System.out.println("INVALID CHOICE !");
			}
		}
		
	}
	
	private static void rentCamera() {
		if(cameras.size()==0) {
			return;
		}
		System.out.print("ENTER CAMERA ID YOU WANT TO RENT - ");
		String id=scan.next();
		for(int i=0;i<cameras.size();i++) {
			if(cameras.get(i).status.equalsIgnoreCase("available") && cameras.get(i).id.equals(id)) {
				if(walletBalance-cameras.get(i).pricePerDay>=0) {
					cameras.get(i).setStatus("Rented");
					System.out.println("YOUR TRANSACTION FOR CAMERA - "+cameras.get(i).brand+" "+cameras.get(i).model+" WITH RENT INR."+cameras.get(i).pricePerDay+" HAS SUCCESSFULLY COMPLETED.");
					walletBalance-=cameras.get(i).pricePerDay;
				}
				else {
					System.out.println("ERROR : TRANSACTION FAILED DUE TO INSUFFICIENT WALLET BALANCE. PLEASE DEPOSIT THE AMOUNT TO YOUR WALLET.");
				}
				return;
			}
		}
		System.out.print("ENTER A VALID CAMERA ID TO RENT.\nARE YOU WANT TO CONTINUE TO RENT ANOTHER CAMERA? (PRESS 1) - ");
		if(scan.next().equals("1")) {
			rentCamera();
		}
		
	}
	
	private static int displayAvailableCameraDetails() {

		int count=0;

		System.out.println("\nFOLLOWING IS THE LIST OF AVAILABLE CAMERA(S)");
		System.out.println("==========================================================================================");
		System.out.println("CAMERA ID    \tBRAND\t\tMODEL\t    PRICE(PER DAY)    \tSTATUS");
		System.out.println("==========================================================================================");
		for(int i=0;i<cameras.size();i++) {
			if(cameras.get(i).status.equalsIgnoreCase("available")) {
				System.out.println(cameras.get(i).toString());
				count++;
			}
		}
		if(count==0) {
			System.out.println("THERE IS NO CAMERA(S) AVAILABLE FOR RENT.");
		}
		
		System.out.println("==========================================================================================");
		return count;
	}

	private static void walletDetails() {
		System.out.println("YOUR CURRENT WALLET BALANCE IS - INR."+walletBalance);
		System.out.print("DO YOU WANT TO DEPOSIT MORE AMOUNT TO YOUR WALLET? (1.YES 2.NO) - ");
		String ans=scan.next();
		float amount=0;
		if(ans.equals("1")) {
				System.out.print("ENTER THE AMOUNT (INR) - ");
				//handling input exception of non-numeric values
				try {
				amount=scan.nextFloat();
				}
				catch(Exception e) {
					System.out.println(e+" invalid input");
					return;
				}
				try {
				walletBalance+=Math.abs(amount);
				}
				catch(Exception e) {
					System.out.println(e);
				}
				System.out.println("YOUR WALLET BALANCE UPDATED SUCCESSFULLY. CURRENT WALLET BALANCE - INR."+walletBalance);
				
			
			
		}
		else if(ans.equals("2")) {
			return;
		}
		else {
			System.out.println("YOU HAVA SELECTED AN INVALID OPTION");
		}
		
	}

	private static void displayRentedCameraDetails() {
		int count=0;
		System.out.println("==========================================================================================");
		System.out.println("CAMERA ID    \tBRAND\t\tMODEL\t    PRICE(PER DAY)    \tSTATUS");
		System.out.println("==========================================================================================");
		for(int i=0;i<cameras.size();i++) {
			if((cameras.get(i).status).equalsIgnoreCase("rented")) {
				System.out.println(cameras.get(i).toString());
				count++;
			}
		}
		if(count==0) {
			System.out.println("THERE IS NO RENTED CAMERA(S).");
		}
		System.out.println("==========================================================================================");
		
	}

	private static void removeCamera() {
		System.out.print("ENTER THE CAMERA ID TO REMOVE - ");
		String camId=scan.next();
		for(int i=0;i<cameras.size();i++) {
			if(cameras.get(i).id.equals(camId)) {
				cameras.remove(i);
				System.out.println("CAMERA SUCCESSFULLY REMOVED FROM THE LIST.");
				return;
			}
		}
		System.out.println("REMOVAL FAILED\nTHERE NO CAMERA WITH ID - "+camId+" PRESENT IN THE LIST");
		
	}

	private static void displayCameraDetails() {
		System.out.println("==========================================================================================");
		System.out.println("CAMERA ID    \tBRAND\t\tMODEL\t    PRICE(PER DAY)    \tSTATUS");
		System.out.println("==========================================================================================");
		for(int i=0;i<cameras.size();i++) {
			System.out.println(cameras.get(i).toString());
		}
		if(cameras.size()==0) {
			System.out.println("THERE IS NO DATA AT THIS MOMENT");
		}
		System.out.println("==========================================================================================");
		
	}

	private static void addCamera() {
		System.out.print("ENTER THE CAMERA BRAND - ");
		String brand=scan.next();
		System.out.print("ENTER THE MODEL - ");
		String model=scan.next();
		System.out.print("ENTER THE PER DAY PRICE (INR) - ");
		float price=0;
		boolean flag=true;
		//handling input exception of non-numeric values
		try {
			price=scan.nextFloat();
		}
		catch(Exception e) {
			System.out.println(e);
			flag=false;
		}
		if(flag) {
			numberOfCameras++;
			cameras.add(new Camera(brand,model,price,numberOfCameras));
			System.out.println("YOUR CAMERA HAS BEEN SUCCESSFULLY ADDED TO THE LIST.");
		}
		else {
			System.out.println("DUE TO INVALID PRICE , CAMERA IS NOT ADDED.");
		}
		
	}

}
