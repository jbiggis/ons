require 'openssl'

class FbController < ApplicationController
  def callback

	logger.debug "debug"+params.inspect
	
	api_key = '195039077183959'
	secret = 'b6214e708bc46f37877b560f09b8cd1d'

	# prepare the return data array
	#$data = array('content' => array());
	data = Hash.new	

	# parse signed data
	request = parse_signed_request(params[:signed_request], secret);

	if request.nil?
  		#handle an unauthenticated request here
			logger.error "Unauthenticated Request!"
	end

	payload = request['credits']

	#retrieve all params passed in
	func = params[:method]
	order_id = payload['order_id']

	if func == 'payments_status_update'
		data["content"] = Hash.new
		status = payload['status']

 		#write your logic here, determine the state you wanna move to
		if status == 'placed'
			next_state = 'settled'
	 		data['content']['status'] = next_state
		end
  
	#compose returning data array_change_key_case
  	data['content']['order_id'] = order_id

	elsif func == 'payments_get_items'
  	# remove escape characters  
		order_info = payload['order_info'].tr("\\","")
  	##item = ActiveSupport::JSON.decode(@order_info)
		item = Product.find(order_info.to_i).attributes
  	##item.price = item.price.to_i

		# for url fields, if not prefixed by http://, prefix them
		#@url_key = array('product_url', 'image_url');  
		#foreach ($url_key as $key) {
  	#		if (substr($item[$key], 0, 7) != 'http://') {
    # 				$item[$key] = 'http://'.$item[$key];
  	#		}
		#}
		item["product_url"] = "http://ons.heroku.com"
		item["image_url"] = "http://"
   
  	# prefix test-mode
  	if payload['test_mode'] != nil
			#$update_keys = array('title', 'description');
			#foreach ($update_keys as $key) {
  		#		$item[$key] = '[Test Mode] '.$item[$key];
			#}
			item["title"] = "[Test Mode] " + item["title"]
			item["description"] = "[Test Mode] " + item["description"]
			
		end

		data["content"] = Array.new
		data['content'][0] = item
	end

# required by api_fetch_response()
data['method'] = func

# send data back
render :text => ActiveSupport::JSON.encode(data)

end

private

	def parse_signed_request(signed_request, secret) 

		encoded_sig, payload = signed_request.split('.', 2)

		 # decode the data
		sig = base64_url_decode(encoded_sig)
		data = ActiveSupport::JSON.decode(base64_url_decode(payload))

		if data['algorithm'].upcase != 'HMAC-SHA256'
			logger.error 'Unknown algorithm. Expected HMAC-SHA256'
			return nil
		end

		# check signature

		expected_sig = OpenSSL::HMAC.digest('sha256', secret, payload)

		if sig != expected_sig 
				logger.error 'Bad Signed JSON signature!'
				return nil
		end

		return data;

	end


	def base64_url_decode(input)
		input += '=' * (4 - str.length.modulo(4))
		return input.tr('-_','+/').unpack('m')[0] 
	end

end
