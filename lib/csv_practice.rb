require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  data = CSV.read(filename, headers:true).map(&:to_h)
  data_modified = []
  data.each do |hash|
    data_modified << hash.slice("ID" ,"Name", "Height" ,"Team", "Year", "City" ,"Sport" ,"Event", "Medal")
  end 
  return data_modified
end



def total_medals_per_team(olympic_data)
  output = olympic_data.select {|person| person["Medal"] != "NA"}.group_by {|person| person["Team"]}.map {|key,value| {key => value.count}}
  output = output.inject(:merge)
  return output
end


def get_all_gold_medalists(olympic_data)
  output = olympic_data.select {|person| person["Medal"] == "Gold"}
end


# optional 