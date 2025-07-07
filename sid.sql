Create database ola;
use ola;
Create view Successful_booking As # in this we create the view to store output temprary.
Select * From bookings 
WHERE booking_Status = 'Success'; # in this we print the full table with condition of success in booking status.
select * from Successful_Booking;
Create view ride_distance_for_each_vehicles As # in this we create the view to store output temprary.
select Vehicle_Type, AVG(Ride_Distance)
as avg_distance From bookings
Group by Vehicle_Type; # in this we find the avg of ride distance of vehicle type.
select *from ride_distance_for_each_vehicles;# Get the total no. of cancelled ride by the customer.
Create view Canceled_rides_by_customer As
select Count(*) from bookings
Where booking_Status='Canceled by customer'; # in this we use count for count no. ride  who's canceled by customer 
select * from Canceled_rides_by_customer;
create view customer_total_rides as
Select Customer_ID, Count(Booking_ID) as Total_rides # list the top 5 customer who booked highest number of rides
from bookings
Group by Customer_ID
Order by Total_rides desc limit 5;
select * from customer_total_rides;
create view issue_in_rides as 
select Count(*) from bookings # Get the number of rides canceled by driver due some car reason.
Where Canceled_Rides_by_Driver='Personal & Car related issue';
Select * from issue_in_rides;
create view Max_min_Driver_rating as 
Select MAX(Driver_Ratings) as max_rating, # Find the max and min Driver rating for prime sedan 
MIN(Driver_Ratings) as min_rating
From bookings WHERE Vehicle_Type ='Prime Sedan';
Select * from Max_min_Driver_rating;
create view payment_method_UPI as # retrive all the ride where payment mode is upi
select*from bookings
where Payment_method ='upi';
Select * from payment_method_UPI;
create view Avg_rating_customer as
Select vehicle_type, AVG(Customer_Rating) as avg_Rating # find the avg customer rating according to vehicle type.
From bookings
Group by vehicle_Type;
Select * from Avg_rating_customer;
Create view sum_of_Total_rides as
Select SUM(Booking_Value) as Toatal_rides  # calculate the sum of booking values of status success.
From bookings
Where Booking_Status ='Success';
Select * from sum_of_Total_rides;
Create view Incomplte_ride_reason as
select Booking_Id, Incomplete_Rides_Reason # list all the incomplete rides with reason
from bookings
Where Incomplete_Rides ='YES';
Select * from Incomplte_ride_reason;


