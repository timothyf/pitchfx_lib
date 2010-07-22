class Pitch < ActiveRecord::Base
  
  #set_primary_key :pitch_id
  #set_inheritance_column :_type_disabled
  
  belongs_to :atbat #, :foreign_key => 'ab_id'
  
  
  def pitcher
    Player.find_by_gameday_id(atbat.pitcher_id) 
  end
  
  
end
