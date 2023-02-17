package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.AdminMemberService;
import paw.togaether.member.service.JoinService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class AdminMemberController {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="adminMemberService")
    private AdminMemberService adminMemberService;

    @Resource(name="joinService")
    private JoinService joinService;


    @GetMapping(value = "/admin/getMembers")
    public ResponseEntity<Map<String,Object>> getMemberList(Map<String,Object> map, @RequestParam(required = false , value="id") String userId, @RequestParam(required = false , value="dogname") String dogname, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size ) throws Exception {
        Map<String, Object> result = new HashMap<>();

        map.put("id",userId);
        map.put("dogname", dogname);
        System.out.println(dogname);
        int totalItems = adminMemberService.getTotalItems();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        int startIndex = (page - 1) * size;
        int endIndex = Math.min(startIndex + size, totalItems);

        List<Integer> pageList = IntStream.rangeClosed(1, totalPages)
                .filter(i -> (i - 1) / 10 == (page - 1) / 10)
                .boxed()
                .collect(Collectors.toList());

        map.put("startIndex", startIndex);
        map.put("pageSize", size);
        map.put("endIndex", endIndex);
        List<Map<String,Object>> memberlist =  adminMemberService.getInfoOfMembers(map);
        result.put("page", page);
        result.put("size", size);
        result.put("totalItems", totalItems);
        result.put("totalPages", totalPages);
        result.put("startIndex", startIndex);
        result.put("endIndex", endIndex);
        result.put("pageList", pageList);
        result.put("memberList", memberlist);

        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    @GetMapping(value = "/admin/adminMember")
    public ModelAndView adminMember() throws Exception {
        ModelAndView mv = new ModelAndView("/admin/member/AdminMember");
        return mv;
    }

    @GetMapping(value = "/admin/modifyMemberInfo")
    public ModelAndView modifyMemberInfo(Map<String,Object> commandMap, @RequestParam(value="id") String userId) throws Exception {
        ModelAndView mv = new ModelAndView("/admin/member/modifyMemberInfo");

        String MEM_ID = userId;
        commandMap.put("MEM_ID", MEM_ID);

        List<Map<String, Object>> dogList = joinService.listOfDog(commandMap);
        mv.addObject("dogList", dogList);

        Map<String, Object> infoForModify = adminMemberService.infoForModify(commandMap);

        for (String key : infoForModify.keySet()) {
            mv.addObject(key, infoForModify.get(key));
        }

        return mv;
    }

    @PostMapping(value = "/admin/modifyMemberInfo")
    public ModelAndView postModifyMemberInfo(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/admin/adminMember");

        adminMemberService.modifyMemberInfo(commandMap.getMap());

        return mv;
    }


    @GetMapping(value = "/admin/adminDogname")
    public ModelAndView adminDogname(Map<String,Object> map) throws Exception {
        ModelAndView mv = new ModelAndView("/admin/member/adminDogname");

        List<Map<String, Object>> dogList = joinService.listOfDog(map);
        mv.addObject("dogList", dogList);

        return mv;
    }
    @ResponseBody
    @GetMapping(value = "/admin/getDognames")
    public ResponseEntity<Map<String, Object>> getDogNames(Map<String,Object> map, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size ) throws Exception {
        Map<String, Object> result = new HashMap<>();

        int totalItems = adminMemberService.getTotalDogItems();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        int startIndex = (page - 1) * size; // 시작 인덱스
        int endIndex = Math.min(startIndex + size, totalItems);

        List<Integer> pageList = IntStream.rangeClosed(1, totalPages)
                .filter(i -> (i - 1) / 10 == (page - 1) / 10)
                .boxed()
                .collect(Collectors.toList());
        map.put("startIndex", startIndex);
        map.put("pageSize", size);
        map.put("endIndex", endIndex);
        List<Map<String, Object>> dogList = adminMemberService.listOfDogPaging(map);
        result.put("page", page);
        result.put("size", size);
        result.put("totalItems", totalItems);
        result.put("totalPages", totalPages);
        result.put("startIndex", startIndex);
        result.put("endIndex", endIndex);
        result.put("pageList", pageList);
        result.put("dogList", dogList);

        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping(value = "/admin/modifyDogname")
    public ModelAndView modifyDogname(Map<String,Object> map, @RequestParam(value="id") String idx) throws Exception {
        ModelAndView mv = new ModelAndView("/admin/member/modifyDogname");

        String BR_IDX = idx;
        map.put("BR_IDX", BR_IDX);

        Map<String, Object> infoForModifyDog = adminMemberService.infoForModifyDog(map);


        for (String key : infoForModifyDog.keySet()) {
            mv.addObject(key, infoForModifyDog.get(key));
        }
//        adminMemberService.modifyDogname(commandMap);
        return mv;
    }

    @PostMapping(value = "/admin/modifyDogname")
    public ModelAndView modifyDogname(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/admin/member/adminDogname");
        adminMemberService.modifyDogname(commandMap.getMap());
        return mv;
    }

    @PostMapping(value="/admin/dogname")
    public ModelAndView addDogname(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/admin/member/adminDogname");
        adminMemberService.addDogname(commandMap.getMap());

        return mv;

    }
    @GetMapping(value="/admin/dogname")
    public ModelAndView addDognameView(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/admin/member/addDogname");

        return mv;

    }

}
