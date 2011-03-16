require 'openssl'

class TrialpayController < ApplicationController

def proc

	if !validation
		render :text => "Unauthorized", status => :unauthorized
		return
	end

	trialpay_order_id = params[:oid]
	sid = params[:sid]
	## Check other stuff here


	render :text => '1'
	return

end

private

def validation

	expected_sig = request.headers['HTTP_TRIALPAY_HMAC_MD5']

	sig = OpenSSL::HMAC.hexdigest('md5', KEY, request.headers['QUERY_STRING'])

	if expected_sig == sig 
		return true 
	else
		return false
	end

end

KEY = 'd74e1bef86'

end

