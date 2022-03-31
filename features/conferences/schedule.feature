Feature: User can view conference schedule in different timezones

Background:
    Given I have my test database setup


Scenario: View schedule tab 
    Given I am on the home page
    Then I should see "Open Source Event Manager Demo Conference"
    When I click on the "Schedule" link of conference "osemdemo"
    Then I should be on the "osemdemo" conference's schedule page
    And I should see "Schedule for Open Source Event Manager Demo Conference"

@javascript
Scenario: Display conference schedule on local timezone
    Given I am on the "osemdemo" conference's schedule page
    Then I should see "This schedule uses your browser's local timezone."
   
@javascript
Scenario: Edit user timezone
    Given I am on the login page
    Then I should see "Sign In"
    When I fill in "admin" for "user_login"
    And I fill in "password123" for "user_password"
    And I press "Sign In"
    Then I should be on the admin's conference page
    And I should see "Signed in successfully."
    When I go to the "admin"'s edit profile path
    Then I should see "Edit your profile"
    When I select "Sydney" from "user[timezone]"
    And I press "Update"
    Then I should see "User was successfully updated."
    When I go to the "osemdemo" conference's schedule page
    Then I should see "This schedule uses your profile's timezone. (Australia/Sydney UTC +10)"
    And I should see "Sat, May 3"
    When I click on the "next" button
    And I click on the "listDay" button
    Then I should see "Sun, May 4"
    And I should have the following data in the following order: 2:00am - 2:30am, first_scheduled_event, 2:15am - 2:45am, second_scheduled_event, 2:30am - 3:00am, multiple_speaker_event





    