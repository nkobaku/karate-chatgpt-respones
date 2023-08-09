Feature: API Feature

Background:
  * url 'https://api.example.com'

Scenario: Call API Endpoint 1
  Given path '/endpoint1'
  When method GET
  Then status 200
  * def response = response

Scenario: Call API Endpoint 2
  Given path '/endpoint2'
  When method POST
  And request { data: 'some_data' }
  Then status 201
  * def response = response
