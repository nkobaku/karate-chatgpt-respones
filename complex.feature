
Feature: Complex Karate Scenarios

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
        Given url 'https://jsonplaceholder.typicode.com'
        And request { name: 'Alice', age: 30 }
        When path '/users'
        And method post
        Then status 201
        * def userId = response.id
        * def userPath = '/users/' + userId
        When method get userPath
        Then status 200
        * match response[0].name == 'Alice'
        * match response[0].age == 30
      
  Scenario: Retrieve Posts and Validate Comments
    Given url 'https://jsonplaceholder.typicode.com'
    When path '/posts'
    And method get
    Then status 200
    * def posts = response
    * def firstPostId = posts[0].id
    * def commentsPath = '/posts/' + firstPostId + '/comments'
    When method get commentsPath
    Then status 200
    * match response[0].postId == firstPostId

    

    # Scenario: Create and Retrieve User
    #   Given url 'https://jsonplaceholder.typicode.com'
    #   And request { name: 'Alice', age: 30 }
    #   When path '/users'
    #   When method post
    #   Then status 201
    #   * def userId = response.id
    #   * def userPath = '/users/' + userId
    #   When method get userPath
    #   Then status 200
    #   * match response.name == 'Alice'
    #   * match response.age == 30

    # Scenario: Retrieve Posts and Validate Comments
    #   Given url 'https://jsonplaceholder.typicode.com'
    #   When path '/posts'
    #   When method get
    #   Then status 200
    #   * def posts = response
    #   * def firstPostId = posts[0].id
    #   * def commentsPath = '/posts/' + firstPostId + '/comments'
    #   When method get commentsPath
    #   Then status 200
    #   * match response[0].postId == firstPostId

    # Scenario: Retrieve User Data with Retry Logic
    #   Given url 'https://jsonplaceholder.typicode.com'
    #   When path '/users/1'
    #   When method get
    #   Then status 503
    #   * def response = call read('classpath:retryApi.feature')
    #   Then status 200
    #   * match response.name == 'Leanne Graham'

  Scenario: Complex Data Transformation
    Given url 'https://jsonplaceholder.typicode.com'
    When path '/posts'
    When method get
    Then status 200
    * def transformedData = response.map(item => { return { id: item.id, title: item.title.toUpperCase() }; })
    * match transformedData[0].title == response[0].title.toUpperCase()
    * match transformedData[1].title == response[1].title.toUpperCase()
