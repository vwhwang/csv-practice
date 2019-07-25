# CSV & Enumerables Practice

In this exercise you are asked to process a CSV file with Olympic Games data.  This exercise has two parts.  In the first part you will practice reading in data from a CSV file, processing it and writing the results back to a file.  The second involves using Enumerable methods to manipulate the data from the file.

## Part 1:

In part one you are asked to create 3 methods and you will need to complete them in order:

-   `load_data(filename)` - This method takes a file name and returns the data from the file as an array of Hashes.
-   `total_medals_per_country(olympic_data)`  - This method takes the array of hashes read in from the file in `load_data` and returns an array of hashes with each element having a country name (team), and number of medals that country (team) has won.

For example, you should return a hash that looks like this:

```ruby
[
    {"country"=>"Norway", "count"=>0}
    {"country"=>"Estonia", "count"=>0}
    {"country"=>"Spain", "count"=>0} 
    ...
]
```

-   `save_medal_totals(filename, medal_totals)` - This method writes the medal total information returned from `total_medals_per_country` to another CSV file provided by `filename`.

There are a number of tests written to verify the correctness of your methods and you can gain insight into the expected structure of the method return values by examining the spec file.

Note: For this exercise, use strings for hash keys (not symbols).

## Part 2:

In part 2 you will create methods to manipulate the data read in from the file.  You should think carefully and use an Enumerable method to help you complete the method.

-   `all_gold_medal_winners(olympic_data)` - This method returns an array the names of all Gold medal winners.  This method takes as input the data returned by the `load_data` method.
-   `medals_sorted_by_country(medal_totals)`  - This method takes a list of countries and their medal totals and returns the same list, sorted by country.  This method takes as input the result of the `total_medals_per_country` method.
-    `country_with_most_medals(medal_totals)` - This method returns the country with the highest number of medals.  This method takes as input the result of the `total_medals_per_country` method.
-    `athlete_height_in_inches(olympic_data)` - This method takes an array of hashes listing all the olympic data and returns a similar list, but with the athlete height in inches instead of centimeters.  This method takes as input the data returned by the `load_data` method.


## Optionals

If you want additional practice consider:
- Writing the results of the methods from Part 2 to CSV files
- Writing tests for the methods in Part 2, remember to check all edge-cases.
