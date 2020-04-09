package com.application.pipelinejava;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/health")
public class RestDemoController {

    @GetMapping
    public Map<String, String> helloWorld(){
        HashMap<String, String> map = new HashMap<>();
        map.put("Hello", "World");
        return map;
    }
}