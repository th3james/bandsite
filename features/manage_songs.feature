Feature: Manage songs
  In order keep fans up to date about the band
  As a Site Admin
  I want to create and manage news songs

  Scenario: list songs on homepage
    Given the following songs exist:
      | name       | url           |
      | "song one" | "embed url 1" |
      | "song two" | "embed url 2" |
    When I go to the index page for songs
    Then I should see "song one"
    And I should see "embed url 1"
    And I should see "song two"
    And I should see "embed url 2"

  Scenario: Non logged in user should not see logout and new song
    When I go to the index page for songs
    Then I should not see "Logout"
    And I should not see "New song"

  Scenario: Admin user should see create new song link
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for songs
    Then I should see "Logout"
    And I should see "New song"

  Scenario: Admin user should be able to create new news songs
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for songs
    And I follow "New song"
    And I fill in "Name" with "Ash used escape rope"
    And I fill in "Url" with "embed url"
    And I press "Update"
    Then I should see "Ash used escape rope"
    And  I should see "embed url"
    And I should be on the show page for that song

  Scenario: Admin user created news songs should appear on the homepage
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for songs
    And I follow "New song"
    And I fill in "Name" with "Tell me to shut up"
    And I fill in "Url" with "embed url tell me"
    And I press "Update"
    And I go to the index page for songs
    Then I should see "Tell me to shut up"
    And I should see "embed url tell me"
    
  Scenario: Edit a song
    Given I have no songs
    And a song exists with name: "Old name"
    And the admin user exists
    And I am logged in as that user
    When I go to the index page for songs
    And I follow "Edit"
    And I fill in "Name" with "New Name"
    And I press "Update"
    Then I should see "New Name"
    Then I should not see "Old name"

  Scenario: Delete a song
    Given I have no songs
    And a song exists with name: "Song to delete"
    And the admin user exists
    And I am logged in as that user
    When I go to the index page for songs
    And I follow "Delete"
    Then I should not see "Song to delete"
