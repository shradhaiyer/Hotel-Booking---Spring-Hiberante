package com.xoriant.client;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xoriant.beans.Address;
import com.xoriant.beans.Booking;
import com.xoriant.beans.Guest;
import com.xoriant.beans.Hotel;
import com.xoriant.beans.Userlogin;
import com.xoriant.dao.GuestDaoImpl;



@Controller
@ComponentScan(basePackages = "com.xoriant.beans")
public class Client {	
	
	@RequestMapping("")
	public ModelAndView HomePage() {
		ModelAndView modelAndView= new ModelAndView("HomePage");
		return modelAndView;
	}
	
	@RequestMapping(value="/GuestForm",method=RequestMethod.GET)
	public ModelAndView getGuestForm() {
		ModelAndView modelAndView = new ModelAndView("GuestDetailsPage");
		return modelAndView;
	}
	
	@RequestMapping(value="/UserLogin",method=RequestMethod.GET)
	public ModelAndView getLoginForm() {
		ModelAndView modelAndView = new ModelAndView("UserLogin");
		return modelAndView;
	}
	
	@RequestMapping(value="/user",method=RequestMethod.POST)
	public ModelAndView getUserLoginDetails(@RequestParam("userId") String email,@RequestParam("password") String password){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		List<Hotel> hotelList= guestDao.getAllHotels();

		boolean isUSer = guestDao.authenticateUser(email, password);
		List<Guest> guests = guestDao.getAllGuests();
		Integer id =null;
		for(Guest g : guests) {
			if(g.getEmail().equals(email)) {
				id=g.getGuestId();
			}
		}
		System.out.println(id);
			
		if(isUSer) {
			ModelAndView modelAndView = new ModelAndView("Hotels");
			modelAndView.addObject("msg","Hotel List");
			modelAndView.addObject("hotelList", hotelList);
			modelAndView.addObject("id", id);
			modelAndView.addObject("email",email);
			return modelAndView;
		}
		else {
			ModelAndView modelAndView = new ModelAndView("IncorrectCredentials");
			return modelAndView;
		}
	}
	
	@RequestMapping(value="/guest",method=RequestMethod.POST)
	public ModelAndView getUserDetails(@RequestParam("guestName") String guestName,@RequestParam("email") String email,@RequestParam("contactNumber") String contactNumber,
			@RequestParam("gender") String gender,@RequestParam("password") String password){
		
		 ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		 GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		
		Guest guest = new Guest();
		guest.setGuestName(guestName);
		guest.setEmail(email);
		guest.setGender(gender);
		guest.setContactNumber(contactNumber);
		guest.setPassword(password);
		
		Integer id = guestDao.addGuest(guest);
		System.out.println(id);
	
		ModelAndView modelAndView = new ModelAndView("Guest");
		modelAndView.addObject("guest",guest);
		return modelAndView;
	}
	
	@RequestMapping(value="/HotelForm",method=RequestMethod.GET)
	public ModelAndView getHotelForm() {
		ModelAndView modelAndView = new ModelAndView("HotelForm");
		return modelAndView;
	}
	
	@RequestMapping(value="/HotelLogin",method=RequestMethod.GET)
	public ModelAndView getHotelLoginForm() {
		ModelAndView modelAndView = new ModelAndView("HotelLogin");
		return modelAndView;
	}
	
