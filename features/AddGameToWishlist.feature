Feature: Add game to wishlist

  Background:
    * url 'http://localhost:8080'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def signUpJson = read('..\\data\\signUp.json')

    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * def signUpJson = read('..\\data\\signUp.json')
    * signUpJson.email = 'test' + now() + '@outlook.com'
    * signUpJson.name = 'test testson'
    * def signInJson = {email: "", password: ""}
    * signInJson.email = signUpJson.email
    * signInJson.password = signUpJson.password

    Given path 'auth/signup'
    And request signUpJson
    When method post
    Then status 201
    And match response.user.name == signUpJson.name
    And match response.user.email == signUpJson.email

    Given path 'auth/signin'
    And request signInJson
    When method post
    Then status 200
    And match response.user.email == signInJson.email
    And match response.token == "#notnull"
    * def token = response.token

  Scenario: Add game to wishlist

    # adds the game to the wishlist
    Given path 'wishlist'
    And header Authorization = 'Bearer ' + token
    * def gameName = {gameName:god of war}
    And request gameName
    When method post
    Then status 201
    * print gameName
    * print response
    And match response.gameName == "god of war"

    # doesn't add the game mistyped to the wishlist
    Given path 'wishlist'
    And header Authorization = 'Bearer ' + token
    * def gameName = {gameName:god of wa}
    And request gameName
    When method post
    Then status 404
    * print gameName
    * print response
    And match response.details == "Game not found"