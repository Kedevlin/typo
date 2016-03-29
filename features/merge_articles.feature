Feature: Merge Articles
  As a blog administrator
  I want to be able to merge articles

  Background:
    Given the blog is set up

  Scenario: View Merge Form as an Admin
    Given I am on the admin content page
    And I am logged into the admin panel
    When I follow "Hello World!"
    Then I should see "Merge Articles"

  Scenario: Cannot View Merge Form as a Non-admin
    Given I am on the admin content page
    And I am logged in as a non-admin user
    When I follow "Hello World!"
    Then I should not see "Merge Articles"
