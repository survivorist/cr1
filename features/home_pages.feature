Feature: Viewer visits the Home Page
		In order to read the page
		As a viewer
		I want to see the home page of my app

	Scenario: View home page
		Given I am on the home page
		Then I should see "CrowdRenta" in the selector "h1"

	Scenario: Check Home Page Links
		Given I am on the home page
		Then I should see "How It Works" in a link
		And I should see "Sign Up" in a link
		And I should see "Log In" in a link





