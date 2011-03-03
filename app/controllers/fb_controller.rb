class FbController < ApplicationController
  def callback

	logger.debug params.inspect
	
return
=begin
	@api_key = '195039077183959'
	@secret = 'b6214e708bc46f37877b560f09b8cd1d'

	# prepare the return data array
	#$data = array('content' => array());

	request = parse_signed_request($_REQUEST['signed_request'], secret);

	# parse signed data

	if request.nil?
  		#handle an unauthenticated request here
	end

	@payload = $request['credits']

	#retrieve all params passed in

	@func = $_REQUEST['method']
	@order_id = @payload['order_id']

	if @func == 'payments_status_update'
  		@status = @payload['status']

 		#write your logic here, determine the state you wanna move to
  		if @status == 'placed'
    			@next_state = 'settled'
    			@data['content']['status'] = @next_state
  		end
  
	#compose returning data array_change_key_case
  	@data['content']['order_id'] = @order_id;

	elsif @func == 'payments_get_items'
  		# remove escape characters  
  
		@order_info = stripcslashes(@payload['order_info'])
  		@item = json_decode(@order_info, true)
  		@item[:price] = @item[:price].to_i

  		# for url fields, if not prefixed by http://, prefix them
  		@url_key = array('product_url', 'image_url');  
  		foreach ($url_key as $key) {
    			if (substr($item[$key], 0, 7) != 'http://') {
       				$item[$key] = 'http://'.$item[$key];
    			}
  		}
   
  		# prefix test-mode
  		if (isset($payload['test_mode'])) {
  			  $update_keys = array('title', 'description');
    			foreach ($update_keys as $key) {
      				$item[$key] = '[Test Mode] '.$item[$key];
    			}
  		}

  		$data['content'] = array($item);
	end

# required by api_fetch_response()
@data['method'] = @func

# send data back
echo json_encode(@data);
=end
end

private

def parse_signed_request(signed_request, secret) 


 @encoded_sig, @payload = signed_request.split('.', 2)

   # decode the data
  @sig = base64_url_decode(encoded_sig);
  @data = json_decode(base64_url_decode(payload), true);

	if @data['algorithm'].upcase != 'HMAC-SHA256'
		logger.error 'Unknown algorithm. Expected HMAC-SHA256'
		return false
	end


	# check signature
  
	@expected_sig = hash_hmac('sha256', @payload, @secret, @raw = true);
  
	if @sig != @expected_sig 
    		logger.error 'Bad Signed JSON signature!'
    		return false
  	end

  return @data;


end

def base64_url_decode(input)
	return base64_decode(input.gsub('-_','+/')) 

end




end
