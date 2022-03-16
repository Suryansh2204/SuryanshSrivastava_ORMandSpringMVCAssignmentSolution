package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.entity.Customer;
import com.crm.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController 
{
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/list")
	public String listCustomers(Model model)
	{
		List<Customer> customers=customerService.findAll();
		model.addAttribute("customer",customers);
		return "customer-list";
	}
	
	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model model)
	{
		Customer customer=new Customer();
		model.addAttribute("customer", customer);
		return "customer-form";
	}
	
	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int id, Model model)
	{
		Customer customer=customerService.findById(id);
		model.addAttribute("customer", customer);
		return "customer-form";
	}
	
	@PostMapping("/save")
	public String saveCustomer(@RequestParam("id") int id, 
							   @RequestParam("fName") String fName,
							   @RequestParam("lName") String lName,
							   @RequestParam("email") String email)
	{
		if(customerService.findById(id)!=null)
		{
			Customer customer=customerService.findById(id);
			customer.setfName(fName);
			customer.setlName(lName);
			customer.setEmail(email);
		}
		else
		{
			Customer customer=new Customer(fName,lName,email);
			customerService.save(customer);
		}
		return "redirect:/customer/list";
	}
	
	@RequestMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int id)
	{
		customerService.deleteById(id);
		return "redirect:/customer/list";
	}
}
