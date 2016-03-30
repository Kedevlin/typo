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

  Scenario: Cannot View Merge Form for New Articles as an Admin
    Given I am on the admin content page
    And I am logged into the admin panel
    When I follow "New Article"
    Then I should not see "Merge Articles"

  Scenario: Cannot View Merge Form as a Non-admin
    Given I am on the admin content page
    And I am logged in as a non-admin user
    When I follow "Hello World!"
    Then I should not see "Merge Articles"

  Scenario: Merge Two Articles as an Admin
    Given I am on the admin content page
    And I am logged into the admin panel
    And a second article exists
    When I follow "Hello World!"
    And I enter "2" into the "merge_with" input field
    And I press "Merge"
    Then I should see "Articles have been merged!"

  Scenario: Cannot Merge Two Articles as an Admin when Article does not Exist
    Given I am on the admin content page
    And I am logged into the admin panel
    When I follow "Hello World!"
    And I enter "2" into the "merge_with" input field
    And I press "Merge"
    Then I should see "Article with id of 2 does not exist!"

  Scenario: Cannot Merge the same Two Articles
    Given I am on the admin content page
    And I am logged into the admin panel
    When I follow "Hello World!"
    And I enter "1" into the "merge_with" input field
    And I press "Merge"
    Then I should see "Cannot merge an article with itself!"
