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

def save_crime_totals(crime_totals)
  if array_of_hashes.length.zero?
    raise ArgumentError, 'Must have a nonempty array'
  end
  CSV.open('data/total_crimes.csv', 'w',
           write_headers: true,
           headers: crime_totals.keys) do |csv|
    csv << crime_totals
  end
end
