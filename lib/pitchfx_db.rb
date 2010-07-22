
require "rubygems"
require 'activerecord'
#require_gem "activerecord"


class PitchfxDb


  def self.init
    ActiveRecord::Base.establish_connection (
      :adapter => "mysql",
      :host => "localhost",
      :username => "root",
      :database => "pitchfx")
  end
  
  
end