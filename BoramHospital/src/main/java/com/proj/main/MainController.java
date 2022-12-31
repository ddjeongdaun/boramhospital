package com.proj.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.admin.AdminServiceImp;
import com.proj.doctor.DoctorServiceImp;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired
	AdminServiceImp adminService;
	
	@Autowired
	DoctorServiceImp doctorService;
	
	@RequestMapping(value = "/info")
	public String info() {
		return "/main/info";
	}
	
	@RequestMapping(value = "/dept")
	public String dept() {
		return "/main/dept";
	}
	
	@RequestMapping(value = "/doctor")
	public String doctor() {
		return "/main/doctor";
		
	}
	
	@RequestMapping(value = "/load")
	public String load() {
		return "/main/load";
	}

}
