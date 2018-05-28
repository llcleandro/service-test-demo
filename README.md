# Flow of API Tests

This Tests, using the BDD framework Cucumber + HTTParty to provide documentation to automated tests.

## Dependencies

* Ruby 2.2.0
* httparty 0.13.7

## Installation Instructions

### Recommendations

* Use RVM to handle rubies and gemsets

 * See installation instructions here (https://rvm.io/rvm/install)

* Install bundler

        $ gem install bundler

* Project Installation

        $ git@gitlab.wmxp.com.br:atlantico/ticket-hub/ticket-hub-tests.git
        $ bundle install

## Suport Tools

Use of JSONschema.net for validation to created schems  (https://jsonschema.net/#/)
	Version: draft-06


## Services

Used https://jsonplaceholder.typicode.com because this services is public.

### Get Services
Search All Posts
- https://jsonplaceholder.typicode.com/posts

Search Post
- https://jsonplaceholder.typicode.com/posts/1

Search Post Comments
- https://jsonplaceholder.typicode.com/posts/1/comments

### Post Service
Create Post
- https://jsonplaceholder.typicode.com/posts

### Put Service
Update Post
- https://jsonplaceholder.typicode.com/posts/{ID}

### Deleted Service
Delete Post
- https://jsonplaceholder.typicode.com/posts/{ID}

### Other Services (not implemented)
- https://jsonplaceholder.typicode.com/albums/1/photos
- https://jsonplaceholder.typicode.com/users/1/albums
- https://jsonplaceholder.typicode.com/users/1/todos
- https://jsonplaceholder.typicode.com/users/1/posts

## Documents
TypeCode How-To
- https://github.com/typicode/jsonplaceholder#how-to

