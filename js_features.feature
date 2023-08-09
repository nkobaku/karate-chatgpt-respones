
Feature: Karate Feature with JavaScript Features

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

  Scenario: Template Literals
    * def name = 'Alice'
    * def message = `Hello, ${name}!`
    * match message == 'Hello, Alice!'

  Scenario: Arrow Functions
    * def add = (a, b) => a + b
    * def result = add(5, 7)
    * match result == 12

    # Scenario: Object Destructuring
    #   * def user = { name: 'Alice', age: 30 }
    #   * def { name, age } = user
    #   * match name == 'Alice'
    #   * match age == 30

  Scenario: Object Destructuring with eval
    * def user = { name: 'Alice', age: 30 }
    * eval
      """
      const { name, age } = karate.get('user');
      karate.log('Name:', name);
      karate.log('Age:', age);
      """
        
    #   Scenario: Array Destructuring
    #     * def numbers = [1, 2, 3]
    #     * def [first, second, third] = numbers
    #     * match first == 1
    #     * match second == 2
    #     * match third == 3

  Scenario: Array Destructuring with eval
    * def numbers = [1, 2, 3]
    * eval
      """
      const [first, second, third] = karate.get('numbers');
      karate.log('First:', first);
      karate.log('Second:', second);
      karate.log('Third:', third);
      """
        
    #   Scenario: Spread Operator
    #     * def arr1 = [1, 2, 3]
    #     * def arr2 = [4, 5, 6]
    #     * def combined = [...arr1, ...arr2]
    #     * match combined == [1, 2, 3, 4, 5, 6]

  Scenario: Array Concatenation with eval
    * def arr1 = [1, 2, 3]
    * def arr2 = [4, 5, 6]
    * eval
      """
      const combined = [...karate.get('arr1'), ...karate.get('arr2')];
      karate.log('Combined Array:', combined);
      """
    * match combined == [1, 2, 3, 4, 5, 6]
    # Continue adding more scenarios to cover other JavaScript features
