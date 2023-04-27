Feature: Articles
    Background: Define URL
        Given url 'https://conduit.productionready.io/api/'
        Given path 'users/login'
        And request {"user":{"email":"testelsonsilva@gmail.com","password":"testelsonsilva"}}
        When method Post
        Then status 200
        * def token = response.user.token


    Scenario: Create a new Article
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article":{"tagList":["test5"],"title":"TEST 5","description":"test 5","body":"desc 5"}}
        When method Post
        Then status 200
        And match response.article.title == 'TEST 5'