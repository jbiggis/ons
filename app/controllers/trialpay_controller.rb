class TrialpayController < ApplicationController

def process

puts params.inspect
trialpay_order_id = params[:oid]
sid = params[:sid]

render :text => '1'

end

private

def validation

end

end
