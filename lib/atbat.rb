class Atbat < ActiveRecord::Base
  
  belongs_to :game
  belongs_to :batter, :class_name => 'Player', :primary_key => 'gameday_id', :foreign_key => 'batter_id'
  belongs_to :pitcher, :class_name => 'Player', :primary_key => 'gameday_id', :foreign_key => 'pitcher_id'
  
  has_many :pitches #, :foreign_key => 'ab_id'
  
  
end
