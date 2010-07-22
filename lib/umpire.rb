class Umpire < ActiveRecord::Base

  #set_primary_key :ump_id
  
  has_many :games, :foreign_key => 'umpire_hp_id'
  
end
