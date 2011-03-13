-- createTables.sql 
-- create sequences 
drop sequence if exists user_id_seq cascade; 
create sequence user_id_seq; 
drop sequence if exists suggestion_id_seq cascade; 
create sequence suggestion_id_seq; 

-- users table 
drop table if exists users cascade; 
create table users( 
  id integer not null primary key default nextval('user_id_seq'), 
  name text, 
  username text unique, 
  password text, 
  enc_pass text, 
  salt text, 
  department text, 
  division text 
); 

-- suggestions table 
drop table if exists suggestions cascade; 
create table suggestions( 
  id integer not null primary key default nextval('suggestion_id_seq'), 
  user_id integer references users(id), 
  suggestion_text text, 
  created_at timestamp, 
  modified_at timestamp 
); 

-- user_suggestions_view 
drop view if exists user_suggestions_view cascade; 
create view user_suggestions_view as 
  select users.id as usrid,users.name,users.username,users.department, 
    users.division,suggestions.id as suggid,
    suggestions.suggestion_text,suggestions.created_at,
    suggestions.modified_at from 
    users join suggestions on users.id=suggestions.user_id;

-- create function for inserting suggestion
drop language if exists plpgsql cascade;
create language plpgsql;
create or replace function insertSuggestion(_uid integer, _sugg text)
  returns integer as
  $func$
  begin
    execute 'insert into suggestions (user_id, suggestion_text, 
      created_at,modified_at) values (' || _uid || ',' ||
      quote_literal(_sugg) ||',now(),now())';
    return currval('suggestion_id_seq');
  end;
  $func$
  language 'plpgsql';
