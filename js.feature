
Feature: Karate Feature with JavaScript Functions

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

Scenario: Using JavaScript Function to Calculate Sum
  * def add = function(a, b) { return a + b; }
  * def result = add(5, 7)
  * match result == 12

Scenario: Using JavaScript Function with Arrow Syntax
  * def multiply = (a, b) => a * b
  * def result = multiply(3, 4)
  * match result == 12

Scenario: Using JavaScript Function with Destructuring
  * def numbers = [1, 2, 3]
  * def sum = (arr) => arr.reduce((total, num) => total + num, 0)
  * def total = sum(numbers)
  * match total == 6

Scenario: Using JavaScript Function with Template Literals
  * def getName = (firstName, lastName) => `Full Name: ${firstName} ${lastName}`
  * def fullName = getName('Alice', 'Johnson')
  * match fullName == 'Full Name: Alice Johnson'
