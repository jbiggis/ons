class TrialpayController < ApplicationController

def proc

puts params.inspect
puts request.headers.inspect
	trialpay_order_id = params[:oid]
	sid = params[:sid]

	render :text => '1'
	return

end

private

def validation

	return

end

end

=begin
#<ActionDispatch::Request:0x2b26eeab0870 @request_method="GET", @filtered_parameters={"action"=>"proc", "controller"=>"trialpay"}, @fullpath="/trialpay", @env={"action_dispatch.request.formats"=>[#<Mime::Type:0x2b26ed06af38 @string="text/html", @synonyms=["application/xhtml+xml"], @symbol=:html>], "action_dispatch.request.parameters"=>{"action"=>"proc", "controller"=>"trialpay"}, "rack.session"=>{"_csrf_token"=>"V1Dx8ZRpH/CQiHjhVgNffgX+simJGZekKpDaJxvxSjA=", "session_id"=>"ccfbd4acaed2f5315126a4b72bc5eefa"}, "HTTP_X_REQUEST_START"=>"1299740059744", "HTTP_ACCEPT"=>"application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5", "HTTP_HOST"=>"friends-with-benefits.me", "SERVER_NAME"=>"friends-with-benefits.me", "rack.request.cookie_hash"=>{"__utma"=>"219898062.438429746.1299679227.1299726781.1299734314.4", "__utmc"=>"219898062", "_ons_session"=>"BAh7ByIQX2NzcmZfdG9rZW4iMVYxRHg4WlJwSC9DUWlIamhWZ05mZmdYK3NpbUpHWmVrS3BEYUp4dnhTakE9Ig9zZXNzaW9uX2lkIiVjY2ZiZDRhY2FlZDJmNTMxNTEyNmE0YjcyYm
2011-03-09T22:54:20-08:00 app[web.1]: M1ZWVmYQ==--25d94a341d32c0c06343e28bfc8cc7a9b6422f6a", "__utmz"=>"219898062.1299692790.2.2.utmcsr=facebook.com|utmccn=(referral)|utmcmd=referral|utmcct=/l.php", "fbs_202763786417566"=>"\"access_token=202763786417566|cc21faa3022c65ddcd8f80bf-100001338729306|mevH0D6vcHqALVdP0Sp4kIphEuA&expires=0&secret=c31787815dc13dd97fc48c7e737d3bf1&session_key=cc21faa3022c65ddcd8f80bf-100001338729306&sig=b821d8ae5be29ba0f01bf9476da39502&uid=100001338729306\""}, "action_dispatch.remote_ip"=>#<ActionDispatch::RemoteIp::RemoteIpGetter:0x2b26eead5eb8 @env={...}, @trusted_proxies=/(^127\.0\.0\.1$|^(10|172\.(1[6-9]|2[0-9]|30|31)|192\.168)\.)/i, @check_ip_spoofing=true>, "rack.url_scheme"=>"http", "HTTP_USER_AGENT"=>"Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/534.13 (KHTML, like Gecko) Chrome/9.0.597.107 Safari/534.13", "HTTP_X_REAL_IP"=>"112.118.116.113", "REQUEST_PATH"=>"/trialpay", "action_dispatch.request.query_parameters"=>{}, "action_dispatch.request.unsigned_session_cookie"=>{"_csrf_token"=>"V1Dx8ZRpH/CQiHjhVgNffgX
2011-03-09T22:54:20-08:00 app[web.1]: +simJGZekKpDaJxvxSjA=", "session_id"=>"ccfbd4acaed2f5315126a4b72bc5eefa"}, "SERVER_PROTOCOL"=>"HTTP/1.1", "HTTP_ACCEPT_LANGUAGE"=>"en-US,en;q=0.8", "rack.errors"=>#<IO:0x2b26e83889b8>, "action_dispatch.secret_token"=>"c0eec49f5f47b174ef4ef2fc9021afddbef3258d48de1c7b029da0c1fb327c1a4f9889365c2b291dceb14a92e5869d5ff1572ea4686032f0158e768b96ad0a09", "async.callback"=>#<Method: Thin::Connection#post_process>, "REMOTE_ADDR"=>"10.102.17.212", "HTTP_X_HEROKU_DYNOS_IN_USE"=>"0", "HTTP_X_HEROKU_QUEUE_WAIT_TIME"=>"250", "HTTP_X_VARNISH"=>"1002112025", "PATH_INFO"=>"/trialpay", "rack.run_once"=>false, "rack.version"=>[1, 0], "SERVER_SOFTWARE"=>"thin 1.2.6 codename Crazy Delicious", "action_dispatch.request.path_parameters"=>{:controller=>"trialpay", :action=>"proc"}, "rack.request.cookie_string"=>"__utmz=219898062.1299692790.2.2.utmcsr=facebook.com|utmccn=(referral)|utmcmd=referral|utmcct=/l.php; __utma=219898062.438429746.1299679227.1299726781.1299734314.4; __utmc=219898062; fbs_202763786417566=\"access_token=20276378
2011-03-09T22:54:20-08:00 app[web.1]: 6417566%7Ccc21faa3022c65ddcd8f80bf-100001338729306%7CmevH0D6vcHqALVdP0Sp4kIphEuA&expires=0&secret=c31787815dc13dd97fc48c7e737d3bf1&session_key=cc21faa3022c65ddcd8f80bf-100001338729306&sig=b821d8ae5be29ba0f01bf9476da39502&uid=100001338729306\"; _ons_session=BAh7ByIQX2NzcmZfdG9rZW4iMVYxRHg4WlJwSC9DUWlIamhWZ05mZmdYK3NpbUpHWmVrS3BEYUp4dnhTakE9Ig9zZXNzaW9uX2lkIiVjY2ZiZDRhY2FlZDJmNTMxNTEyNmE0YjcyYmM1ZWVmYQ%3D%3D--25d94a341d32c0c06343e28bfc8cc7a9b6422f6a", "SCRIPT_NAME"=>"", "HTTP_X_HEROKU_QUEUE_DEPTH"=>"0", "action_dispatch.parameter_filter"=>[:password], "HTTP_COOKIE"=>"__utmz=219898062.1299692790.2.2.utmcsr=facebook.com|utmccn=(referral)|utmcmd=referral|utmcct=/l.php; __utma=219898062.438429746.1299679227.1299726781.1299734314.4; __utmc=219898062; fbs_202763786417566=\"access_token=202763786417566%7Ccc21faa3022c65ddcd8f80bf-100001338729306%7CmevH0D6vcHqALVdP0Sp4kIphEuA&expires=0&secret=c31787815dc13dd97fc48c7e737d3bf1&session_key=cc21faa3022c65ddcd8f80bf-100001338729306&sig=b821d8ae5be29ba0f01bf9476da39502&uid=1
2011-03-09T22:54:20-08:00 app[web.1]: 00001338729306\"; _ons_session=BAh7ByIQX2NzcmZfdG9rZW4iMVYxRHg4WlJwSC9DUWlIamhWZ05mZmdYK3NpbUpHWmVrS3BEYUp4dnhTakE9Ig9zZXNzaW9uX2lkIiVjY2ZiZDRhY2FlZDJmNTMxNTEyNmE0YjcyYmM1ZWVmYQ%3D%3D--25d94a341d32c0c06343e28bfc8cc7a9b6422f6a", "HTTP_VERSION"=>"HTTP/1.1", "rack.multithread"=>false, "action_dispatch.request.request_parameters"=>{}, "action_dispatch.cookies"=>{"__utma"=>"219898062.438429746.1299679227.1299726781.1299734314.4", "_ons_session"=>"BAh7ByIQX2NzcmZfdG9rZW4iMVYxRHg4WlJwSC9DUWlIamhWZ05mZmdYK3NpbUpHWmVrS3BEYUp4dnhTakE9Ig9zZXNzaW9uX2lkIiVjY2ZiZDRhY2FlZDJmNTMxNTEyNmE0YjcyYmM1ZWVmYQ==--25d94a341d32c0c06343e28bfc8cc7a9b6422f6a", "__utmc"=>"219898062", "__utmz"=>"219898062.1299692790.2.2.utmcsr=facebook.com|utmccn=(referral)|utmcmd=referral|utmcct=/l.php", "fbs_202763786417566"=>"\"access_token=202763786417566|cc21faa3022c65ddcd8f80bf-100001338729306|mevH0D6vcHqALVdP0Sp4kIphEuA&expires=0&secret=c31787815dc13dd97fc48c7e737d3bf1&session_key=cc21faa3022c65ddcd8f80bf-100001338729306&sig=b821d8ae5be29ba0f01bf947
2011-03-09T22:54:20-08:00 app[web.1]: 6da39502&uid=100001338729306\""}, "REQUEST_URI"=>"/trialpay", "rack.multiprocess"=>false, "rack.request.query_hash"=>{}, "SERVER_PORT"=>"80", "HTTP_ACCEPT_CHARSET"=>"ISO-8859-1,utf-8;q=0.7,*;q=0.3", "HTTP_X_FORWARDED_FOR"=>"112.118.116.113, 10.96.39.130", "action_controller.instance"=>#<TrialpayController:0x2b26eeab0938 @_request=#<ActionDispatch::Request:0x2b26eeab0870 ...>, @_status=200, @_config=#<OrderedHash {}>, @_response=#<ActionDispatch::Response:0x2b26eeab07a8 @cookie=[], @cache_control={}, @header={}, @status=200, @length=0, @block=nil, @writer=#<Proc:0x00002b26ed592330@/app/6b77f498-a9c4-4a9d-b9c5-7192d61de85d/home/.bundle/gems/ruby/1.8/gems/actionpack-3.0.4/lib/action_dispatch/http/response.rb:43>, @request=#<ActionDispatch::Request:0x2b26eeab0870 ...>, @blank=false, @sending_file=false, @etag=nil, @body=[]>, @action_has_layout=true, @lookup_context=#<ActionView::LookupContext:0x2b26eea9d770 @view_paths=[#<ActionView::FileSystemResolver:0x2b26eed13c48 @path="/app/6b77f498-a9c4-4a9d-b9c5-7192d61de
2011-03-09T22:54:20-08:00 app[web.1]: 85d/home/app/views", @cached={}>, #<ActionView::FileSystemResolver:0x2b26eed14288 @path="/app/6b77f498-a9c4-4a9d-b9c5-7192d61de85d/home/vendor/plugins/rails_log_stdout/app/views", @cached={}>, #<ActionView::FileSystemResolver:0x2b26eed14878 @path="/app/6b77f498-a9c4-4a9d-b9c5-7192d61de85d/home/vendor/plugins/rails3_serve_static_assets/app/views", @cached={}>], @details_key=nil, @skip_default_locale=false, @details={:locale=>[:en, :en], :formats=>[:html], :handlers=>[:rjs, :rhtml, :erb, :rxml, :builder]}, @frozen_formats=false>, @_headers={"Content-Type"=>"text/html"}, @_action_name="proc", @view_context_class=nil, @_env={...}, @_response_body=nil>, "rack.session.options"=>{:httponly=>true, :domain=>nil, :path=>"/", :secure=>false, :expire_after=>nil, :id=>"ccfbd4acaed2f5315126a4b72bc5eefa"}, "async.close"=>#<EventMachine::DefaultDeferrable:0x2b26eeadc7e0>, "REQUEST_METHOD"=>"GET", "rack.request.query_string"=>"", "action_dispatch.request.content_type"=>nil, "QUERY_STRING"=>"", "GATEWAY_INTERFACE"=>"CGI/1.2",
2011-03-09T22:54:20-08:00 app[web.1]:  "HTTP_ACCEPT_ENCODING"=>"gzip,deflate,sdch", "HTTP_CONNECTION"=>"close", "rack.input"=>#<StringIO:0x2b26eeadd1e0>}, @method="GET">
=end
