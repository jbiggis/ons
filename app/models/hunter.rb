class Hunter < ActiveRecord::Base

set_primary_key :hunter_id

attr_accessible :hunter_id, :first_name, :last_name, :email, :gender, :DOB

has_many :targets, :dependent => :destroy


end
