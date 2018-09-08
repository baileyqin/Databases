
/*To fix both the problems I would recreate the table columns.  Instead of having an arrival date and a departure date, 
I would have a column for every combination of days and rooms. (ex. one column for room A, 1/1/2016, one column for room 
A 1/2/2016, one column for room B 1/1/2016... etc.)  and I would put the constratraint that these columns must be unique
and can only be either NULL or have a value of "yes".  (by putting a check constraint that values in this column are in 
"yes" and putting the constraint that these columns are unique).  That way each slot which represents a particular day in 
a particular room can only be occupied by one guest at a time.
*/


