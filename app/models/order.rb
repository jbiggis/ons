class Order < ActiveRecord::Base

set_primary_key :order_id

belongs_to :hunter
belongs_to :product

attr_accessible :order_id, :product_id, :status, :message, :refund_funding_source, :refund_reason
end
