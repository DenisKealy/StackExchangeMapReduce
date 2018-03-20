data = LOAD 'hdfs://localhost:9000/user/vagrant/' USING PigStorage(',');

reduced_data = FOREACH data GENERATE (chararray) $0 as PostID, (int) $6 as Score,
	(chararray) $8 as Body, (chararray) $9 as UserID, (chararray) $10 as Username,
	(chararray) $14 as Title, (chararray) $15 as Tags;
	
STORE reduced_data INTO 'hdfs://localhost:9000/pig_output/' USING PigStorage (',');

