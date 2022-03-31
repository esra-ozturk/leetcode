select 
t.Request_at Day, 
round(sum(case when t.status = 'completed' then 0 else 1 end) / count(id), 2) 'Cancellation Rate'
from trips t
where t.request_at between '2013-10-01' and '2013-10-03'
AND t.client_id IN (SELECT u.users_id FROM users u WHERE u.banned= 'No' )
AND t.driver_id  IN (SELECT u.users_id FROM users u WHERE u.banned= 'No' )
group by t.request_at