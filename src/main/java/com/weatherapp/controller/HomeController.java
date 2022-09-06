package com.weatherapp.controller;

import java.time.Instant;
import java.time.LocalDateTime;

import java.time.ZoneId;

import java.time.format.DateTimeFormatter;

import java.util.ArrayList;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kong.unirest.Unirest;
import kong.unirest.json.JSONArray;
import kong.unirest.json.JSONObject;

@Controller
public class HomeController {

	private String part1 = "https://api.openweathermap.org/data/2.5/weather?q=";
	private String part2 = "&appid=098393bcf1e5425bf7ddc413fcc0f92b&units=imperial";
	
	@GetMapping("/")
	public String renderPage() {
		
		return "Index.jsp";
	}
	
	@GetMapping("/search")
	public String search(@RequestParam("query")String searchQuery, Model model) {
		//check if there is any errors
		
		
		//make an api call using the searchQuery
		String searchComplete = searchQuery.replace(" ", "+");
		String apiCallQuery = part1+searchComplete+part2;

			//Save the response from the api as a JSON Object
			JSONObject resultsObj = Unirest.get(apiCallQuery).asJson().getBody().getObject();
//		System.out.println(resultsObj);
			
			JSONObject mainObj = resultsObj.getJSONObject("main");
			JSONObject sysObj = resultsObj.getJSONObject("sys");
			
			//convert the timestamp to date
			String sunriseTime = sysObj.getString("sunrise");
			
			long num=Long.parseLong(sunriseTime);
			String date=LocalDateTime.ofInstant(
					Instant.ofEpochSecond(Long.valueOf(num)), ZoneId.systemDefault()
					).format(DateTimeFormatter.ofPattern("h:mm a"));
//					System.out.println(date);
//					System.out.println(sunriseTime);
			
//			System.out.println(sunrise);
			String sunsetTime = sysObj.getString("sunset");
			
			long num2=Long.parseLong(sunsetTime);
			String date2=LocalDateTime.ofInstant(
					Instant.ofEpochSecond(Long.valueOf(num2)), ZoneId.systemDefault()
					).format(DateTimeFormatter.ofPattern("h:mm a"));
//					System.out.println(date2);
//					System.out.println(sunsetTime);
			
			
			
			JSONObject windObj = resultsObj.getJSONObject("wind");
			
			JSONArray resultsArray = resultsObj.getJSONArray("weather");
			
			ArrayList<JSONObject> results = new ArrayList<JSONObject>();
			
			for(int i = 0; i < resultsArray.length(); i++) {
				results.add(resultsArray.getJSONObject(i));
			}
			
			model.addAttribute("mainObj", mainObj);
			model.addAttribute("sysObj", sysObj);
			model.addAttribute("windObj", windObj);
			model.addAttribute("results", results);
			model.addAttribute("resultsObj", resultsObj);
			model.addAttribute("date", date);
			model.addAttribute("date2", date2);
			
			return "Results.jsp";
			
		}
	
	@GetMapping("/back")
	public String backMain() {
		return "redirect:/";
	}
}
