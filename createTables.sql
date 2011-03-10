-- createTables.sql

-- create sequences

drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;
drop sequence if exists suggestion_id_seq cascade;
create sequence suggestion_id_seq;

-- create tables
drop table if exists users cascade;
create table users(
id integer not null primary key default nextval('user_id_seq'),
name text,
username text,
password text,
enc_pass text,
salt text,
div text,
dept text
);
drop table if exists suggestion cascade;
create table suggestion(
id integer not null primary key default nextval('suggestion_id_seq'),
body text,
created_at timestamp,
updated_at timestamp
);
drop table if exists sugg_user;
create table sugg_user(
s_id integer references suggestion(id),
user_id integer references users(id)
);

-- create view
drop view if exists all_view cascade;
create view all_view as 
    select users.id as userid,users.name,users.username, users.div,users.dept,suggestion.id as sid, suggestion.body,suggestion.created_at,suggestion.updated_at
from users
join sugg_user on users.id=sugg_user.user_id
join suggestion on sugg_user.s_id=suggestion.id;
