class Status < ActiveRecord::Base
	belongs_to :site
	
  attr_accessible :response_code, :site_id, :status
end
