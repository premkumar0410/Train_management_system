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
flag in number
) as
Train_number number;
f2_customer_id number;
amount number;
begin
if flag = 1 then
insert into TTS_Customer (customer_id,First_name,Last_name,Address,Phone_no,Mail_id,Password)
values(SCUS_ID.nextval,first_name,last_name,address,phone_no,l_mail_id,password);
elsif flag = 2 then
SELECT TRAIN_NO  into Train_number FROM 
(select TRAIN_NO,from_stn ,rownum AS FORM_, to_stn ,rownum AS TO_ from tts_train )
WHERE FROM_STN = l_from_stn AND TO_STN = l_to_stn AND FORM_ = TO_;
select customer_id into f2_customer_id from tts_customer where mail_id = l_mail_id;
select fare into amount from tts_train where train_no = train_number;
insert into tts_history(trans_id,customer_id,train_no,date_,from_stn,to_stn,Seats,Amount)
values(SQTRACID.nextval,f2_customer_id,train_number,date_,l_from_stn,l_to_stn,l_seats,l_seats * amount);
end if;
end;
/

select * from user_errors where name = TTS_TRAIN_MANAGEMENT;


begin
TTS_TRAIN_MANAGEMENT(First_name =>'prem',	
Last_name=>'R',
Address	=>'chennai',
Phone_no=>'9073723',
Mail_id	=>'prem@090.com',
Password=>'Prem0232',
flag => 1);
end;


begin
TTS_TRAIN_MANAGEMENT(
First_name =>null,
Last_name=>null,
Address	=>null,
Phone_no=>null,
l_Mail_id	=>'prem@090.com',
Password=>null,
date_=>'10/apr/2025',
l_from_stn =>'Chennai Central',
l_to_stn =>'Madurai Junction',
l_seats => 5,
flag => 2);
end;

select * from tts_customer;

select * from tts_train;

select * from tts_history;

select * from user_sequences;
SQTRACID


select customer_id from tts_customer where mail_id = 'prem@090.com';

SELECT TRAIN_NO  FROM 
(select TRAIN_NO,from_stn ,rownum AS FORM_, to_stn ,rownum AS TO_ from tts_train ) WHERE FROM_STN = 'Chennai Central' AND TO_STN ='Madurai Junction' AND FORM_ = TO_;

select seats from tts_train where train_no = 12623;

select 5*fare from tts_train where train_no = 12623;



