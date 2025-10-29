package com.kepco.app.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ft")
public class ContentsController {

    /**
     * 회사소개
     */
    @GetMapping("/pr/{path}/list.do")
    public void pr01(@PathVariable String path) {}

}
