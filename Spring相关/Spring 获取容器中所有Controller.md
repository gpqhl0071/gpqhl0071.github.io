```
  @Autowired
  WebApplicationContext applicationContext;

  public void t() {
    RequestMappingHandlerMapping mapping = applicationContext.getBean(RequestMappingHandlerMapping.class);
    // 拿到Handler适配器中的全部方法
    Map<RequestMappingInfo, HandlerMethod> methodMap = mapping.getHandlerMethods();
    List<String> urlList = new ArrayList<>();
    for (RequestMappingInfo info : methodMap.keySet()) {

      Set<String> urlSet = info.getPatternsCondition().getPatterns();
      // 获取全部请求方式
      Set<RequestMethod> Methods = info.getMethodsCondition().getMethods();
      System.out.println(Methods.toString());
      for (String url : urlSet) {
        // 加上自己的域名和端口号，就可以直接调用
        urlList.add("http://localhost:XXXX" + url);
      }
    }
    log.info(urlList.toString());
  }
```