	@RequestMapping("/hotels")
	public ModelAndView getRequests() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		List<Hotel> hotelList= guestDao.getAllHotels();
		ModelAndView modelAndView = new ModelAndView("ViewHotels");
		modelAndView.addObject("hotelList",hotelList);
		return modelAndView;
	}
	
	@RequestMapping(value="/hotel",method=RequestMethod.POST)
	public ModelAndView getHotelDetails(@RequestParam("hotelName") String hotelName,@RequestParam("email") String email,@RequestParam("contactNumber") String contactNumber,
			@RequestParam("streetAddress") String streetAddress,@RequestParam("city") String city,@RequestParam("state") String state,@RequestParam("pincode") String pincode,
			@RequestParam("noOfRooms") String noOfRooms,@RequestParam("roomCost") String roomCost,@RequestParam("password") String password){
		
		 ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		 GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		
		 Address address = new Address(streetAddress,city,state,pincode);
		 Hotel hotel = new Hotel(hotelName,contactNumber,Double.parseDouble(roomCost),Integer.parseInt(noOfRooms),email,password,address);
		 address.setHotel(hotel);
		 Integer id = guestDao.addHotel(hotel);
		 System.out.println(id);
	
		 ModelAndView modelAndView = new ModelAndView("Hotel");
		 modelAndView.addObject("address",address);
		 modelAndView.addObject("hotel",hotel);
		 return modelAndView;
	 }
	
	@RequestMapping(value="/manager",method=RequestMethod.POST)
	public ModelAndView getLoginDetails(@RequestParam("userId") String email,@RequestParam("password") String password){
		
		 ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		 GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		 
		 boolean isUSer = guestDao.authenticateHotel(email, password);
		 List<Booking> bookedUserDetails= guestDao.getBookedUsers(email);
		
		 List<Hotel> hotels = guestDao.getAllHotels();
		 Integer id =null;
		 for(Hotel h : hotels) {
			if(h.getEmail().equals(email)) {
				id=h.getHotelId();
			}
		}
		 
		if(isUSer) {
			ModelAndView modelAndView = new ModelAndView("BookedGuestDetails");
			modelAndView.addObject("msg","Hotels");
			modelAndView.addObject("id",id);
			modelAndView.addObject("bookedUserDetails", bookedUserDetails);
			return modelAndView;
		}
		else {
			ModelAndView modelAndView = new ModelAndView("IncorrectCredentials");
			return modelAndView;
		}
	}

	
	@RequestMapping(value="/UserProfile/{id}",method=RequestMethod.GET)
	public ModelAndView getUSerProfile(@PathVariable("id") Integer id) {

		 ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		 GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
	     Guest g = guestDao.getGuestById(id);
		 ModelAndView modelAndView = new ModelAndView("UpdateGuest");
		 modelAndView.addObject("guest",g);
		 return modelAndView;
		
	}
	@RequestMapping(value="/updateUser/{id}",method=RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute("guest") Guest guest,@PathVariable("id") Integer id) {
		 ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
			GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
			
			guestDao.updateGuest(guest);
			List<Hotel> hotelList= guestDao.getAllHotels();
			ModelAndView modelAndView = new ModelAndView("Hotels");
			modelAndView.addObject("hotelList", hotelList);
			modelAndView.addObject("id", id);
		return modelAndView;
	}
	
	@RequestMapping(value="/updateHotel/{id}",method=RequestMethod.POST)
	public ModelAndView getHotelDetails1(@RequestParam("hotelId") Integer hotelId,@RequestParam("hotelName") String hotelName,@RequestParam("email") String email,@RequestParam("contactNumber") String contactNumber
			,@RequestParam("addressId") Integer addressId,@RequestParam("street") String streetAddress,@RequestParam("city") String city,@RequestParam("state") String state,@RequestParam("pincode") String pincode,@RequestParam("noOfRooms") Integer noOfRooms,@RequestParam("room_cost_perDay") Double roomCost,@RequestParam("password") String password,@PathVariable("id") Integer id){
	
		 ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		 GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
			
		 guestDao.updateHotel(hotelId,hotelName, email,contactNumber,addressId,
				 	streetAddress,city,state,pincode, noOfRooms,roomCost,password);
			
		 Hotel ho = guestDao.getHotelById(id);
		 List<Booking> bookedUserDetails= guestDao.getBookedUsers(ho.getEmail());
		
		 ModelAndView modelAndView = new ModelAndView("BookedGuestDetails");
		 modelAndView.addObject("id",id);
		 modelAndView.addObject("bookedUserDetails", bookedUserDetails);
		 return modelAndView;

	}

	@RequestMapping(value="/HotelProfile/{id}",method=RequestMethod.GET)
	public ModelAndView getHotelProfile(@PathVariable("id") Integer id) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		Hotel h = guestDao.getHotelById(id);
		ModelAndView modelAndView = new ModelAndView("UpdateHotel");
		modelAndView.addObject("hotel",h);
		return modelAndView;
		
	}
	
	@RequestMapping("/lowToHigh")
	public ModelAndView getHotelsLowToHigh() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		List<Hotel> hotelList= guestDao.getAllHotelsAsc();
		ModelAndView modelAndView = new ModelAndView("LowToHigh");
		modelAndView.addObject("hotelList",hotelList);
		
		return modelAndView;
	}
	
	@RequestMapping("/highToLow")
	public ModelAndView getHotelsHighToLow() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		List<Hotel> hotelList= guestDao.getAllHotelsDesc();
		ModelAndView modelAndView = new ModelAndView("HighToLow");
		modelAndView.addObject("hotelList",hotelList);
		return modelAndView;
	}
	
	@RequestMapping(value="/userBookingDetails",method=RequestMethod.POST)
	public ModelAndView getUserLoginDetails(@RequestParam("email") String email){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		
		List<Booking> bookingList= null;
		bookingList= guestDao.getUserBooking(email);
		System.out.println();
		System.out.println(email);
		System.out.println(bookingList);
		ModelAndView modelAndView= new ModelAndView("UserBookingDetails");
		modelAndView.addObject("bookingList", bookingList);
		return modelAndView;
	}
	
	@RequestMapping(value="/viewHotel/{hotelId}",method=RequestMethod.GET)
	public ModelAndView getSelectedHotel(@PathVariable("hotelId") Integer hotelId){
		
		 ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		Hotel hotel= guestDao.getHotelById(hotelId);
		ModelAndView modelAndView = new ModelAndView("ViewHotel");
		modelAndView.addObject(hotel);
		return modelAndView;
	}
	
	@RequestMapping(value="/bookHotel/{hotelId}",method=RequestMethod.GET)
	public ModelAndView bookHotel(@PathVariable("hotelId") Integer hotelId) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		Hotel hotel= guestDao.getHotelById(hotelId);
		ModelAndView modelAndView = new ModelAndView("Booking");
		modelAndView.addObject("hotel",hotel);
		return modelAndView;
		
	}

	@RequestMapping(value="/bookingSuccessful",method=RequestMethod.POST)
	public ModelAndView bookingSuccessful(@RequestParam("guestEmail") String guestEmail, 
				@RequestParam("checkInDate") String checkInDate, @RequestParam("checkOutDate") String checkOutDate, 
				@RequestParam("hotelEmail") String hotelEmail, @RequestParam("room_cost_perDay") Double room_cost_perDay,
				@RequestParam("hotelId") Integer hotelId) {
		
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		float noOfDays = 0;
		try {
			Date startDate= simpleDateFormat.parse(checkInDate);
			Date endDate= simpleDateFormat.parse(checkOutDate);
			long diff = endDate.getTime() - startDate.getTime();
			noOfDays= TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			System.out.println(noOfDays);
		} catch (Exception e) {
			e.printStackTrace();
		}
		double total_cost= room_cost_perDay*noOfDays;
		Booking booking= new Booking();
		booking.setGuestEmail(guestEmail);
		booking.setCheckInDate(checkInDate);
		booking.setCheckOutDate(checkOutDate);
		booking.setHotelEmail(hotelEmail);
		booking.setDays((int)noOfDays);
		booking.setCost(total_cost);
		booking.setHotelId(hotelId);
		Integer id= guestDao.addBooking(booking);
		ModelAndView modelAndView= new ModelAndView("BookingSuccessfull");
		modelAndView.addObject("id", id);
		return modelAndView;
	}
	
	@RequestMapping(value="/searchHotels",method=RequestMethod.POST)
	public ModelAndView getCityDetails(@RequestParam("city") String city) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		GuestDaoImpl guestDao = (GuestDaoImpl) context.getBean("UserDao");
		List<Hotel> hotelListByCity= guestDao.getHotelByAddress(city);
		ModelAndView modelAndView = new ModelAndView("HotelsByCity");
		modelAndView.addObject("hotelListByCity",hotelListByCity);
		return modelAndView;
	}
	
}
