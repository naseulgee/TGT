package paw.togaether.place.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import paw.togaether.common.domain.CommandMap;

@Controller
@RequestMapping("/place")
public class PlaceController {
	Logger log = Logger.getLogger(this.getClass());
	
	/* 23.01.13 나슬기: 시설 리스트 메소드 */
	@RequestMapping("/list")
	public void place_list(CommandMap commandMap) {}
	
	/* 23.01.13 나슬기: 시설 상세보기 메소드 */
	@RequestMapping("/detail/{pl_idx}")
	public void place_detail(@PathVariable("pl_idx") int cafe_idx, CommandMap commandMap) {}
	
	/* 23.01.13 나슬기: 시설 등록 폼 메소드 */
	@RequestMapping("/writeForm")
	public void place_regform(CommandMap commandMap) {}
	/* 23.01.13 나슬기: 시설 등록 처리 메소드 */
	@PostMapping("/write")
	public void place_reg(CommandMap commandMap) {}
	
	/* 23.01.13 나슬기: 시설 수정 폼 메소드 */
	@RequestMapping("/modifyForm")
	public void place_modiform(CommandMap commandMap) {}
	/* 23.01.13 나슬기: 시설 수정 처리 메소드 */
	@PostMapping("/modify")
	public void place_modi(CommandMap commandMap) {}
	
	/* 23.01.13 나슬기: 시설 삭제 처리 메소드 */
	@PostMapping("/delete")
	public void place_delete_req(CommandMap commandMap) {}
}