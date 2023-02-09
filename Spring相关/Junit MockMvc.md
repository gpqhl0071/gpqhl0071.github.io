```java
package com.redhorse.web;

import com.redhorse.util.DigestUtil;

import lombok.extern.slf4j.Slf4j;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.http.Cookie;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/*.xml", "classpath:spring/appServlet/*.xml"})
@WebAppConfiguration
public class SpecialUserActionTest {
  @Autowired
  private WebApplicationContext wac;

  private MockMvc mockMvc;

  private MockHttpSession session;

  @Before
  public void init() throws Exception {
    this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    session = new MockHttpSession();
    login();
  }

  @Test
  public void login() throws Exception {
    Cookie cookie = new Cookie("validCode", DigestUtil.md5salt("123456"));

    MockHttpServletRequestBuilder loginRequestBuilder = MockMvcRequestBuilders.post("/login/login")
        .param("username", "admin@1001.cn")
        .param("password", "123456")
        .param("validcode", "123456")
        .contentType(MediaType.APPLICATION_JSON_UTF8)
        .cookie(cookie)
        .accept(MediaType.APPLICATION_JSON)
        .session(session);//3.当某个请求需要session时，直接在构造器中绑定需要的session
    String contentAsString = mockMvc.perform(loginRequestBuilder).andReturn().getResponse().getForwardedUrl();
    log.info(contentAsString);
  }

  @Test
  public void getSpecialUserList() throws Exception {

    String result = mockMvc.perform(
        MockMvcRequestBuilders.get("/specialUser/getSpecialUserList.do").session(session)
    )
        .andDo(MockMvcResultHandlers.print())
        .andReturn()
        .getResponse()
        .getContentAsString();

    log.info(result);
  }

  @Test
  public void queryRiskByRecordId() {
  }
}
```