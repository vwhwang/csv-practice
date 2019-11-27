
require_relative "lib/csv_practice.rb"

filename = "data/athlete_events.csv"
olympic_data = load_data(filename)
medal_totals = total_medals_per_country(olympic_data)
puts medal_totals
save_medal_totals("medal_totals.csv", medal_totals)
ap athlete_height_in_inches(olympic_data)