CREATE TABLE TTS_Customer (
    customer_id INT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Address VARCHAR(255),
    Phone_no VARCHAR(15),
    Mail_id VARCHAR(100),
    Password VARCHAR(100),
    constraint bank_customer_id_pk primary key(customer_id)
);

CREATE TABLE TTS_Train (
    Train_no number primary key,
    Train_name VARCHAR(100),
    From_stn VARCHAR(50),
    To_Stn VARCHAR(50),
    Seats number,
    Fare number
);



CREATE TABLE TTS_History (
    trans_id INT,
    customer_id INT,
    train_no INT,
    date_ DATE,
    from_stn VARCHAR(50),
    to_stn VARCHAR(50),
    Seats INT,
    Amount number,
    constraint bank_trans_id_pk primary key(trans_id),
    constraint bank_customer_id_fk foreign key(customer_id) references tts_customer(customer_id),
    constraint bank_history_train_no_pk foreign key(train_no) references tts_train(train_no)
);


CREATE TABLE TTS_Schedule (
    schedule_id INT primary key,
    train_no INT references tts_train(train_no),
    departure_time varchar2(30),
    arrival_time varchar2(30),
    travel_duration varchar2(30),
    available_seats INT
);


drop table tts_payment;

CREATE TABLE TTS_Payment (
    payment_id INT primary key,
    trans_id INT references tts_history(trans_id),
    customer_id INT references tts_customer(customer_id),
    payment_mode VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATE
);


CREATE TABLE TTS_Cancellation (
    cancel_id INT primary key,
    trans_id INT references tts_train(train_no),
    customer_id INT references tts_customer(customer_id),
    cancel_date DATE,
    refund_amount number,
    status VARCHAR(50)
);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12623, 'Chennai Central - Madurai SF Express', 'Chennai Central', 'Madurai Junction', 800, 600);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12673, 'Chennai Egmore - Tiruchirappalli Rockfort Express', 'Chennai Egmore', 'Tiruchirappalli', 750, 550);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12681, 'Coimbatore - Chennai Intercity Express', 'Coimbatore Junction', 'Chennai Central', 700, 500);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(16127, 'Chennai Egmore - Guruvayur Express', 'Chennai Egmore', 'Coimbatore Junction', 650, 450);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12633, 'Chennai - Kanyakumari Express', 'Chennai Egmore', 'Kanyakumari', 850, 700);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12636, 'Vaigai Express', 'Chennai Egmore', 'Madurai Junction', 900, 550);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12652, 'Madurai - Chennai Pandian Express', 'Madurai Junction', 'Chennai Egmore', 850, 580);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12642, 'Thirukkural Express', 'Nagercoil Junction', 'Chennai Central', 800, 750);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12661, 'Pothigai Express', 'Chennai Egmore', 'Tenkasi Junction', 700, 650);

INSERT INTO TTS_Train (Train_no, Train_name, From_stn, To_Stn, Seats, Fare) VALUES
(12688, 'Dehradun - Madurai Express', 'Madurai Junction', 'Chennai Egmore', 650, 700);




INSERT INTO TTS_Schedule (schedule_id, train_no, departure_time, arrival_time, travel_duration, available_seats) VALUES
(1, 12623, '06:00 AM', '02:00 PM', '8 Hours', 200);

INSERT INTO TTS_Schedule (schedule_id, train_no, departure_time, arrival_time, travel_duration, available_seats) VALUES
(2, 12673, '09:00 PM', '05:00 AM', '8 Hours', 180);

INSERT INTO TTS_Schedule (schedule_id, train_no, departure_time, arrival_time, travel_duration, available_seats) VALUES
(3, 12681, '07:15 AM', '01:45 PM', '6 Hours 30 Minutes', 220);

INSERT INTO TTS_Schedule (schedule_id, train_no, departure_time, arrival_time, travel_duration, available_seats) VALUES
(4, 16127, '10:30 PM', '07:00 AM', '8 Hours 30 Minutes', 150);

INSERT INTO TTS_Schedule (schedule_id, train_no, departure_time, arrival_time, travel_duration, available_seats) VALUES
(5, 12633, '05:45 PM', '07:15 AM', '13 Hours 30 Minutes', 250);