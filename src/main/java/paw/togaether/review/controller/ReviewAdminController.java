package paw.togaether.review.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import paw.togaether.review.service.ReviewService;

@Controller
public class ReviewAdminController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	
}
