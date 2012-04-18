Feature: administrator creates materials

Scenario: the categoria doesn't exist
Given the database is empty
And i go to the materials creation page
And i fill "nombre" with "pisoXX"
And i fill "cantidad" with "5"
And i fill "categoria" whit "cat1"
When i press "add"
Then error page should be shown  

Scenario: the category already exists
Given a category with name "cat1", previously created
And i go to the materials creation page
And i fill "nombre" with "pisoXX"
And i fill "cantidad" with "5"
And i fill "categoria" whit "cat1"
When i press "add"
Then confirmation page should be shown 
