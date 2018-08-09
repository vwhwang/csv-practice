# csv_practice.rb
require 'csv'
require 'awesome_print'


def load_data(filename)
  data = []
  CSV.read(filename, headers: true).each do |line|
    data << line.to_h
  end

  return data
end

def total_crimes_per_district(data)
  totals = {}

  data.each do |entry|
    if totals[entry['district']]
      totals[entry['district']] += 1
    else
      totals[entry['district']] = 1
    end
  end
  return totals
end

def save_crime_totals(filename, crime_totals)
  CSV.open(filename, 'w',
           write_headers: true,
           headers: crime_totals.keys) do |csv|
    csv << crime_totals
  end
end


# Part 2 - More Enumerable Practice

def all_burglary_crimes(crime_data)
  return crime_data.select do |crime|
    crime['crimedescr'].downcase.include? 'burglary'
  end
end

def crimes_sorted_by_date(crime_data)

end

def district_with_most_crime(crime_data)

end

def district_with_least_crime(crime_data)

end

def crime_coordinates(crime_data)

end
