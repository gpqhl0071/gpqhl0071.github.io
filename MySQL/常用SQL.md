
-- 查询表结构信息
```mysql
SELECT c.COLUMN_NAME,c.COLUMN_TYPE,c.COLUMN_COMMENT 
    FROM information_schema.`COLUMNS` AS c 
    WHERE c.TABLE_NAME = 't_agent_reward_punish_month'
```