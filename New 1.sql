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
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    travel_duration varchar2(30),
    available_seats INT
);

drop table tts_schedule;

CREATE TABLE TTS_Payment (
    payment_id INT primary key,
    trans_id INT references tts_train(train_no),
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

