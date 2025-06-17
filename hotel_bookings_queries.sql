-- What is the average daily rate (ADR) by hotel type?
select hotel , avg(adr) as avg_adr 
from hotel_bookings 
group by hotel ;

--Which months have the highest number of bookings?
select arrival_date_month as booking_month , count(*) as bookings 
from hotel_bookings 
group by arrival_date_month
order by bookings desc
limit 1;

--Top 10 countries by number of total bookings.
select country , count(*) as bookings 
from hotel_bookings 
group by country 
order by bookings desc
limit 10 ;

-- How many bookings were canceled vs. not canceled?
select is_canceled , count(*) as bookings 
from hotel_bookings 
group by is_canceled ;

--How many guests (adults + children + babies) booked each room type?
 select assigned_room_type ,sum( adults + children + babies ) as total_guest
 from hotel_bookings 
 group by assigned_room_type;

--What % of guests are repeated guests?
 select round(sum(case when is_repeated_guest = 1 then 1 else 0 end )*100/count(*) , 2)
 as repeated_guest_percentage from hotel_bookings ;

--Find average lead time for bookings that were canceled vs. not canceled.
select is_canceled , round(avg(lead_time),2) as avg_lead_time 
from hotel_bookings 
group by is_canceled ;

--Which market segment brings in the highest revenue (ADR × total nights)?
select market_segment , round(sum(adr*(stays_in_weekend_nights + stays_in_week_nights )) , 2) as total_revenue 
from hotel_bookings 
group by market_segment 
limit 1;
