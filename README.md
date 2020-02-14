# CSV & Enumerables Practice

In this exercise, follow the directions below.

The following files have been provided. Note their directory:

- `data/athlete_events.csv`. This is a CSV file that has the data of Olympians who participated in Olympic events.
- `test/csv_practice_test.rb`
- `lib/csv_practice.rb`

Part 1 focuses on reading tests, and creating methods that read from a CSV, and transform/calculate from it.

Part 2 focuses on reading tests, and implementing methods with Enumerable methods.

The optional wave focuses on writing tests, and implementing methods with Enumerable methods.

## Part 1: Reading from a CSV and Transforming the Data

### `get_all_olympic_athletes(filename)`

The tests in `test/csv_practice_test.rb` describe a method named `get_all_olympic_athletes(filename)`.

This method's responsibility is to:
  - take in a `filename` as a parameter. This should be a string, representing a relative path to a CSV file containing Olympic medalist data.
  - return an array of Olympic medalists that is described in a given file.
    - Each Olympic medalist (each element in the array) is a hash.
    - Each Olympic medalist hash should have only the following keys:
        - "ID"
        - "Name"
        - "Height"
        - "Team"
        - "Year"
        - "City"
        - "Sport"
        - "Event"
        - "Medal"

1. Before reading the test file, write down a description of 2 test cases that test the core functionality, and are nominal tests.
1. Read through the tests in `test/csv_practice_test.rb`.
    - How did we "Assert" and check that the method returns an array of hashes?
    - How did we "Assert" and check that the method returns an array of hashes with the correct keys?
    - How did we "Assert" and check that the method returns an accurate list of Olympic medalists?
    - What nominal tests did we miss?
1. Write down descriptions of 2 edge test cases that aren't in our tests. (Don't write the tests, just come up with your test cases for practice!)
1. TDD the implementation of `get_all_olympic_athletes(filename)` with the provided tests.
(In other words, given the tests have already been written for you, write the method to get all tests to pass.)

    `When calling CSV.read, consider what the relative path of the csv file from the file the code is in`
    
    `You will need to use the to_h syntax referenced [here](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/02-intermediate-ruby/csv-as-a-database.md#bonus-syntax-csvread-and-forcing-csvtable-to-be-an-array)`

### `total_medals_per_team(olympic_data)`

The tests in `test/csv_practice_test.rb` describe a method named `total_medals_per_team(olympic_data)`.

This method's responsibility is to:
  - take in an array of data of olympic athletes. Each element in the array should be a hash representing an Olympic athlete.
  - return a hash with the details of how many medals every team has achieved.
    - This hash should have a key for every team that has won at least one medal (the key is a string)
    - The value for each key should be an integer
    - A team has achieved a medal if their medal is not `"NA"`
  - This method SHOULD NOT be reading from a CSV file or writing to a CSV file

1. Write descriptions for 2 test cases that test the core functionality, and are nominal tests.
1. Read through the tests in `test/csv_practice_test.rb`.
    - In the tests, how do we "Arrange" and setup the data of all Olympic athletes?
    - How did we "Assert" and check that the method returns a hash?
    - How did we "Assert" and check that the method returns an accurate hash?
    - What nominal tests did we miss?
1. Write descriptions for 2 edge test cases that aren't in our tests. (Don't write the tests, just come up with your test cases for practice!)
1. TDD the implementation of `total_medals_per_team(olympic_data)` with the provided tests.

### Can `total_medals_per_team` Use Enumerable Methods?

If your `total_medals_per_team` method implementation does not use any of these methods, consider how you could refactor your code to use one of them. Discuss your strategy with a neighbor:

- `filter`
- `count`

No need to actually do the refactor right now.

## Part 2: Transforming, Filtering, or Mapping Data from a CSV

### `get_all_gold_medalists(olympic_data)`

The tests in `test/csv_practice_test.rb` describe a method named `get_all_gold_medalists(olympic_data)`.

This method's responsibility is to:
  - take in an array of data of olympic athletes. Each element in the array should be a hash representing an Olympic athletes.
  - return an array of hashes.
    - Each element in the array should be a hash that contains all of the Olympic medalist information (ID, Name, Team, etc.)
    - The array should only contain athletes who won a Gold medal, or when their `Medal` value is equal to `"Gold"`
  - This method SHOULD NOT be reading from a CSV file or writing to a CSV file

1. Write descriptions for 2 test cases that test the core functionality, and are nominal tests.
1. Read through the tests in `test/csv_practice_test.rb`.
    - In the tests, how do we "Arrange" and setup the data of all Olympic athletes?
    - How did we "Assert" and check that the method returns an array of hashes?
    - How did we "Assert" and check that the method returns an accurate list of only gold medalists?
    - What nominal tests did we miss?
1. Write descriptions for 2 edge test cases that aren't in our tests. (Don't write the tests, just come up with your test cases for practice!)
1. TDD the implementation of `get_all_gold_medalists(olympic_data)` with the provided tests.
1. If your working implementation did not use the method `filter`, refactor to use `filter` now.

## Optionals

Pick one of these methods:

1. `team_with_most_medals(medal_totals)`
    - This method takes in the result of the `total_medals_per_team` method.
    - This method returns a hash corresponding to the team (country) with the highest number of medals.
        - The hash should have two key-value pairs:
            1. A key "Team" with a value of the team (country)
            2. A key "Count" with a value of the number of medals
2. `athlete_height_in_inches(olympic_data)`
    - This method takes in the result of the `get_all_olympic_athletes` method.
    - This method returns a similar list, but for each athlete, their height should be in inches instead of centimeters.

Follow the following process for that method:

1. Come up with 2 test cases that test the core functionality, and are nominal tests.
1. Come up with 2 edge test cases.
1. TDD the implementation.
1. Refactor. If you didn't, consider how you could use `map` or `sort` in your solution.
