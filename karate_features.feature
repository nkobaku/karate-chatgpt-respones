Feature:

  Scenario: Custom JavaScript Functions
    Given def generateRandomValue =
    """
    function() {
      // Generate and return a random value
      return Math.random();
    }
    """
  
    When def randomValue = generateRandomValue()
    Then print 'Random Value:', randomValue


  Scenario: Embedding Expressions
    * eval userId = Math.floor(Math.random() * 100)
    * print 'Generated userId:', userId

  Scenario: Using Embedding in Assertion Message
    Given def expectedValue = 42
    * def actualValue = 42
    * def assertionMessage = 'Expected: ' + expectedValue + ', Actual: ' + actualValue
    * match actualValue == expectedValue
    * karate.log(assertionMessage)



    
    #   Scenario: Using Embedding in Assertion Message
    #     Given def expectedValue = 42
    #     * def actualValue = 42
    #     * def assertionMessage = 'Expected: ' + expectedValue + ', Actual: ' + actualValue
    #     * match actualValue == expectedValue ? assertionMessage : 'Values do not match'


    #   Scenario: Using Embedding in Assertion Message
    #     Given def expectedValue = 42
    #     * def actualValue = 40
    #     * def assertionMessage = 'Expected: ' + expectedValue + ', Actual: ' + actualValue
    #     * match actualValue == expectedValue assertionMessage


    # Scenario: Using Embedding in Assertion Message
    #     Given def expectedValue = 42
    #     * def actualValue = 40
    #     * def assertionMessage = 'Expected: ' + expectedValue + ', Actual: ' + actualValue
    #     * match actualValue == expectedValue message assertionMessage

    # Scenario: Using Embedding in Assertion Message
    #     Given def expectedValue = 42
    #     * def actualValue = 42
    #     * match actualValue == expectedValue message 'Expected: #{expectedValue}, Actual: #{actualValue}'

    # Scenario: Using Embedding in Assertion Message
    #     Given def expectedValue = 42
    #     * def actualValue = 40
    #     * match actualValue == expectedValue message "Expected: " + expectedValue + ", Actual: " + actualValue
  

    # Scenario: Using Embedding in Assertion Message
    #     Given def expectedValue = 42
    #     * def actualValue = 42
    #     * match actualValue == expectedValue message 'Expected: #(expectedValue), Actual: #(actualValue)'
  
