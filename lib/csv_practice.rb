# csv_practice.rb
require 'csv'
require 'awesome_print'
require 'date'


def load_data(filename)
  data = []
  CSV.read(filename, headers: true).each do |line|
    data << line.to_h
  end

  return data
end

def total_medals_per_country(olympic_data)
  total_medals = {}
  olympic_data.each do |athlete|
    unless athlete['Medal'] == 'NA'
      if total_medals[athlete['Team']]
        total_medals[athlete['Team']] += 1
      else
        total_medals[athlete['Team']] = 1
      end
    end
  end

    return total_medals.map do |country, medals|
      {country: country, total_medals: medals}
    end
end

def save_medal_totals(filename, medal_totals)
  CSV.open(filename, 'w', :write_headers=> true, headers: medal_totals.first.keys) do |csv|
    medal_totals.each do |country_entry|
      csv << country_entry
    end
  end
end

# Part 2 - More Enumerable Practice

def all_gold_medal_winners(olympic_data)
  olympic_data.select do |entry|
    entry['Medal'] == 'Gold'
  end
end

def medals_sorted_by_country(medal_totals)
  medal_totals.sort_by do |entry|
    entry[:country]
  end
end

def country_with_most_medals(medal_totals)
  medal_totals.max_by do |entry|
    entry[:total_medals]
  end
end

def athlete_height_in_inches(olympic_data)
  olympic_data.map do |entry|
    entry = entry.clone
    entry['Height'] = entry['Height'].to_f / 2.5
    entry
  end
end
