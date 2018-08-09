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
  crime_data.sort_by do |crime|
    DateTime.strptime(crime['cdatetime'], '%m/%d/%Y %H:%M')
  end
end

def district_with_most_crime(crime_data)
  totals = total_crimes_per_district(crime_data)
  return totals.keys.max_by do |key|
    totals[key].to_i
  end
end

def district_with_least_crime(crime_data)
  totals = total_crimes_per_district(crime_data)
  return totals.keys.min_by do |key|
    totals[key].to_i
  end
end

def crime_coordinates(crime_data)
  crime_data.map do |crime|
    [crime['latitude'], crime['longitude']]
  end
end
