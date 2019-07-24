# csv_practice.rb

# irb -r ./csv_practice.rb

require 'csv'
require 'awesome_print'

# turn array of hashes into csv
# class Array
#     def to_csv(csv_filename="hash.csv")
#       require 'csv'
#       CSV.open(csv_filename, "wb") do |csv|
#         csv << first.keys # adds the attributes name on the first line
#         self.each do |hash|
#           csv << hash.values
#         end
#     end
# end

# Part 1 - CSV Practice
def load_data(filename)
    data = CSV.read(filename, headers: true).map(&:to_h)
    return data
end

def total_medals_per_country(olympic_data)
    country_medal = []
    medal_count = {}
    olympic_data.each do |player|
        country = player["Team"]
        #  team has been seen already # maybe increment count
        if medal_count[country] != nil && player["Medal"] != "NA"
            medal_count[country] += 1
        # add country and maybe increment medal count
        elsif medal_count[country] == nil && player["Medal"] != "NA"
            medal_count[country] = 1
        elsif medal_count[country] == nil && player["Medal"] == "NA"
            medal_count[country] = 0
        end 
    end
        
    medal_count.each do |key, value|
        country_medal << {"country" => key, "count"=>value}
    end
    return country_medal
end

def save_medal_totals(filename, medal_totals)
    CSV.open(filename, 'w') do |csv|
        csv << medal_totals[0].keys
        medal_totals.each do |hash|
            csv << hash.values
        end
    end
end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)

end

def metals_sorted_by_country(metal_totals)

end

def country_with_most_metals(metal_totals)

end

def athlete_height_in_inches(olympic_data)
    new_data = []
    olympic_data.each do |player|
        new_player = player.clone
        new_data << new_player
        new_player["Height"] = player["Height"].to_f/2.5
    end
    return new_data
end