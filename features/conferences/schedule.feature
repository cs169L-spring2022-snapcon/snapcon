Feature: User can view conference schedule in different timezones

Background:
    Given I have my test database setup

Scenario: View schedule tab 
    Given I am on the home page
    Then I should see "Open Source Event Manager Demo Conference"
    When I click the "Schedule" link of conference "osemdemo"
    Then I should be on the "osemdemo" conference's schedule page
    And I should see "Schedule for Open Source Event Manager Demo Conference"

Scenario: Display conference schedule on local timezone
    Given I am on the "osemdemo" conference's schedule page
    Then I should see "This schedule uses your browser's local timezone."


Scenario: Edit user timezone
    Given I am on the login page
    Then I should see "Sign In"
    When I fill in "admin" for "user_login"
    And I fill in "password123" for "user_password"
    And I press "Sign In"
    Then I should be on the admin's conference page
    And I should see "Signed in successfully."
    When I click the "Edit Profile" link of user "18"
    Then I should see "Edit your profile"
    When I select "Eastern Time (US & Canada)" from "user[timezone]"
    And I press "Update"
    Then I should see "User was successfully updated."
    When I go to the "osemdemo" conference's schedule page
    Then I should see "This schedule uses your profile's timezone."





    