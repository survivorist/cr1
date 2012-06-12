###Utility Methods###

def create_visitor
	@visitor ||= {first_name: "Tom", last_name: "Oakes", 
    email: "ready@ready.com", password: "maverick1", 
    password_confirmation: "maverick1" }
end

def find_user
  @user ||= User.first conditions: {email: @visitor[:email]}
end

def create_unconfirmed_user
	create_visitor
	delete_user
	sign_up
	visit signout_path
end

def create_user
	create_visitor
	delete_user
	@user = FactoryGirl.create(:user, email: @visitor[:email])
end

def delete_user
	@user ||= User.first conditions: {email: @visitor[:email]}
	@user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/signup'
  fill_in "First name", :with => @visitor[:first_name]
  fill_in "Last name", :with => @visitor[:last_name]
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  fill_in "Confirmation", :with => @visitor[:password_confirmation]
  click_button "Create my account"
  find_user
end

def sign_in
  visit '/signin'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

When /^I click the "([^"]*)" link$/ do |link|
	click_link ("#{link}")

end

Then /^I should be on the sign up page$/ do
  visit signup_path
end

Given /^I am on the sign up page$/ do
  visit signup_path
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

Then /^I should see a successful signup message$/ do
    page.should have_content "Welcome to CrowdRenta"

end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(email: "notanemail")
  sign_up
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

When /^I sign up without password$/ do
  create_visitor
  @visitor = @visitor.merge(password: "")
  sign_up
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

When /^I sign up without password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(password_confirmation: "")
  sign_up
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(password_confirmation: "mismatched")
  sign_up
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in  
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password"
end

Then /^I should be signed out$/ do
  visit signout_path
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I am not logged in$/ do
  visit signout_path
end

Then /^I should see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

When /^I return to the site$/ do
visit root_path
end

Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign Up"
  page.should_not have_content "Sign In"
end

When /^I sign in with wrong email$/ do
  @visitor= @visitor.merge(email: "wrong@example.org")  
  sign_in
end

Then /^I should see an invalid login message$/ do
  page.should have_content "Invalid email or password"
end

When /^I sign in with wrong password$/ do
  @visitor = @visitor.merge(password: "wrongpassword")
  sign_in
end

Then /^I should see invalid login message$/ do
  page.should have_content "Invalid email or password"
end


