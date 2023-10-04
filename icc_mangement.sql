CREATE DATABASE ICC_management_system;

USE ICC_management_system;


-- icc_admin table

CREATE TABLE icc_admin(
	member_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    title VARCHAR(30) NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (member_id)
    );
-- SELECT * FROM icc_admin;

-- country_team table

CREATE TABLE country_team(
	team_id INT NOT NULL,
    team_name VARCHAR(20) NOT NULL,
    board VARCHAR(10) NOT NULL,
    admitted_year INT NOT NULL,
    approved_by INT NOT NULL,
    PRIMARY KEY (team_id),
    FOREIGN KEY (approved_by) REFERENCES icc_admin(member_id)
    );
    
-- tournament table

CREATE TABLE tournament(
	tournament_id INT NOT NULL,
    format VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    hosts VARCHAR(20) NOT NULL,
    organized_by INT NOT NULL,
    PRIMARY KEY (tournament_id),
    FOREIGN KEY (organized_by) REFERENCES icc_admin(member_id)
); 

-- create table player
CREATE TABLE player(
	player_id INT NOT NULL,
    player_name VARCHAR(30) NOT NULL,
    role VARCHAR(20) NOT NULL,
    team_id INT NOT NULL,
    PRIMARY KEY (player_id),
    FOREIGN KEY (team_id) REFERENCES country_team(team_id)
);

-- create award table

CREATE TABLE award(
	award_name VARCHAR(30) NOT NULL,
    award_year INT NOT NULL,
    player_id INT NOT NULL,
    member_id INT NOT NULL,
    PRIMARY KEY (award_name,award_year),
    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (member_id) REFERENCES icc_admin(member_id)
);  

-- create table match

CREATE TABLE match_d(
 match_id INT NOT NULL,
 played_date DATE,
 venue VARCHAR(30) NOT NULL,
 PRIMARY KEY (match_id)

);

CREATE TABLE teamA(
	match_id INT NOT NULL,
    team_id INT NOT NULL,
    score INT NOT NULL,
    result VARCHAR(10) NOT NULL,
    PRIMARY KEY (match_id, team_id),
    FOREIGN KEY (match_id) REFERENCES match_d(match_id),
    FOREIGN KEY (team_id) REFERENCES country_team(team_id)
    
    );
    
CREATE TABLE teamB(
	match_id INT NOT NULL,
    team_id INT NOT NULL,
    score INT NOT NULL,
    result VARCHAR(10) NOT NULL,
    PRIMARY KEY (match_id, team_id),
    FOREIGN KEY (match_id) REFERENCES match_d(match_id),
    FOREIGN KEY (team_id) REFERENCES country_team(team_id)
    
    ); 
    
-- match stastics 

CREATE TABLE match_stats(
	player_id INT NOT NULL,
    match_id INT NOT NULL,
    run_scored INT NOT NULL,
    wickets_taken INT NOT NULL,
    PRIMARY KEY (player_id,match_id),
    FOREIGN KEY (player_id) REFERENCES player(player_id),
    FOREIGN KEY (match_id) REFERENCES match_d(match_id)
	

); 

-- Player_stats

CREATE TABLE player_stats(
	player_id INT NOT NULL,
    matches INT NOT NULL,
    runs INT NOT NULL,
    average DECIMAL(4,2),
    strike_rate DECIMAL(5,2),
    hundreds INT NOT NULL,
    highest INT NOT NULL,
    wickets INT NOT NULL,
    economy INT NOT NULL,
    points INT NOT NULL,
    icc_rank INT NOT NULL,
    PRIMARY KEY (player_id),
    FOREIGN KEY (player_id) REFERENCES player(player_id)

); 



  
  



 