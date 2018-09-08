A = LOAD './hw3' AS (line:chararray);
B = FOREACH A GENERATE REPLACE(line,'[^aAeEiIoOuU]+','');
C = FOREACH B GENERATE FLATTEN(TOKENIZE(LOWER((chararray)$0))) as words;
D = FOREACH C GENERATE FLATTEN(TOKENIZE(REPLACE(words,'','|'),'|')) as letter;
E = group D by letter;
F = FOREACH E GENERATE COUNT(D), group;
STORE F into 'hw3Bonus1output.txt';