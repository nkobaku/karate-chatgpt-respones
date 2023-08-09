
Feature: Testing Karate Scope and Context Variables

  Background:
    * def baseUrl = 'https://jsonplaceholder.typicode.com'

  Scenario: Using Karate Local Variables
    Given def userId = 1
    * url baseUrl
    * path '/users', userId
    When method get
    Then status 200
    * match response.id == userId

  Scenario: Storing Variables in Karate's Scenario Scope
    Given url baseUrl
    When path '/posts'
    And method get
    Then status 200
    * def postIds = response[*].id
    * match postIds != null
    * set scenarioScope.postIds = postIds

  Scenario: Accessing Scenario Scope Variables
    Given def expectedIds = scenarioScope.postIds
    * url baseUrl
    When path '/posts'
    And method get
    Then status 200
    * def actualIds = response[*].id
    * match actualIds == expectedIds

  Scenario: Storing Variables in Karate's Scenario Context
    Given url baseUrl
    When path '/comments'
    And method get
    Then status 200
    * def emailList = response[*].email
    * set scenarioContext.emailList = emailList

  Scenario: Accessing Scenario Context Variables
    Given def emails = scenarioContext.emailList
    * match emails != null
    * match emails contains 'example'

  Scenario: Using Karate Global Variables
    Given url baseUrl
    When path '/todos/1'
    And method get
    Then status 200
    * def title = response.title
    * set global title = title
