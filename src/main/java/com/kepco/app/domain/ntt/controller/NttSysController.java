package com.kepco.app.domain.ntt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/sys/**/ntt")
public class NttSysController {

    @GetMapping("/list")
    public String list() {
        return "sys/ntt/list";
    }

    @GetMapping("/save")
    public String save() {
        return "sys/ntt/save";
    }

    @GetMapping("/detail")
    public String update(@RequestParam("bbsId") String bbsId) {
    	String returnUrl = "";
    	switch (bbsId) {
	    	case "21":
	    		returnUrl = "sys/ntt/cooperation/update";		// 신사업 및 협력사업 문의·제안
	    		break;
	    	case "22":		
	    		returnUrl = "sys/ntt/integrity/update";			// 청렴,부패신고
	    		break;
	    	case "36":
	    		returnUrl = "sys/ntt/local/update";				// 로컬생산품
	    		break;
	    	case "1325":
	    		returnUrl = "sys/ntt/socialinquiry/update";		// 사회공헌,문의제안
	    		break;
	    	case "1326":
		    	returnUrl = "sys/ntt/report/update";			// 신문고
		    	break;
	    	case "1327":
	    		returnUrl = "sys/ntt/opinion/update";			// 고객의 소리
	    		break;
		    case "1328":
		    	returnUrl = "sys/ntt/conscience/update";		// 비위양심신고센터
		    	break;
		    default:
		    	returnUrl = "sys/ntt/update";
    	}
        return returnUrl;
    }

    @GetMapping("/reply")
    public String reply(@RequestParam String reply) {
        if(reply.equalsIgnoreCase("Y")) {
            return "sys/ntt/reply/update";
        }
        return "sys/ntt/reply/save";
    }
}
