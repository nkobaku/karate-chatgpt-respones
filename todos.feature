
Feature: Complex Karate Scenarios with JSONPlaceholder Todos API

Background
:
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

Scenario: Create and Retrieve Todo
  Given url 'https://jsonplaceholder.typicode.com'
  And request { title: 'Buy groceries', completed: false }
  When path '/todos'
  And method post
  Then status 201
  * def todoId = response.id
  * def todoPath = '/todos/' + todoId
  When method get todoPath
  Then status 200
  * match response.title == 'Buy groceries'
  * match response.completed == false

Scenario: Retrieve Todos and Validate User
  Given url 'https://jsonplaceholder.typicode.com'
  When path '/todos'
  And method get
  Then status 200
  * def todos = response
  * def firstTodoUserId = todos[0].userId
  * def userPath = '/users/' + firstTodoUserId
  When method get userPath
  Then status 200
  * match response.id == firstTodoUserId

Scenario: Retry Logic with Todos
  Given url 'https://jsonplaceholder.typicode.com'
  When path '/todos/1'
  When method get
  Then status 503
  * def response = call read('classpath:retryApi1.feature')
  Then status 200
  * match response.title == 'delectus aut autem'

Scenario: Transform Todo Titles
  Given url 'https://jsonplaceholder.typicode.com'
  When path '/todos'
  When method get
  Then status 200
  * def transformedTitles = response.map(item => { return { id: item.id, title: item.title.toUpperCase() }; })
  * match transformedTitles[0].title == response[0].title.toUpperCase()
  * match transformedTitles[1].title == response[1].title.toUpperCase()
