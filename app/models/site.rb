class Site < ActiveRecord::Base
	has_many :statuses
	
  attr_accessible :active, :name, :url
end
