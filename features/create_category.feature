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
