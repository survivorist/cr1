Feature:  Sign out
	In order tprotect my account from unauthorized access
	As a signed in user
	I should be able to sign out

Scenario: User signs out
	Given I am logged in 
	When I sign out
	Then I should see a signed out message
	When I return to the site
	Then I should be signed out

