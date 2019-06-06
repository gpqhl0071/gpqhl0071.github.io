
-- 查询表结构信息
```mysql
SELECT c.COLUMN_NAME,c.COLUMN_TYPE,c.COLUMN_COMMENT 
    FROM information_schema.`COLUMNS` AS c 
    WHERE c.TABLE_NAME = 't_agent_reward_punish_month'
```

# 插入多条数据
```sql
INSERT INTO
 `t_agent_fund_user_commission1` 
(`id`, `fund_id`, `user_id`, `employee_id`, `agent_id`, `day`, `join_balance`, `join_commission`, `trade_commission`) 

(select `id`, `fund_id`, `user_id`, `employee_id`, `agent_id`, `day`, `join_balance`, `join_commission`, `trade_commission` 
from t_agent_fund_user_commission where day = 20190102);
```

# 批量替换
```sql

UPDATE t_user_integral_product SET product_details = replace (`product_details`,'dm.1001.c','dm.1001.co')
```