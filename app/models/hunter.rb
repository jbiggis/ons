class Hunter < ActiveRecord::Base

set_primary_key :hunter_id

attr_accessible :hunter_id, :first_name, :last_name, :email, :gender, :DOB, :credits_left, :total_credits, :access_token

has_many :targets, :dependent => :destroy
has_many :orders, :dependent => :destroy


end
