module SearchHelper
	def search_post_id(postId)
		@path = ENVIRONMENT['PATH']['api_path']
		@service = ENVIRONMENT['GET_SERVICES']['search_post_api']
		@url = "#{@path}#{@service}#{postId}"
		@last_response = ServiceApi.get(@url)
	end	
	def search_all_posts
		@path = ENVIRONMENT['PATH']['api_path']
		@service = ENVIRONMENT['GET_SERVICES']['search_post_api']
		@url = "#{@path}#{@service}"
		@last_response = ServiceApi.get(@url)
	end
	def search_comments_post(postId)
		@path = ENVIRONMENT['PATH']['api_path']
		@service = ENVIRONMENT['GET_SERVICES']['search_comment_api']
		@service["{ID}"] = "#{postId}"
		@url = "#{@path}#{@service}"
		@last_response = ServiceApi.get(@url)
	end		
	def response_code(responseCode)
		@last_response.code.to_s.should == responseCode
		@last_response.bad_gateway? != "false"
  		@last_response.success? == "true"
	end
	def search_debug_url
		puts @url
	end
end
World(SearchHelper)


class ServiceApi
	include HTTParty
	base_uri ENVIRONMENT['PATH']['api_path']
	format :json
	headers 'Content-Type' => 'application/json'
	basic_auth AUTH['user'], AUTH['pass']
end
