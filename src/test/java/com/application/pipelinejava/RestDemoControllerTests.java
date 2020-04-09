package com.application.pipelinejava;

import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@RunWith(SpringJUnit4ClassRunner.class)
public class RestDemoControllerTests {

    private MockMvc mvc;

    @InjectMocks
    private RestDemoController restDemoController;

    @Before
    public void setup() throws Exception {
        mvc = MockMvcBuilders.standaloneSetup(restDemoController).build();
    }

    @Test
    public void helloWorld() throws Exception{
        mvc.perform(
            MockMvcRequestBuilders.get("/health")
            .accept(MediaType.APPLICATION_JSON)
        )
        .andExpect(MockMvcResultMatchers.status().isOk())
        .andExpect(MockMvcResultMatchers.jsonPath("$.Hello", Matchers.is("World")));
    }
}