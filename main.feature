
Feature: Main Feature

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

Scenario: Custom API Call Using call
  Given call read('classpath:api.feature')
  Then status 200

# Other scenarios...
