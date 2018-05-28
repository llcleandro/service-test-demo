module PostApiHelpers
	def create_body(userIdPost, titlePost)
	 	@startDate = DateTime.now.strftime('%Q').to_i - (60 * 1000)#-60 seconds for force imput
		@body = {
			"title" => "#{titlePost}",
			"body" => "testePostValue-#{@startDate}",
			"userId" => "#{userIdPost}",
		}.to_json
	end

	def create_post
		@path = ENVIRONMENT['PATH']['api_path']
		@service = ENVIRONMENT['GET_SERVICES']['search_post_api']
		@url = "#{@path}#{@service}"
		@last_response = ServiceApi.post(@url, :body => @body)
		puts "Response code: #{@last_response.code}"
		@idPostCreated = @last_response["id"]
		puts "New Post ID = #{@idPostCreated}"
	end

	def update_body(idPost, titlePost)
		@body = {
			"id" => "#{idPost}",
			"title" => "#{titlePost}",
		}.to_json
	end	

	def update_post(idPost)
		@path = ENVIRONMENT['PATH']['api_path']
		@service = ENVIRONMENT['GET_SERVICES']['search_post_api']
		@url = "#{@path}#{@service}#{idPost}"
		@last_response = ServiceApi.put(@url, :body => @body)
		puts "Response code: #{@last_response.code}"
		# @idPostCreated = @last_response["id"]
		# puts "Post ID = #{@idPostCreated}"
	end	


	def delete_post(idPost)
		@path = ENVIRONMENT['PATH']['api_path']
		@service = ENVIRONMENT['GET_SERVICES']['search_post_api']
		@url = "#{@path}#{@service}#{idPost}"
		@last_response = ServiceApi.delete(@url)
		puts "Response code: #{@last_response.code}"
		# @idPostCreated = @last_response["id"]
		# puts "Post ID = #{@idPostCreated}"
	end	

	# def update_rule(id)
	# 	body = {
	# 		"ruleBy" => "term",
	# 		"ruleValue" => "testeRuleValue-#{@startDate}-update",
	# 		"field" => "testeField-update",
	# 		"fieldValue" => ["testeFieldValue-update-1","testeFieldValue-update-2"],
	# 		"author" => "Automation Tests",
	# 		"boost" => "20",
	# 	}.to_json
	# 	@last_response = ApiService.patch("/rule/#{id}", :body => body)

 #  		#get_rule_term
 #  		parsed_response = JSON.parse(@last_response.body)
 #  		@ruleTerm = (parsed_response["ruleValue"][0])		
	# end

end
World(PostApiHelpers)