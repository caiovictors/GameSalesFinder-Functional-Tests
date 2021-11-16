<h1 align="center">🎮 GameSalesFinder Functional Tests</h1>
<h3 align="center">Functional Tests for GameSalesFinder Application using Karate 🥋</h3> 

***
## ℹ About

The Game Sales Finder is an api that uses the <a href="https://apidocs.cheapshark.com/" target="_blank">CheapShark API</a> to find the best price of a given game, returning the price and the store(s) that have the best price. Sign up and sign in are necessary to use the aplication, and you can create your own wishlist of games that returns the best actual prices for the games you add. This is the functional tests repository for the original application <a href="https://github.com/caiovictors/GameSalesFinder/" target="_blank">GameSalesFinder</a>.

## 💻 Technologies
* Java 11
* Karate

## 🛠 Requirements
* jdk 16

## ✅ Features
* Karate tests for GameSalesFinder Application
  
## ⚙ Installation and Running
* Clone the Application repository
```bash
$ git clone https://github.com/caiovictors/GameSalesFinder.git
```
* Start docker 🐋
```bash
$ docker-compose up -d
```
* Clone this repository
```bash
$ git clone https://github.com/caiovictors/gamesalesfinder-functional-tests
```
* Enter the gamesalesfinder-functional-tests directory and start tests with
```bash
$ java -jar karate.jar features
```
