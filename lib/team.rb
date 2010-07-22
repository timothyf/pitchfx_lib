class Team < ActiveRecord::Base
  
  has_many :home_games, :class_name => 'Game', :foreign_key => 'home_id'
  has_many :away_games, :class_name => 'Game', :foreign_key => 'away_id'
  has_many :players
  
  
  def full_name
    city + ' ' + name
  end
  
  
  # Returns both home and away games
  def all_games
    Game.find(:all, :conditions => "home_id='#{id}' or away_id='#{id}'")
  end
  
  
end


