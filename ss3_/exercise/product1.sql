use my_custommer;

select order_id, order_date, order_total_price
from `order`;

select customer.customer_name, product.product_name
from customer
join `order` on customer.customer_id = `order`.customer_id
join order_detail on `order`.order_id = order_detail.order_id
join product on order_detail.product_id = product.product_id;

select customer.customer_name
from customer
where customer.customer_id not in( 
select customer.customer_id 
from customer
join `order` on customer.customer_id = `order`.customer_id
join order_detail on `order`.order_id = order_detail.order_id
join product on order_detail.product_id = product.product_id);

select `order`.order_id, `order`.order_date, SUM((ifnull(order_quantity, 0) * ifnull(product_price, 0))) as bill_price
from `order`
join order_detail on `order`.order_id = order_detail.order_id
join product on order_detail.product_id = product.product_id
group by order_id;