
Feature: Data Feature

Background:
  * url 'https://jsonplaceholder.typicode.com'

Scenario: Retrieve Data
  Given path '/data'
  When method GET
  Then status 200
  * def response = response
