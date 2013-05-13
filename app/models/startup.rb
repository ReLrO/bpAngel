class Startup < ActiveRecord::Base
  
  attr_accessible :company_id, :status, :company_name, :company_url, :angellist_profile, :email
end
