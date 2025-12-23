-- Retrieve booking information along with:
select b.booking_id, u.name as customer_name, v.vehicle_name, b.start_date, b.end_date, b.status from bookings b
inner join users u on u.id = b.user_id
inner join vehicles v using(vehicle_id);

-- Find all vehicles that have never been booked.
select v.vehicle_id, v.name, v.type, v.model, v.registration_number, v.rental_price, v.status
from vehicles v
where not exists (
    select 1
    from bookings b
    where b.vehicle_id = v.vehicle_id
);

-- Retrieve all available vehicles of a specific type (e.g. cars).
select * from vehicles
where type = 'car' and status = 'available';

-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
select  v.vehicle_name, count(*) as total_bookings from bookings b
left join vehicles v using(vehicle_id)
group by b.vehicle_id, v.vehicle_name
having count(*) > 2;
