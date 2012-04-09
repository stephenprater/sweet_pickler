@new
Feature: Test Feature
  In order to test this feature
  As a sweet pickler
  I want to be able to parse this file

  Background:
    Given thing one
    And thing two
    When step 1
    And step 2

  @tag3 
  Scenario: I am a test scenario
    Given I have parsed this file
    When I parse this file
    Then there should be an AST representation of it in memory

  @tag4 
  Scenario Outline: I am a outlines scenario
    Given I have some <options>
    When I go through those options with <values>
    Then they should be reflected in the AST, natch 

    Examples:
      | options | values |
      | 1       | a      |
      | 2       | b      |
      | 3       | c      |

  Scenario: I am a test scenarios with a bunch of ands
    Given This thing
    And this other thing
    But not this
    When this action
    And this other action
    But not this action 
    Then this outcome
    And this other outcome
    But not this outcome

  @tag2
  Scenario: Multiline arguments
    Given A bunch of stuff:
      | key | value |
      | x   | a     |
      | y   | b     |
      | z   | c     |
    When I just did that 
    Then it happens

  @tag1
  Scenario: I do a pystring thing
    Given A pystring with:
    """
    blah blah 
    blah blah
    blah blah blah
    blah. oh blah? malkovitch?
    """
    When I malkovitch
    Then it's malkovitched
