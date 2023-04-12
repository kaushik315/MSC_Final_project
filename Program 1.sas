/* Importing File */

FILENAME REFFILE '/home/u57888155/my_shared_file_links/u57888155/project/data.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.project;
	GETNAMES=NO;
	DATAROW=2;
RUN;

PROC CONTENTS DATA=WORK.project; RUN;

/* Cleaning the data */

PROC SQL;
DELETE FROM work.projectt
WHERE var3="Prefer"
;
QUIT;

data work.project;
    set work.project;
    if var3 = "Prefer" then delete;
run;

proc format;
   picture pctfmt (round) 0-high ='000%';
run;

/* One */

/* Do you pay attention to online advertisements? */

proc freq
data = work.project;
tables var4/ out=work.projectobs ;
run;

/* Graph */  
title1 h=15pt 'Do you pay attention to online advertisements' ;      
proc sgplot data = work.projectobs;                                                                                                                     
   vbar  var4/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Attitude'; 
   format percent pctfmt.;
run; 
quit;

/*Have the respondents bought a product after viewing an online advertisements */

proc freq
data = work.project;
tables var5 / out=work.projectpref ;
run;

proc freq
data = work.project;
tables var3*var5 / out=work.projectbuy ;
run;

proc freq
data = work.project;
tables var3*var5 / chisq Expected ;
run;


/* Graph */  
title1 h=15pt 'Have respondents bought products with the influence of digital advertisements' ;      
proc sgplot data = work.projectbuy;                                                                                                                     
   vbar  count/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Female No: 22, Female Yes: 31, Male No: 12, Male Yes: 43'; 
   format percent pctfmt.;
run; 
quit;


/*Impact of online advertisements on the respondents */

proc freq
data = work.project;
tables var3*var15 / chisq Expected out= work.projectimpact;
run;

/* Graph */  
title1 h=15pt 'Impact Of Digital advertisements on respondents' ;      
proc sgplot data = work.projectimpact;                                                                                                                     
   vbar  count/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Female Negative: 31, Female Positive: 22, Male Negative: 17, Male Positive: 38'; 
   format percent pctfmt.;
run; 
quit;

/* Two */

/* What type of advertisements would you be tempted to click? */ 

proc freq data=work.project ORDER= FREQ;
   tables var7/out=work.projecttype;
run;

/* Graph */  
title1 h=15pt 'What type of advertisements would you be tempted to click' ;      
proc sgplot data = work.projecttype;                                                                                                                     
   vbar  var7/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Type'; 
   format percent pctfmt.;
run; 
quit;

/* Which Type of Ads influence the respondents the most */

proc freq data=work.project ORDER= FREQ;
   tables var12/out=work.projectpersonal;
run;

/* Graph */  
title1 h=15pt 'Which Type of Ads influence the respondents the most' ;      
proc sgplot data = work.projectpersonal;                                                                                                                     
   vbar  var12/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Type of Ads'; 
   format percent pctfmt.;
run; 
quit;

/* Three */

/* What do you think are the advantages of online advertisements */

proc freq data=work.project ORDER= FREQ;
   tables var13/out=work.projectadv;
  
run;

/* Graph */  
title1 h=15pt 'What respondents think are the advantages of online advertisements' ;      
proc sgplot data = work.projectadv;                                                                                                                     
   vbar  var13/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Advantages'; 
   format percent pctfmt.;
run; 
quit;

/* What do you think are the disadvantages of online advertisements */

proc freq data=work.project ORDER= FREQ;
   tables var14/out=work.projectdis;
  
run;

/* Graph */  
title1 h=15pt 'What respondents think are the disadvantages of online advertisements' ;      
proc sgplot data = work.projectdis;                                                                                                                     
   vbar  var14/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Disadvantages'; 
   format percent pctfmt.;
run; 
quit;


/* Four */

/* What do you think is the most important to draw your attention towards an online advertisement? */

proc freq data=work.project ORDER= FREQ;
   tables var16/out=work.projectsta;
  
run;

/* Graph */  
title1 h=15pt 'Different advertising that the respondents have noticed' ;      
proc sgplot data = work.projectsta;                                                                                                                     
   vbar  var16/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Strategies'; 
   format percent pctfmt.;
run; 
quit;

/* What type of advertisements would you be tempted to click? */ 
 
title1 h=15pt 'What type of advertisements would you be tempted to click' ;      
proc sgplot data = work.projecttype;                                                                                                                     
   vbar  var7/ response=percent datalabel;      
   yaxis label='% of Responses';                                                                                                                       
   xaxis label='Type'; 
   format percent pctfmt.;
run; 
quit;
