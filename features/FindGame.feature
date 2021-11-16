Feature: Create user, login user and find game

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

    * def gameName = 'god of war'
    * def invalidGameName = 'god of wa'

  Scenario: Find Game

    #Should find valid game
    Given path 'game/title=' + gameName
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    * print response
    And match response.game.title == "God of War"

    #Should not find invalid game
    Given path 'game/title=' + invalidGameName
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 404
    * print response
    And match response.details == "Game not found"