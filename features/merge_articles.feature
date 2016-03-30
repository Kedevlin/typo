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
    Given I am on the new article page
    And I am logged into the admin panel
    Then I should not see "Merge Articles"

  Scenario: Cannot View Merge Form as a Non-admin
    Given I am on the admin content page
    And I am logged in as a non-admin user
    When I follow "Hello World!"
    Then I should not see "Merge Articles"

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

  Scenario: Merge Two Articles as an Admin
    Given I am on the admin content page
    And I am logged into the admin panel
    And a second article exists
    When I follow "Hello World!"
    And I enter "2" into the "merge_with" input field
    And I press "Merge"
    Then I should see "Articles have been merged!"
    And I should not see "Second Article Title"

  Scenario: Merged Articles Contain Text of Both Articles and Title of the First
    Given I am on the admin content page
    And I am logged into the admin panel
    And a second article exists
    And I have merged the initial article with the second article
    When I follow "Hello World!"
    Then I should see "Hello World!" in the "article_title" field
    And I should see "Welcome to Typo. This is your first article. Edit or delete it, then start blogging! Second Article Content." in the "article_body_and_extended" field

  Scenario: Merged Articles Have Comments of Both Articles
    Given I am on the admin content page
    And I am logged into the admin panel
    And a second article exists
    And I have merged the initial article with the second article
    When I follow "Show"
    Then I should see "1 comment"

  Scenario: Merged Articles Have the Author and Title of the First Article
    Given I am on the admin content page
    And I am logged into the admin panel
    And a second article exists
    And I have merged the initial article with the second article
    Then I should see "admin" in the "tr" field
