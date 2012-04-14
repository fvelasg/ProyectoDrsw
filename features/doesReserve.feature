Feature: user does a reserve
As an user 
I want to reserve materials 
so that i will be sure to purchase the materials

Scenario: there are sufficient cantidad of material
Given there are 5 units of "pisoXX"
And i go to the materials reserve page 
And i fill "id_material" with "pisoXX"
And i fill "cantidad" with "3"
When i press "reservar" 
Then confirmation page should be shown
And "cantidad" is "2"

Scenario: there aren't sufficient cantidaddisponible of material
Given there are 5 units of "pisoXX"
And i go to the materials reserve page 
And i fill "id_material" with "pisoXX"
And i fill "cantidad" with "6"
When i press "reservar" 
Then error page should be shown
