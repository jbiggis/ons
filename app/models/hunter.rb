class Hunter < ActiveRecord::Base

set_primary_key :hunter_id

has_many :targets, :dependent => :destroy


end
