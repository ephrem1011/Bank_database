create database bank_DB_project;
use bank_DB_project;
create table waiting_atm(
temp_atm_id char(19),
date_requested date,
primary key(temp_atm_id));

create table branch(
branchId char(5),
branch_address char(25),
number_of_employees int,
primary key(branchId));

create table customer_service_facilitator(
working_hr_perday int,
csfId char(15),
first_name char(15),
last_name char(15),
branchId char(5),
salary int,
foreign key(branchId) references branch(branchId),
primary key(csfId));

create table csf_phone(
phone_num char(10),
csfId char(15),
foreign key(csfId) references customer_service_facilitator(csfId),
primary key(csfId, phone_num));

create table customer(
temp_atm_id char(19),
csfId char(15),
accnum char(13),
first_name char(20),
last_name char(20),
foreign key(temp_atm_id) references waiting_atm(temp_atm_id),
foreign key(csfId) references customer_service_facilitator(csfId),
primary key(accnum));

create table customer_phone_number(
accnum char(13),
phone_num char(10),
foreign key(accnum) references customer(accnum),
primary key(accnum, phone_num));

create table branch_manager(
b_mgrId char(15),
branchId char(5),
first_name char(15),
last_name char(15),
working_hr_perday int,
salary int,
foreign key(branchId) references branch(branchId),
primary key(b_mgrId));

create table b_mgr_phone(
b_mgrId char(15),
phone_num char(10),
foreign key(b_mgrId) references branch_manager(b_mgrId),
primary key(b_mgrId, phone_num));

create table account(
accnum char(13),
acc_type_code char(16),
date_created date,
foreign key(accnum) references customer(accnum),
primary key(acc_type_code, accnum));

create table account_type(
acc_type_code char(16),
acc_type_name char(20),
interest_rate int,
foreign key(acc_type_code) references account(acc_type_code),
primary key(acc_type_code));

create table approved_loan(
loan_id char(15),
accnum char(13),
loan_amount int,
date_issued date,
payment_deadline date,
foreign key(accnum) references customer(accnum),
primary key(loan_id));

create table waiting_loan_request(
temp_loan_id char(15),
accnum char(13),
b_mgrId char(15),
app_date date,
date_requested date,
foreign key(b_mgrId) references branch_manager(b_mgrId),
foreign key(accnum) references customer(accnum),
primary key(temp_loan_id));

create table atm_card(
atm_id char(19),
accnum char(13),
date_issued date,
foreign key(accnum) references customer(accnum),
primary key(atm_id));
insert into waiting_atm values('22482', '2020-01-03');

insert into branch values('10256', 'Franco', 60);
insert into branch values('10445', 'Mebrat', 54);
insert into branch values('00087', 'Bole', 62);

insert into customer_service_facilitator values(10,'1278','Samuel', 'Belayneh', 7500);
insert into customer_service_facilitator values(10, '1547','Solomon', 'Daniel',   7500);
insert into customer_service_facilitator values(10,'4782', 'Seid', 'Ahmed',  7500);
insert into customer_service_facilitator values(10,'0125', 'Mohammed' , 'Ali',  7500);

insert into customer values('22482','1278','0018475126', 'Eliyas', 'Mebratu');
insert into customer values(null,'1547','0015796442', 'Birhanu', 'Abera');
insert into customer values(null,'4782','0021468842',  'Halu', 'Eyob');
insert into customer values(null,'0125','0046211515', 'Yodit', 'Adane');
insert into customer values(null,'0125','0040111515', 'Gemechu', 'Bekele');

insert into branch_manager values('14487', '10256', 'Tadele', 'Hailu', 10, 15000);
insert into branch_manager values('10057', '10445', 'Dagnachew', 'Girma', 10, 15000);
insert into branch_manager values('00487', '00087', 'Bayisa', 'Belete', 10, 11500);

insert into csf_phone values('0912121212', '1278');
insert into csf_phone values('0925141312', '1547');
insert into csf_phone values('0909090909', '4782');
insert into csf_phone values('0902154789', '0125');

insert into account values('0018475126', '01', '2020-01-01');
insert into account values('0015796442', '02', '2020-02-02');
insert into account values('0021468842', '03', '2020-01-03');
insert into account values('0046211515', '04', '2019-10-04');
insert into account values('0040111515', '05', '2019-10-04');

insert into account_type values('01', 'Regular', 1.3);
insert into account_type values('02', 'Women', 1.6);
insert into account_type values('03', 'Youth', 1.6);
insert into account_type values('04', 'Interest free', null);
insert into account_type values('05', 'Investment', 1.7);

insert into customer_phone_number values('0018475126', '0913131313');
insert into customer_phone_number values('0015796442', '0915151515');
insert into customer_phone_number values('0021468842', '0910333333');
insert into customer_phone_number values('0046211515', '0933454545');


insert into b_mgr_phone values('14487', '0910101010');
insert into b_mgr_phone values('10057', '0911101009');
insert into b_mgr_phone values('00487', '0945101214');






insert into approved_loan values('5555', '0018475126', 15000, '2020-05-01', '2022-05-01');
insert into approved_loan values('5099', '0046211515', 500000, '2020-10-10', '2025-10-10');

insert into waiting_loan_request values('1111','0015796442','14487', '2021-02-10', '2021-01-27');


insert into atm_card values('1001', '0018475126', '2020-01-25');

select * from customer;
select * from branch_manager;
select * from customer_service_facilitator;
select * from waiting_loan_request;
select * from approved_loan;

delete from approved_loan where loan_id='5555';
select * from approved_loan;

update waiting_loan_request set app_date='2021-02-12' where temp_loan_id='1111';
select * from waiting_loan_request;






