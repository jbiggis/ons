class Target < ActiveRecord::Base

belongs_to :hunter

attr_accessible :target_id, :name, :matched_at, :notified_at

#default_scope :order => 'targets.name'

validates :target_id, :presence => true
validates :hunter_id, :presence => true

end
