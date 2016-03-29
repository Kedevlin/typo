Feature: Edit Categories
  As a blog administrator
  In order to categorize my articles
  I want to be able to edit existing categories

  Background:
     Given the blog is set up
     And I am logged into the admin panel
     And I am on the admin categories page

  Scenario: Edit Category Requires Unique Name
    Given I am on the admin categories page
    And a category named "test" already exists
    When I follow "General"
    And I enter "test" into the "category_name" input field
    And I press "Save"
    Then I should see "Category could not be saved."
