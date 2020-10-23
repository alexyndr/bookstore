Feature: Visit Homepage
  User want to see Profile tab
  
  Scenario: User login on Homepage
    Given I am on home page
    When I click the link "Log In"
    Then I fill in "Email" with "email"
    Then Also I fill in "Password" with "password"
    When I click the "Sign In"
    Then I should see the title "Profile" 