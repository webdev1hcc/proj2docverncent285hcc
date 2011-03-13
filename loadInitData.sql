-- loadInitData.sql 
-- load users 
insert into users_view (name,username,password,department, 
  division) values ('Sam','sam','sam','div2','div2'); 
insert into users_view (name,username,password,department, 
  division) values ('Andy','andy','andy','cent','div2'); 
insert into users_view (name,username,password,department, 
  division) values ('Bob','bob','bob','ca','div2'); 
insert into users_view (name,username,password,department, 
  division) values ('Bert','bert','bert','div1','div1'); 
insert into users_view (name,username,password,department, 
  division) values ('Joe','joe','joe','amt','div1'); 
insert into users_view (name,username,password,department, 
  division) values ('Alice','alice','alice','avit','div1'); 
  
-- load initial suggestion data 
select insertSuggestion(1,'Sam''s suggestion 1');
select insertSuggestion(2,'Andy''s suggestion 1');
select insertSuggestion(2,'Andy''s suggestion 2');
select insertSuggestion(3,'Bob''s suggestion 1');
select insertSuggestion(4,'Bert''s suggestion 1');
select insertSuggestion(5,'Joe''s suggestion 1');
select insertSuggestion(5,'Joe''s suggestion 2');
select insertSuggestion(6,'Alice''s suggestion 1');
select insertSuggestion(6,'Alice''s suggestion 2');
