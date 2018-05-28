Given("that I search all posts") do
  @response = search_all_posts
  search_debug_url #print url
end

Then("response {string} should be returned") do |responseCode|
  response_code(responseCode)
end

Then("the json should be formated in schema {string}") do |schemaName|
  body = JSON.parse(@response.body)
  expect(Schema_Validator.new.validate_json(schemaName, body)).to eq(true)
end

Given("that I search the post id {string}") do |postId|
  @response = search_post_id(postId)
  search_debug_url #print url
end

Then("the searched post should have been id {string}") do |postId|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response["id"]).to eq(postId.to_i)
end

Given("that I search the comments of post id {string}") do |postId|
  @response = search_comments_post(postId)
  search_debug_url #print url
end

Then("the searched comment should have been postId {string}") do |postId|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response[1]["postId"]).to eq(postId.to_i) #validate the first result of response
end

Then("the documentsField {string} should contain {string}") do |documentsField, expectedTerm|
  parsed_response = JSON.parse(@response.body)
  expect(parsed_response["#{documentsField}"]).to include(expectedTerm)
end

Given("that I send new post for create with userId {string} and title {string}") do |userIdPost, titlePost|
  create_body(userIdPost, titlePost)
  @response = create_post
  puts "Note: the resource will not be really *created* on the server but it will be faked as if"
end

Given("that I send post for update with postId {string} and title {string}") do |idPost, titlePost|
  update_body(idPost, titlePost)
  @response = update_post(idPost)
  puts "Note: the resource will not be really *updated* on the server but it will be faked as if"
end

Given("that I send post for delete with postId {string}") do |idPost|
  @response = delete_post(idPost)
  puts "Note: the resource will not be really *deleted* on the server but it will be faked as if"
end