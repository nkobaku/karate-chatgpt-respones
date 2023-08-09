
Feature: API Feature

Background:
  * url 'https://reqres.in/api'

Scenario: Retrieve Single User
  Given path '/users/2'
  When method GET
  Then status 200
  * def response = response

Scenario: Create User
  Given path '/users'
  And request { name: 'John', job: 'Developer' }
  When method POST
  Then status 201
  * def response = response

Scenario: Update User
  Given path '/users/2'
  And request { name: 'John Doe' }
  When method PUT
  Then status 200
  * def response = response

Scenario: Delete User
  Given path '/users/2'
  When method DELETE
  Then status 204
