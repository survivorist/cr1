Feature: Sign up
	In order to get access to full site features
	As a user
	I want to be able to sign up

Scenario: User clicks sign up link
	Given I am on the home page
	When I click the "Sign Up" link
	Then I should be on the sign up page

Scenario: User signs up with valid data
	Given I am on the sign up page
	When I sign up with valid user data
	Then I should see a successful signup message

Scenario: User signs up with invalid email
	Given I am on the sign up page
	When I sign up with an invalid email
	Then I should see an invalid email message

Scenario: User signs up without password
	Given I am on the sign up page
	When I sign up without password
	Then I should see a missing password message

Scenario: User signs up without password confirmation
	Given I am on the sign up page
	When I sign up without password confirmation
	Then I should see a missing password confirmation message

Scenario:  User signs up with a mismatched password confirmation
	Given I am on the sign up page
	When I sign up with a mismatched password confirmation
	Then I should see a mismatched password message
