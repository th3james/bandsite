class Song < ActiveRecord::Base
  attr_accessible :name, :url
  validates_presence_of :name

end
