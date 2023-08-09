Feature: API Feature

Scenario: Retrieve Posts
  Given path '/posts'
  When method GET
  Then status 200
