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
    Given I sign in with username "admin" and password "password123" 
    When I go to the "admin"'s edit profile path
    Then I should see "Edit your profile"
    When I select "Sydney" from "user[timezone]"
    And I press "Update"
    Then I should see "User was successfully updated."

@javascript
Scenario: View schedule using the user's timezone
    Given I sign in with username "admin" and password "password123"
    When I go to the "osemdemo" conference's schedule page
    Then I should see "This schedule uses your profile's timezone. (Australia/Sydney UTC +10)"
    And I should see "Sat, May 3"
    When I click on the "next" button
    And I click on the "listDay" button
    Then I should see "Sun, May 4"
    And I should have the following data in the following order: 1:00am - 1:30am, first_scheduled_event, 1:15am - 1:45am, second_scheduled_event, 1:30am - 2:00am, multiple_speaker_event





    