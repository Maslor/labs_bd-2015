#show tables;
#describe building_dimension;
#describe datapoint_dimension;
#describe data_dimension;
#describe meter_readings;
#describe time_dimension;

/*
#1.
select week_day_name, avg(reading)
from meter_readings natural join date_dimension
group by week_day_name
order by avg(reading) desc;*/

/*
#2.
select building_name, week_number, avg(reading)
from meter_readings
	natural join building_dimension
    natural join date_dimension
where week_number>49
group by building_name, week_number;*/

/*
#3.
select week_number, avg(reading)
from meter_readings
	natural join building_dimension
    natural join date_dimension
where week_number>49
group by week_number with rollup; 
*/

/*
#4.
select building_name, avg(reading)
from meter_readings
	natural join building_dimension
    natural join date_dimension
where week_number>49
group by building_name 
order by avg(reading) desc;
*/

/*
#5.
select week_day_name, building_name, avg(reading)
from meter_readings
	natural join building_dimension
    natural join date_dimension
group by week_day_name, building_name
order by week_day_name, avg(reading) desc;
*/