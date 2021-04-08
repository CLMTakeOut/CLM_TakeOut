package com.clm.controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * date: 2021/3/24 10:52
 * 说明:
 */
@RestController
public class HelloController {
    @RequestMapping("/hello")
    public String hello(){
        return  "Hello,World";
    }
}
