SELECT 
t.Request_at Day, 
round(sum(CASE WHEN t.status = 'completed' THEN 0 ELSE 1 END) / count(id), 2) 'Cancellation Rate'
FROM trips t
where t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
AND t.client_id IN (SELECT u.users_id FROM users u WHERE u.banned= 'No' )
AND t.driver_id  IN (SELECT u.users_id FROM users u WHERE u.banned= 'No' )
GROUP BY  t.request_at