def get_first_name_of_season_winner(data, season)
  contestants = data.fetch(season)
  contestants.find do |contestant|
    contestant.fetch("status") == "Winner"
  end.fetch("name").split(" ").first
end

def get_contestant_name(data, occupation)
  contestants = get_contestants(data)
  contestants.find do |contestant|
    contestant.fetch("occupation") == occupation
  end.fetch("name")
end

def count_contestants_by_hometown(data, hometown)
  contestants = get_contestants(data)
  counter = 0
  contestants.each do |contestant|
    if contestant.fetch("hometown") == hometown
      counter += 1
    end
  end
  counter
end

def get_occupation(data, hometown)
  contestants = get_contestants(data)
  contestants.find do |contestant|
    contestant.fetch("hometown") == hometown
  end.fetch("occupation")
end

def get_average_age_for_season(data, season)
  contestants = data.fetch(season)
  total_age = 0
  counter = 0

  contestants.each do |contestant|
    total_age += contestant.fetch("age").to_f
    counter += 1
  end

  (total_age / counter).round
end

# ----- helper method -----
def get_contestants(data)
  data.collect do |season_key, season_data|
    season_data
  end.flatten
end
