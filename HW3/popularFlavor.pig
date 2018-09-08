kids = LOAD 'kids.txt' USING PigStorage(' ') as (name:chararray,age:int);
purchases = LOAD 'purchases.txt' USING PigStorage(' ') as (name:chararray,flavor:chararray);
A = JOIN kids BY name, purchases BY name;
B = FILTER A BY (age<=12) AND (age>=10);
C = group B by flavor;
D = FOREACH C GENERATE COUNT(B) as count, group;
E = ORDER D BY count DESC;
F = limit E 1;
G = FILTER E BY (count==F.$0);

STORE G into 'hw3Bonus2output.txt'; 
