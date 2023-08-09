
Feature: API Feature

Background:
  * url 'https://jsonplaceholder.typicode.com'

Scenario: Retrieve Posts
  Given path '/posts'
  When method GET
  Then status 200
  * def response = response

Scenario: Create New Post
  Given path '/posts'
  And request { userId: 1, title: 'New Post', body: 'This is a new post.' }
  When method POST
  Then status 201
  * def response = response

Scenario: Update Post
  Given path '/posts/1'
  And request { title: 'Updated Post' }
  When method PUT
  Then status 200
  * def response = response

Scenario: Delete Post
  Given path '/posts/1'
  When method DELETE
  Then status 200
  * def response = response
