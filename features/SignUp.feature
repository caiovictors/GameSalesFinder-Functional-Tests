Feature: Create a new user

  Background:
    * url 'http://localhost:8080'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * def signUpJson = read('..\\data\\signUp.json')
    * signUpJson.email = 'test' + now() + '@outlook.com'

  Scenario: Creates a new user and return an error if it already exists
    Given path 'auth/signup'
    And request signUpJson
    When method post
    Then status 201
    * print signUpJson
    * print response
    And match response.user.name == signUpJson.name
    And match response.user.email == signUpJson.email

    Given path 'auth/signup'
    And request signUpJson
    When method post
    Then status 409
    * print signUpJson
    * print response
    And match response.status == 409
    And match response.details == "Email already exists"