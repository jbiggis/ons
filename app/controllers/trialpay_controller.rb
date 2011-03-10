require 'md5'

class TrialpayController < ApplicationController

def proc

puts params.inspect
puts request.headers.inspect
	trialpay_order_id = params[:oid]
	sid = params[:sid]

	validation

	render :text => 'there is an error'#'1'
	return

end

private

def validation

	expected_sig = request.headers[:HTTP_TRIALPAY_HMAC_MD5]
puts "EXPECTED: "+expected_sig
puts "QUERY: "+ request.headers[:QUERY_STRING]

	sig = MD5.new(request.headers[:QUERY_STRING]	+ KEY)

	(expected_sig == sig)? return true : return false

end

KEY = 'd74e1bef86'

end

