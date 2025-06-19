create database cms;

use cms;

create table users (
                       user_id int auto_increment primary key,
                       username varchar(50) not null unique,
                       password varchar(255) not null,
                       role enum('Employee', 'Admin') not null,
                       created_at timestamp default current_timestamp
);

INSERT INTO users (username, password, role, created_at)
VALUES ('admin', '1234', 'Admin', CURRENT_TIMESTAMP);

create table complaints (
                            complaint_id int auto_increment primary key,
                            title varchar(255) not null,
                            description text not null,
                            status enum('Submitted', 'In Progress', 'Resolved') default 'Submitted',
                            remarks text,
                            submitted_by_user_id int not null,
                            created_at timestamp default current_timestamp,
                            updated_at timestamp default current_timestamp on update current_timestamp,
                            constraint fk_complaints_users foreign key (submitted_by_user_id)
                                references users(user_id) on delete cascade
);

