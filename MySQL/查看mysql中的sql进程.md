- 查询正在运行的sql语句
```sql
select * from information_schema.PROCESSLIST WHERE state = 'Sending data';
```

- 生成kill命令
```sql
select concat('kill ',ID,';') from information_schema.processlist where state = 'Sending data';
```

`kill 10244573;`