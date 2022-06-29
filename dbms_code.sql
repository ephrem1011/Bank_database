create database assign

create table customer(
accnum char(13),
first_name char(20),
last_name char(20),
primary key(accnum));

create table customer_phone_number(
accunum char(13),
phone_num char(10),
foreign key(accunm) references customer(accunum),
primary key(accunum, phone_num));

create table branch(
branchId char(5),
branch address char(25),
number_of_employees int,
primary key(branchId));

create table branch_manager(
b_mgrId char(15),
branchId char(5),
first_name char(15),
last_name char(15),
working_hr_perday int,
salary int,
foreign key(branhId) references branch(branchId),
primary key(b_mgrId));

create table b_mgr_phone(
b_mgrId char(15),
phone_num char(10),
foreign key(b_mgrId) references branch_manager(b_mgrId),
primary key(b_mgrId, phone_num));

create table customer_service_facilitator(
csfId char(15),
first_name char(15),
last_name char(15),
working_hr_perday int,
salary int,
primary key(csfId));

create table csf_phone(
csfId char(15),
phone_num char(10),
foreign key(csfId) references customer_service_facilitator(csfId),
primary key(csfId, phone_num));

create table account(
accnum char(13),
acc_type_code char(16),
acc_type_name char(20),
interest_rate int,
foreign key(accnum) references customer(accnum),
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

create table waiting_atm(
temp_atm_id char(19),
date_requested date,
primary key(atm_id));

create table atm_card(
atm_id char(19),
accnum char(13),
date_issued date,
foreign key(accnum) references customer(accnum),
primary key(atm_id));



 

