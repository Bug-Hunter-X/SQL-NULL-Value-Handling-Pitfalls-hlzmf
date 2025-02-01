In SQL, a common but subtle error involves incorrect handling of NULL values.  Consider a query with a WHERE clause comparing a column to a specific value. If the column contains NULL values, the comparison will always return false, even if you intend to treat NULL as a valid match. For instance, the following query will not return rows where 'col1' is NULL, even if 'val1' is NULL:

```sql
SELECT * FROM mytable WHERE col1 = val1;
```

This is because NULL represents an unknown value, and comparing an unknown value to anything (even another unknown value) is undefined and evaluates to false.  This is different from the expected behavior in many programming languages.

Another example in aggregate functions.  The `SUM()` function ignores NULLs, and `AVG()` ignores NULLs and reduces the count to reflect the non-null values.  However, `COUNT(*)` counts all rows regardless of NULLs, including NULLs, while `COUNT(column)` will only count non-NULL values in that particular column. This can lead to unexpected results when you're trying to calculate aggregate values and you have to be very careful in your SQL syntax to avoid issues.