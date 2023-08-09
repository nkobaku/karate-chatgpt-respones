
Feature: Advanced Examples Using ES6 Syntax in Karate

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

Scenario: Using Arrow Functions with Promise Chaining
  Given def response = await callApi()
  Then assert response.status === 200

Scenario: Destructuring and Renaming for Clarity
  * def userData = { firstName: 'Alice', lastName: 'Johnson' }
  * def { firstName: fName, lastName: lName } = userData

Scenario: Mapping an Array of Objects Using Arrow Function
  * def products = [{ name: 'Product 1', price: 10 }, { name: 'Product 2', price: 20 }]
  * def prices = products.map(({ price }) => price)

Scenario: Filtering Data Using Arrow Function
  * def users = [{ name: 'Alice', age: 25 }, { name: 'Bob', age: 30 }]
  * def adults = users.filter(({ age }) => age >= 18)

Scenario: Using Object Spread Operator for Data Manipulation
  Given def baseData = { name: 'John', age: 30 }
  And def additionalData = { city: 'New York' }
  * def userData = { ...baseData, ...additionalData }

Scenario: Using Set to Find Unique Values in an Array
  * def numbers = [1, 2, 3, 2, 4, 1]
  * def uniqueNumbers = [...new Set(numbers)]

Scenario: Using async and await for Multiple API Calls
  Given def responses = await Promise.all([callApi1(), callApi2()])
  * def successfulResponses = responses.filter(response => response.status === 200)
  * eval assert successfulResponses.length === 2

Scenario: Using Arrow Function to Calculate Total Price
  * def products = [{ name: 'Product 1', price: 10 }, { name: 'Product 2', price: 20 }]
  * def totalPrice = products.reduce((total, { price }) => total + price, 0)

Scenario: Using Template Literals for Complex Messages
  * def order = { id: 123, items: 2, total: 50 }
  * def message = `Order #${order.id}: ${order.items} items purchased for $${order.total}`

Scenario: Using await with Async Function for Custom Validation
  * def response = await callApi()
  * def isValidResponse = await validateResponse(response)
  * eval assert isValidResponse

Scenario: Combining map and filter for Complex Data Manipulation
  * def users = [     { name: 'Alice', age: 25, active: true }, { name: 'Bob', age: 30, active: false }  ]
  * def activeUserNames = users.filter(({ active }) => active).map(({ name }) => name)
  * match activeUserNames == ['Alice']
