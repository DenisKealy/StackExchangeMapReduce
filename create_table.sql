CREATE EXTERNAL TABLE IF NOT EXISTS Posts(
        PostID STRING, 
        Score INT,
        Body STRING,
        UserID STRING,
        Username STRING,
        Title STRING,
        Title STRING,
        Tags STRING)
    COMMENT 'Top 200 Posts by viewcount from SE'
    ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','
    STORED AS TEXTFILE
    location 'hdfs://localhost:9000/pig_output';


