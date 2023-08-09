
Feature: Retry API Feature

Background:
  * url 'https://reqres.in/api'

Scenario: Retry Logic Scenario
  Given path '/users/1'
  When method GET
  Then status 200
  * def response = response
