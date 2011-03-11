-- loadInitData.sql a script to load initial data
-- make sure addInsertFuncs.sql is run before this

-- add user records
insert  into users_view (name, username, password, div, dept) values ('Edward Cullen','Ecullen','sparkle','div1','div1');
insert  into users_view (name, username, password, div, dept) values ('Bella Swan','Bswan','biteme','div1','vamps');
insert  into users_view (name, username, password, div, dept) values ('Jacob Black','Jblack','muscles','div1','wolfs');
insert  into users_view (name, username, password, div, dept) values ('Hello Kitty','Hkitty','nerd','div2','div2');
insert  into users_view (name, username, password, div, dept) values ('Anderson Lau','Alau','andy','div2','geeks');
insert  into users_view (name, username, password, div, dept) values ('Charlie Sheen','Csheen','men','div2','freaks');

-- add suggestion records
select insertUserSuggestion(1, 'dont eat humans');
select insertUserSuggestion(2, 'become a vampire');
select insertUserSuggestion(3, 'win bellas love');
select insertUserSuggestion(4, 'win nobel prize');
select insertUserSuggestion(5, 'stop being a hermit');
select insertUserSuggestion(6, 'attend rehab');

