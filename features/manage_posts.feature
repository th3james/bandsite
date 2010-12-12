Feature: Manage posts
  In order keep fans up to date about the band
  As a Site Admin
  I want to create and manage news posts

  Scenario: list posts on homepage
    Given the following posts exist:
      | title       | body      |
      | "title_one" | "body_one"|
      | "title_two" | "body_two"|
    When I go to the index page for posts
    Then I should see "title_one"
    And I should see "body_one"
    And I should see "title_two"
    And I should see "body_two"

  Scenario: Non logged in user should not see logout and new post
    When I go to the index page for posts
    Then I should not see "Logout"
    And I should not see "New post"

  Scenario: Admin user should see create new post link
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for posts
    Then I should see "Logout"
    And I should see "New post"

  Scenario: Admin user should be able to create new news posts
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for posts
    And I follow "New post"
    And I fill in "Title" with "New News"
    And I fill in "Body" with "Body of news"
    And I press "Update"
    Then I should see "Body of news"
    And I should see "New News"
    And I should be on the show page for that post

  Scenario: Admin user created news posts should appear on the homepage
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for posts
    And I follow "New post"
    And I fill in "Title" with "New News on homepage"
    And I fill in "Body" with "Body of news on homepage"
    And I press "Update"
    And I go to the home page
    Then I should see "Body of news on homepage"
    And I should see "New News on homepage"
    
  Scenario: Edit a post
    Given I have no posts
    And a post exists with title: "Old title", body: "hats"
    And the admin user exists
    And I am logged in as that user
    When I go to the index page for posts
    And I follow "Edit"
    And I fill in "Title" with "New Title"
    And I press "Update"
    Then I should see "New Title"
    Then I should not see "Old title"

