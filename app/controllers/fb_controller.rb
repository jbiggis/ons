require 'openssl'

class FbController < ApplicationController


  def callback

		if params[:error_code]
			puts "DEBUG-ERROR: (FB Ctrl) " + params[:error_code] + " " + params[:error_message]
			redirect_to root_url(:anchor => 'play')
			return
		end

		if params[:signed_request].nil? && params[:status] == 'settled'
			redirect_to root_url(:anchor => 'play')
			return
		end

		# prepare the return data array
		#$data = array('content' => array());
		data = Hash.new	

		# parse signed data
		request = parse_signed_request(params[:signed_request], SECRET);

		if request.nil?
	  	#handle an unauthenticated request here
			render :text => "Error", :status => :unauthorized
			return
		end

		payload = request['credits']

		#retrieve all params passed in
		func = params[:method]
		order_id = payload['order_id']

		if func == 'payments_status_update'
			data["content"] = Hash.new
			status = payload['status']		
			order_details=ActiveSupport::JSON.decode(payload['order_details'])
			hunter = Hunter.find(order_details['buyer'].to_s) 
	 		
			#write your logic here, determine the state you wanna move to
			if status == 'placed'
				item = order_details['items'][0]

				unless hunter.orders.create!(:order_id => order_id.to_s, :product_id=>item['item_id'], :status => status)
					puts "DEBUG-ERROR create order:"+hunter.orders.inspect
					render :text => "Cannot create order", :status => :internal_server_error
					return
				end

				next_state = 'settled'
		 		data['content']['status'] = next_state
			end

			if status == 'settled'
				order = Order.find(order_id.to_s)

				unless order.update_attributes(:status => status)
					puts "DEBUG-ERROR update order:"+order.inspect
					render :text => "Cannot update order", :status => :internal_server_error
					return
				end		

				product = Product.find(order.product_id)	
				keys = hunter.keys 
				keys += product.keys_to_add
	
				unless hunter.update_attributes(:keys => keys)		
					puts "DEBUG-ERROR update hunter:"+hunter.inspect
					render :text => "Cannot update user", :status => :internal_server_error
					return
				end

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
	  		#	if (substr($item[$key], 0, 7) != 'http://') {
	     		#		$item[$key] = 'http://'.$item[$key];
	  		#	}
			#}
			item["product_url"] = "http://friends-with-benefits.me"
			item["image_url"] = "http://friends-with-benefits.me/images/fwb-icon.png"
   		item["item_id"] = order_info

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
			puts 'DEBUG-ERROR: Unknown algorithm: ' + data['algorithm']
			return nil
		end

		# check signature

		expected_sig = OpenSSL::HMAC.digest('sha256', secret, payload)

		if sig != expected_sig 
				puts 'DEBUG-ERROR: Bad Signed JSON signature!'
				return nil
		end

		return data;

	end


	def base64_url_decode(input)
		input += '=' * (4 - input.length.modulo(4))
		return input.tr('-_','+/').unpack('m')[0] 
	end

end
