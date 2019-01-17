-- 删除当日返点数据
delete FROM t_agent_fund_user_commission WHERE `day` = '20190113';
delete FROM t_agent_fund_emp_com WHERE DAY = '20190113';
delete FROM t_agent_fund_commission WHERE DAY = '20190113';

-- 统计代理商返点Q部分，资金存量统计
SELECT ttd.fund_id fundId, ttd.user_id userId, tau.employee_id employeeId, tau.agent_id agentId, ttd.amount_balance amountBalance
FROM t_trade_detail ttd LEFT OUTER JOIN t_agent_user tau ON ttd.user_id = tau.user_id
WHERE ttd.amount_balance > 0 AND tau.agent_id IS NOT NULL
  AND ttd.trade_time < '2019-01-14 00:00:00' AND (ttd.liquidation_time IS NULL OR ttd.liquidation_time > '2019-01-14 23:59:59')
  AND tau.agent_id = 169


