Feature: Sign in
	In order to access restricted areas of site
	As a user
	I want to be able to sign in

Scenario: User is not signed up
	Given I do not exist as a user
	When I sign in with valid credentials
	Then I see an invalid login message
	And I should be signed out

Scenario: User signs in successfully
	Given I exist as a user
	And I am not logged in
	When I sign in with valid credentials
	Then I should see a successful sign in message
	When I return to the site
	Then I should be signed in

Scenario: User enters wrong email
	Given I exist as a user 
	And I am not logged in
	When I sign in with wrong email
	Then I should see an invalid login message
	And I should be signed out

Scenario: User enters wrong password
	Given I exist as a user
	And I am not logged in
	When I sign in with wrong password
	Then I should see invalid login message
	And I should be signed out