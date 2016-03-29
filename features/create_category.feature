Feature: Create Categories
  As a blog administrator
  In order to categorize my articles
  I want to be able to create new categories

  Background:
     Given the blog is set up
     And I am logged into the admin panel

  Scenario: View Categories Page
    Given I am on the admin dashboard page
    When I follow "Categories"
    Then I should see "Categories"

  Scenario: Create New Category Requires Name
    Given I am on the admin categories page
    When I press "Save"
    Then I should see "Category could not be saved."

  Scenario: Create New Category Requires Unique Name
    Given I am on the admin categories page
    And a category named "test" already exists
    When I enter "test" into the "category_name" input field
    And I press "Save"
    Then I should see "Category could not be saved."
