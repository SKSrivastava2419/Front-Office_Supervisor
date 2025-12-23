Feature: Login Funcationality FO Supervisor

  Scenario: Successful login with valid  credentials
    When the user enters username "SKM_FO"
    And the user enters password "Skm@123456"
    And the user clicks the Sign In button
    Then the user should login sucessfully.

  Scenario: Non-supervisor role cannot access supervisor portal
    When the user enters username "agent.fo@example.com"
    And the user enters password "ValidAgent123!"
    And the user clicks the Sign In button
    Then the user remains on the login page
    And an error message "The username/password entered is invalid. Usernames and passwords are case sensitive." should displayed
    And no session is created


  Scenario Outline: Login fails with invalid credentials
    When the user enters username "<username>"
    And the user enters password "<password>"
    And the user clicks the Sign In button
    Then the user remains on the login page
    And an error message "Invalid username or password." is displayed
    And the password field is cleared
    And the Sign In button remains enabled

    Examples:
      | username                      | password         |
      | supervisor.fo@example.com     | wrongpass        |
      | wronguser@example.com         | ValidPass!234    |
      | supervisor.fo@example.com     |                  |
      |                               | ValidPass!234    |
      |                               |                  |

  Scenario: User initiates Forgot Password
    When the user clicks the Forgot Password link
    Then the user is redirected to "/Forgot Password"
    And the page displays "Request password Reset"

