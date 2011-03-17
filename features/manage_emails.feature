Feature: Manage subscribers
  In order to communicate with fans
  As a Site Admin
  I need to be able to manage fan email addresses

  Scenario: Non logged in user should be able to see subscribers
    Given the following subscribers exist:
      | email                     | name            |
      | t3hjames@gmail.com        | James           |
    When I go to the index page for subscribers
    Then I should not see "James"
    And I should see "Access denied!"

  Scenario: Non logged in user should not see links to subscribers
    When I go to the index page for posts
    Then I should not see "Subscribers"

  Scenario: Non logged in user should not see links to subscribers
    Given the admin user exists
    And I am logged in as that user
    When I go to the index page for posts
    And I follow "Subscribers"
    Then I should be on the index page for subscribers

  Scenario: List subscribers
    Given the admin user exists
    And I am logged in as that user
    And the following subscribers exist:
      | email                     | name            |
      | t3hjames@gmail.com        | James           |
      | sexy_mathers555@gmail.com | Colon L. Mathers|
    When I go to the index page for subscribers
    Then I should see "t3hjames@gmail.com"
    And I should see "sexy_mathers555@gmail.com"
    And I should see "James"
    And I should see "Colon L. Mathers"

