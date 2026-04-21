use session06;


create table users(
	user_id int primary key auto_increment,
    user_name Nvarchar(50) not null
);

INSERT INTO users (user_name) 
VALUES 
('Nguyễn Tuấn Minh'), 
('Nguyễn Duy Khánh');

create table booking(
	user_id int,
	booking_id int primary key auto_increment,
    `status` varchar(20),
    total_room int check (total_room > 0)
);

-- mẫu để thử 
INSERT INTO booking (user_id, `status`, total_room) 
VALUES 
(2, 'BOOKED', 1), 
(2, 'BOOKED', 1), 
(2, 'BOOKED', 1), 
(2, 'BOOKED', 1), 
(2, 'BOOKED', 1),
(2, 'CANCELLED', 1), 
(2, 'CANCELLED', 1), 
(2, 'CANCELLED', 1), 
(2, 'CANCELLED', 1), 
(2, 'CANCELLED', 1), 
(2, 'CANCELLED', 1),
(1, 'BOOKED', 1), 
(1, 'BOOKED', 1), 
(1, 'BOOKED', 1), 
(1, 'BOOKED', 1);

select * from booking;

select u.user_id, u.user_name, count(b.user_id) as 'datphong',
	SUM(
		case 
			when b.`status` = 'CANCELLED' then 1 
            else 0
		end  
    ) as 'Số lần hủy'
from booking b
JOIN users u ON b.user_id = u.user_id
group by u.user_id, u.user_name
having count(b.user_id) >= 10 and sum(case when b.`status` = 'CANCELLED' then 1 else 0 end);




