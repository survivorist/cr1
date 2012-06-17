Feature:  List Item
	In order to display items for rent
	As a user
	I want to be able to list an item

Scenario:  User lists item without being signed in
	Given I am not signed in
	When I visit the new item page
	Then I should see the signin page
	And The required signin message

Scenario: Signed in user lists item
	Given I am signed in
	When I list an item
	Then I should see a successful listing message

Scenario: User lists item with no description
	Given I am signed in
	When I list an item with no description
	Then I should see an incomplete info message

Scenario: User lists item with no subtitle
	Given I am a signed in user 
	When I list an item without a subtitle 
	Then I should see a successful listing message
