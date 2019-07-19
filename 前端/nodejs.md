# Linux 安装nodejs 

```# wget https://nodejs.org/dist/v10.9.0/node-v10.9.0-linux-x64.tar.xz    // 下载
# tar xf  node-v10.9.0-linux-x64.tar.xz       // 解压
# cd node-v10.9.0-linux-x64/                  // 进入解压目录
# ./bin/node -v                               // 执行node命令 查看版本

ln -s /usr/software/nodejs/bin/npm   /usr/local/bin/ 
ln -s /usr/software/nodejs/bin/node   /usr/local/bin/
 ```
 
# modules in Node.js

> Below are some of the popular modules which are used in a Node js application

- Express framework – Express is a minimal and flexible Node js web application framework that provides a robust set of features for the web and Mobile applications.
- Socket.io - Socket.IO enables real-time bidirectional event-based communication. This module is good for creation of chatting based applications.
- Jade - Jade is a high-performance template engine and implemented with JavaScript for node and browsers.
- MongoDB - The MongoDB Node.js driver is the officially supported node.js driver for MongoDB.
- Restify - restify is a lightweight framework, similar to express for building REST APIs
- Bluebird - Bluebird is a fully featured promise library with focus on innovative features and performance 
 
参考：https://www.guru99.com/node-js-modules-create-publish.html  

## 自定义modules:

```js
exports.myDateTime = function () {
  return Date();
};
```

```js
var http = require('http');
var dt = require('./demo');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("The date and time are currently: " + dt.myDateTime());
  res.end();
}).listen(8080);
```


参考学习：https://www.w3schools.com/nodejs/nodejs_url.asp  

# nodejs mysql

```js
var mysql = require('mysql');

var con = mysql.createConnection({
  host: "",
  user: "",
  password: "",
  database: "dx20_test"
});

con.connect(function(err) {
  if (err) throw err;
  con.query("SELECT * FROM t_user order by id desc limit 10", function (err, results, fields) {
        if(results){
            for(var i = 0; i < results.length; i++)
            {
                console.log('phone' + results[i].phone +'id'+results[i].id)
            }
        }
  });
});

```