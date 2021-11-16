Feature: Sign In an user

  Background:
    * url 'http://localhost:8080'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * def signUpJson = read('..\\data\\signUp.json')
    * signUpJson.email = 'test' + now() + '@outlook.com'
    * signUpJson.name = 'test testson'
    * def loginJson = {email: "", password: ""}
    * loginJson.email = signUpJson.email
    * loginJson.password = signUpJson.password
    * def testUserJson = { email: "nottest@outlook.com", password: "wrong-password" }

  Scenario: Signs in an user and returns an error if it does not exist
    Given path 'auth/signup'
    And request signUpJson
    When method post
    Then status 201
    * print signUpJson
    * print response
    And match response.user.name == signUpJson.name
    And match response.user.email == signUpJson.email
    * print loginJson

    Given path 'auth/signin'
    And request loginJson
    When method post
    Then status 200
    * print loginJson
    * print response

    And match response.user.email == loginJson.email
    And match response.token == "#notnull"

    Given path 'auth/signin'
    And request testUserJson
    When method post
    Then status 403