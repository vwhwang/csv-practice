# CSV & Enumerables Practice

In this exercise you are asked to process a CSV file with crime data from Sacremento California in Juanuary 2006.  This exercise has two parts.  The first allowing you to practice reading in data from a CSV file, processing it and writing the results back to a file.  The second involves using Enumerable methods to manipulate the data from the file.

## Part 1:

In part one you are asked to create 3 methods and you will need to complete them in order:
-   `load_data(filename)` - This method takes a file name and returns the data from the file as an array of Hashes.
-   `total_crimes_per_district(crime_data)`  - This method takes the array of hashes read in from the file in `load_data` and returns a hash with the keys being the district names, and the values being the number of crimes commited in that district.
-   `save_crime_totals(filename, crime_totals)` - This method writes the crime total information returned from `total_crimes_per_district` to another CSV file provided by `filename`.

## Part 2:

In part 2 you will create methods to manipulate the data read in from the file.  You should think carefully and use an Enumerable method to help you complete the method.

-   `all_burglary_crimes(crime_data)` - This method returns an array of all crimes involving burglary.
-   `crimes_sorted_by_date(crime_data)`  - This method returns the list of crimes sorted by the date they were commited.  You may need to [convert the date from a string to a DateTime object](https://stackoverflow.com/questions/5380838/what-am-i-doing-wrong-with-datetime-strptime)
-    `district_with_most_crime(crime_data)` - This method returns the district with the highest number of crimes.
-    `district_with_least_crime(crime_data)` - This method returns the district with the fewest number of crimes.
-    `crime_coordinates(crime_data)` - This method returns an array of latitude and longitudinal coordinates in a format like `[[38.6272906,-121.5395774], [38.65994218,-121.5259008]]`

## Optionals

If you want additional practice consider:
- Writing tests for the methods in Part 2
- Writing the results of the methods from Part 2 to CSV files
