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
    
  #Scenario: New attribute value page
  #Given I have disease attributes named Skeletal Damage
  #When I go authenticated to the disease attribute show page for "Skeletal Damage"
  #And I follow "Add a Value"
  #Then I should see "Skeletal Damage"
  #
  #Scenario: Create a new attribute value for a disease attribute
  #Given I have no attribute values
  #And I have disease attributes named Skeletal Damage
  #When I go authenticated to the disease attribute show page for "Skeletal Damage"
  #And I follow "Add a Value"
  #And I fill in "Value" with "New Value"
  #And I press "Save changes"
  #Then I should see "New Value"
  #And I should see "Skeletal Damage"
  #And I should have 1 attribute value
  #
  #Scenario: Delete an attribute value
  #Given a disease attribute: "Skeletal Damage" exists with name: "Skeletal Damage"
  #And I have no attribute values
  #And the following attribute values exist:
  #| disease_attribute     |
  #| disease_attribute: "Skeletal Damage" |
  #When I go authenticated to the admin show page for disease attribute: "Skeletal Damage"
  #And I follow "Delete" within ".attribute_values"
  #Then I should have 0 attribute values

