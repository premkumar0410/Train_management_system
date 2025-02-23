select * from user_procedures;

create or replace procedure TTS_TRAIN_MANAGEMENT
(
First_name	in varchar,
Last_name in varchar,	
Address	in varchar,
Phone_no in varchar,
l_Mail_id	in varchar,
Password in varchar,
date_ in date,
l_from_stn in varchar,
l_to_stn in varchar,
l_seats in int,
l_payment_mode in varchar,
flag in number
) as
Train_number number;
f2_customer_id number;
amount number;
transaction_id number ;
begin
if flag = 1 then
insert into TTS_Customer (customer_id,First_name,Last_name,Address,Phone_no,Mail_id,Password)
values(SCUS_ID.nextval,first_name,last_name,address,phone_no,l_mail_id,password);
elsif flag = 2 then
SELECT TRAIN_NO  into Train_number FROM 
(select TRAIN_NO,from_stn ,rownum AS FORM_, to_stn ,rownum AS TO_ from tts_train )
WHERE FROM_STN = l_from_stn AND TO_STN = l_to_stn AND FORM_ = TO_;
dbms_output.put_line(Train_number);
select customer_id into f2_customer_id from tts_customer where mail_id = l_mail_id;
dbms_output.put_line(f2_customer_id);
select fare into amount from tts_train where train_no = train_number;
dbms_output.put_line(amount);
insert into tts_history(trans_id,customer_id,train_no,date_,from_stn,to_stn,Seats,Amount)
values(SQTRACID.nextval,f2_customer_id,train_number,date_,l_from_stn,l_to_stn,l_seats,l_seats * amount) returning trans_id into transaction_id;
insert into tts_payment (PAYMENT_ID,TRANS_ID,CUSTOMER_ID,PAYMENT_MODE,PAYMENT_STATUS,PAYMENT_DATE)
values(sqpayid.nextval,transaction_id,f2_customer_id,l_payment_mode,'Pending',sysdate);
end if;
end;
/

select * from user_errors where name = TTS_TRAIN_MANAGEMENT;


begin
TTS_TRAIN_MANAGEMENT(First_name =>'prem',	
Last_name=>'R',
Address	=>'chennai',
Phone_no=>'9073723',
l_Mail_id	=>'prem@123.com',
Password=>'Prem0232',
date_=>null,
l_from_stn =>null,
l_to_stn =>null,
l_seats => null,
l_payment_mode => null,
flag => 1);
end;


begin
TTS_TRAIN_MANAGEMENT(
First_name =>null,
Last_name=>null,
Address	=>null,
Phone_no=>null,
l_Mail_id	=>'prem@123.com',
Password=>null,
date_=>'10/apr/2025',
l_from_stn =>'Chennai Central',
l_to_stn =>'Madurai Junction',
l_seats => 5,
l_payment_mode => 'upi',
flag => 2);
end;

select trans_id  from tts_history where customer_id = 6005;

select * from tts_customer;

select * from tts_train;

select * from tts_payment;

select * from tts_history;


select * from user_sequences;
SQTRACID

--flag 2
select customer_id from tts_customer where mail_id = 'prem@090.com';

SELECT *  FROM 
(select TRAIN_NO,from_stn ,rownum AS FORM_, to_stn ,rownum AS TO_ from tts_train ) WHERE FROM_STN = 'Chennai Central' AND TO_STN ='Madurai Junction' AND FORM_ = TO_;

select seats from tts_train where train_no = 12623;

select 5*fare from tts_train where train_no = 12623;

--flag 3

select * from user_sequences;

create sequence sqpayid start with 10000; 


select * from tts_train

SELECT *  FROM 
(select TRAIN_NO,from_stn ,rownum AS FORM_, to_stn ,rownum AS TO_ from tts_train ) WHERE FROM_STN = 'Chennai Central' AND TO_STN ='Madurai Junction' AND FORM_ = TO_;