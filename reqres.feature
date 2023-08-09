
Feature: Complex Karate Scenarios with Reqres.in API

Background:
  * configure retry = { count: 3, interval: 3000, logic: 'retryLogic' }
  * def retryLogic =
    """
    function(response) {
      if (response.status === 503) {
        return true;
      }
      return false;
    }
    """

Scenario: Create and Retrieve User
  Given url 'https://reqres.in/api'
  And request { name: 'John Doe', job: 'developer' }
  When path '/users'
  And method post
  Then status 201
  * def userId = response.id
  * def userPath = '/users/' + userId
  When path userPath
  And method get 
  Then status 404
#   * match response.name == 'John Doe'
#   * match response.job == 'developer'

Scenario: Retrieve Users and Validate Page Number
  Given url 'https://reqres.in/api'
  When path '/users'
  And method get
  Then status 200
  * def users = response.data
  * def firstUserId = users[0].id
  * def secondPagePath = '/users?page=2'
  When path secondPagePath
  And method get 
  Then status 200
  * match response.page == 2

Scenario: Retry Logic with Users
  Given url 'https://reqres.in/api'
  When path '/users/1'
  When method get
  Then status 200
  * def response = call read('classpath:retryApi2.feature')
  Then status 200
  * match response.data.email == 'george.bluth@reqres.in'

Scenario: Transform User First Names
  Given url 'https://reqres.in/api'
  When path '/users'
  When method get
  Then status 200
  * def transformedNames = response.data.map(item => { return { id: item.id, firstName: item.first_name.toUpperCase() }; })
  * match transformedNames[0].firstName == response.data[0].first_name.toUpperCase()
  * match transformedNames[1].firstName == response.data[1].first_name.toUpperCase()
