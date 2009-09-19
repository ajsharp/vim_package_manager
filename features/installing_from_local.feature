Feature: Installing a vim plugin from the local filesystem
  In order to make vim even more awesome
  I want to install a plugin from the local filesystem

  Scenario: Installing a local .vim file
    Given a local file fixtures/plugin.vim
    When I run vpm --local fixtures/plugin.vim
    Then the file should be installed
