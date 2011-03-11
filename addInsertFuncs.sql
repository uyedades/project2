-- addInsertFuncs.sql - this script will make it easier to add Users
--and Suggestions
-- make sure that createTables.sql is run before this
-- create plpgsql language
drop language if exists plpgsql cascade;
create language plpgsql;
-- create function for adding User and returning id
--create or replace function insertUser(_name text, _username text,
--_password text, _div text, _dept text)
--returns integer as
--$func$
--begin
--execute 'insert into users (name,username,password,div,dept)' ||
--'values (' || quote_literal(_name) || ',' ||
--quote_literal(_username) || ',' || quote_literal(_password) || ',' || quote_literal(_div) || ',' || quote_literal(_dept) || ')';
--return currval('users_id_seq');
--end;
-- above is done
--$func$
--language 'plpgsql';
-- create function for adding suggestion and returning id
create or replace function insertSuggestion(_body text)
returns integer as
$func$
begin
execute 'insert into suggestion (body, created_at, updated_at) values ('
|| quote_literal(_body) || ',' || quote_literal(now()) || ','
|| quote_literal(now()) || ')';
return currval('suggestion_id_seq');
end;
-- above is done
$func$
language 'plpgsql';
-- create function for inserting into Users and Suggestion
create or replace function insertUserSuggestion(_uid integer,  _body text)
  returns boolean as
$func$
  declare
   sql1 text;
   sid integer;
 begin
-- above is done
  sql1 := 'select insertSuggestion(' || quote_literal (_body) || ')' ;
  execute sql1;
  sid := currval('suggestion_id_seq');
  execute 'insert into sugg_user (s_id, user_id) values ('
  || sid || ',' || _uid || ')';
  return 't';
 end;
$func$
language 'plpgsql';
-- create rule
create or replace rule user_suggestion as on insert to all_view
  do instead select insertUserSuggestion(new.userid, new.body);
