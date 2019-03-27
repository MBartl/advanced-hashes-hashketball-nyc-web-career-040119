#main hash
def game_hash
  game_hash = 
  {
    :home => 
    {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => 
      {
        :"Alan Anderson" => 
        {
          :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
        },
        
        :"Reggie Evans" => 
        {
          :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
        },
        
        :"Brook Lopez" => 
        {
          :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
        },
        
        :"Mason Plumlee" => 
        {
          :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
        },
        
        :"Jason Terry" => 
        {
          :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
        }
      }
    },
    
    :away => 
    {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => 
      {
        :"Jeff Adrien" => 
        {
          :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2
        },
        
        :"Bismak Biyombo" => 
        {
          :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10
        },
        
        :"DeSagna Diop" => 
        {
          :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5
        },
        
        :"Ben Gordon" => 
        {
          :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0
        },
        
        :"Brendan Haywood" => 
        {
          :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12
        }
      }
    }
  }
  
  return game_hash
end

#Returns a specific player
def find_a_player(player)
  game_hash.map do |location, team_data|
    return team_data[:players]
    team_data[:players].select {|name| name.to_s == player}
  end
end

find_a_player("Brendan Haywood")

def find_player(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name.to_s == player
        return stats
      end
    end
  end
end

#Returns all players
def all_players
  output = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      output << player
    end
  end
  return output
end


#Method No. 1: Number of Points Scored by Player
def num_points_scored(player)
  return find_player(player)[:points]
end



#Method No. 2: Player Shoe Size
def shoe_size(player)
  return find_player(player)[:shoe]
end



#Method No. 3: Colors of One Team
def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name].to_s == team
      return team_data[:colors]
    end
  end
end



#Method No. 4: Both Team Names
def team_names
  names = []
  game_hash.each do |location, team_data|
    names.push(team_data[:team_name])
  end
  return names
end



#Method No. 5: Team's Jersey Numbers
def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name].to_s == team
      team_data[:players].each do |name, stats|
        jersey_numbers.push(stats[:number])
      end
    end
  end
  return jersey_numbers
end



#Method No. 6: Player's Stat Hash
def player_stats(player)
  return find_player(player)
end



#Method No. 7: Rebounds by Player with Largest Shoe Size
def big_shoe_rebounds
  
  #Initialize two variables to compare shoe sizes and retain player name later on
  biggest_shoe = 0
  player = ''
  
  
  #Step 1: find player with biggest shoe
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if biggest_shoe == 0
        biggest_shoe = stats[:shoe]
        player = name
      elsif stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        player = name
      end
    end
  end
  
  
  #Step 2: return player's rebounds
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name == player
        return stats[:rebounds]
      end
    end
  end
end



#Bonus No. 1:
def most_points_scored
  most_points = 0
  player = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if most_points < stats[:points]
        most_points = stats[:points]
        player = name
      end
    end
  end
  return player.to_s
end


#Bonus No. 2:
def winning_team
  brooklyn_nets_score = 0
  away_team_score = 0
  away_team_name = ''
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team_data[:players].each do |name, stats|
        brooklyn_nets_score += stats[:points]
      end
    else
      away_team_name = game_hash[:away][:team_name].to_s
      team_data[:players].each do |name, stats|
        away_team_score += stats[:points]
      end
    end
  end
  if brooklyn_nets_score > away_team_score
    return "Brooklyn Nets"
  elsif brooklyn_nets_score == away_team_score
    return "Tie Game"
  else
    return away_team_name
  end
end


#Bonus No. 3:
def player_with_longest_name
  longest_name = ''
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      if longest_name == ''
        longest_name = player.to_s
      elsif longest_name.length < player.to_s.length
        longest_name = player.to_s
      end
    end
  end
  return longest_name
end



#Super Bonus:
def long_name_steals_a_ton?
  #First I set how many steals the longest named player had
  player_with_longest_name
  steals_by_longest_name = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      if player.to_s == player_with_longest_name
        steals_by_longest_name = data[:steals]
      end
    end
  end
  #Next I compare it to every other player
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      if player.to_s != player_with_longest_name
        if steals_by_longest_name < (data[:steals])
          return false
        end
      end
    end
  end
  return true
end





