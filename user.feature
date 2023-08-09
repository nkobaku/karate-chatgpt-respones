
Feature: User Feature

Background:
  * url 'https://jsonplaceholder.typicode.com'

Scenario: Retrieve User Data
  Given path '/users/1'
  When method GET
  Then status 200
  * def response = response
