@current
Feature: Vim Package Manager command line interface
  In order to manage by vim plugins and packages
  I want to type commands from the command line

  Scenario: Starting vpm
    When I run vpm
    Then I should see "Starting vpm"
