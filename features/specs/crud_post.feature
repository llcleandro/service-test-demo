Feature: Be able to create, search, update and delete posts

@create @crud
Scenario: Creating new post
	Given that I send new post for create with userId "11" and title "New Post" 
	# Then response "200" should be returned

@update @crud
Scenario: Updateing post
	Given that I send post for update with postId "101" and title "Update Post"
	# Then response "200" should be returned

@delete @crud
Scenario: Deleting post
	Given that I send post for delete with postId "101"
	# Then response "200" should be returned

@searchAllPosts
Scenario: Services search all posts - validate Json
	Given that I search all posts
	Then response "200" should be returned
	And the json should be formated in schema "search_all_posts.json"

@searchPost
Scenario: Services search post - specific post
	Given that I search the post id "1"
	Then response "200" should be returned
	Then the searched post should have been id "1"
	And the json should be formated in schema "search_post.json"

@searchCommentsPost
Scenario: Services search comments - comments of specific post
	Given that I search the comments of post id "1"
	Then response "200" should be returned
	Then the searched comment should have been postId "1"
	And the json should be formated in schema "search_comments.json"


@searchDistinctPostsIds
Scenario Outline: Services search post with distinct ids - validate response in title
	Given that I search the post id "<inputId>"
	Then response "<code>" should be returned
	Then the documentsField "title" should contain "<expectedTerm>"
Examples:
  | inputId   | expectedTerm    		| code |
  | 4         | eum et est occaecati	| 200  |
  | 2         | qui est esse		 	| 200  |
  | 7         | magnam facilis autem    | 200  |
