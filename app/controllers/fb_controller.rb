require 'openssl'

class FbController < ApplicationController

def test

#{"order_info"=>"1", "signed_request"=>"C_ZKmqzBpI6T-lkMiNcLJGxVC9EKep-dx9Z9q1ky6UA.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNyZWRpdHMiOnsiYnV5ZXIiOjI4MTE4ODYzLCJyZWNlaXZlciI6MjgxMTg4NjMsIm9yZGVyX2lkIjoxNzUwMjk5MDU4NzYzNTIsIm9yZGVyX2luZm8iOiIxIiwidGVzdF9tb2RlIjoxfSwiZXhwaXJlcyI6MTI5OTE1MDAwMCwiaXNzdWVkX2F0IjoxMjk5MTQzNDU1LCJvYXV0aF90b2tlbiI6IjE5NTAzOTA3NzE4Mzk1OXwyLmk4N0M2Yk9acWY0V0toQUpySGg4clFfXy4zNjAwLjEyOTkxNTAwMDAtMjgxMTg4NjN8NTJYcWV6dXYtVldrR051OEtYU05CWVFLYWEwIiwidXNlciI6eyJjb3VudHJ5IjoiaGsiLCJsb2NhbGUiOiJlbl9VUyIsImFnZSI6eyJtaW4iOjIxfX0sInVzZXJfaWQiOiIyODExODg2MyJ9", "method"=>"payments_get_items", "order_id"=>"175029905876352", "buyer"=>"28118863", "test_mode"=>"1", "receiver"=>"28118863"}


	redirect_to fb_callback_url("order_info"=>"1", "signed_request"=>"C_ZKmqzBpI6T-lkMiNcLJGxVC9EKep-dx9Z9q1ky6UA.eyJhbGdvcml0aG0iOiJITUFDLVNIQTI1NiIsImNyZWRpdHMiOnsiYnV5ZXIiOjI4MTE4ODYzLCJyZWNlaXZlciI6MjgxMTg4NjMsIm9yZGVyX2lkIjoxNzUwMjk5MDU4NzYzNTIsIm9yZGVyX2luZm8iOiIxIiwidGVzdF9tb2RlIjoxfSwiZXhwaXJlcyI6MTI5OTE1MDAwMCwiaXNzdWVkX2F0IjoxMjk5MTQzNDU1LCJvYXV0aF90b2tlbiI6IjE5NTAzOTA3NzE4Mzk1OXwyLmk4N0M2Yk9acWY0V0toQUpySGg4clFfXy4zNjAwLjEyOTkxNTAwMDAtMjgxMTg4NjN8NTJYcWV6dXYtVldrR051OEtYU05CWVFLYWEwIiwidXNlciI6eyJjb3VudHJ5IjoiaGsiLCJsb2NhbGUiOiJlbl9VUyIsImFnZSI6eyJtaW4iOjIxfX0sInVzZXJfaWQiOiIyODExODg2MyJ9", "method"=>"payments_get_items", "order_id"=>"175029905876352", "buyer"=>"28118863", "test_mode"=>"1", "receiver"=>"28118863")


end

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
puts "DEBUG-func:"+func
puts "DEBUG-orderid:"+order_id.to_s
puts "DEBUG-payload"+payload.inspect

	if func == 'payments_status_update'
		data["content"] = Hash.new
		status = payload['status']
puts "DEBUG-payload[order_details]:"+payload['order_details']		
		order_details=ActiveSupport::JSON.decode(payload['order_details'])
puts "DEBUG-order_details:"+order_details.inspect
 		
		#write your logic here, determine the state you wanna move to
		if status == 'placed'

puts "DEBUG-order_details['items']:"+order_details['items'].inspect
			item = order_details['items'][0]
puts "DEBUG-order_details['items'][0]:"+order_details['items'][0].inspect


			hunter = Hunter.find(order_details['buyer'].to_i) 
			hunter.orders.create!(:order_id => order_details['order_id'], :product_id=>item['item_id'], :status => status)

			next_state = 'settled'
	 		data['content']['status'] = next_state
		end

		if status == 'settled'
			order = Order.find(order_details['order_id'])
			order.update_attributes(:status => 'settled')
			
			product = Product.find(order.product_id)	
			credits = hunter.credits_left 
			credits += product.credits_to_add
			hunter.update_attributes(:credits_left => credits)		
		
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
   		item["item_id"] = payload['order_info']

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
		input += '=' * (4 - input.length.modulo(4))
		return input.tr('-_','+/').unpack('m')[0] 
	end

end
