To correctly handle NULL values, use the `IS NULL` or `IS NOT NULL` operators.  For instance, to find rows where 'col1' is either equal to 'val1' or is NULL, you should use the following query:

```sql
SELECT * FROM mytable WHERE col1 = val1 OR col1 IS NULL;
```

Alternatively, you can use the `COALESCE` function to replace NULLs with a specific value before comparison:

```sql
SELECT * FROM mytable WHERE COALESCE(col1, 'some_value') = val1;
```

When working with aggregate functions, always be mindful of the function's treatment of NULLs. Use `COUNT(*)` to count all rows, including rows where columns contain NULLs.  If you only want to count rows with non-NULL values in a particular column, use `COUNT(column)`. Handle NULLs accordingly within your SQL queries to get accurate results. For example, using `SUM(COALESCE(column,0))` rather than `SUM(column)` will avoid unexpected results when the column contains NULL values.