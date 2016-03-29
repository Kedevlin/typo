Feature: Merge Articles
  As a blog administrator
  I want to be able to merge articles

  Background:
    Given the blog is set up

  Scenario: View Merge Form as an Admin
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "Hello World!"
    Then I should see "Merge Articles"
