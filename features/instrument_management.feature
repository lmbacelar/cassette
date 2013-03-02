Feature: A metrologist can manage instruments

  Scenario: Instruments list
    Given I have these instruments named Sprt01, Rtd01
    When I list instruments
    Then I should see "Sprt01"
    And I should see "Rtd01"

  Scenario: Create valid instrument
    Given I have no instruments
    And I list instruments
    When I follow "New Instrument"
    And I fill in "Name" with "Sprt01"
    And I press "Create"
    Then I should see "Instrument was successfully created."
    And I should see "Sprt01"
    And I should have 1 instrument

  Scenario: Edit an instrument
    Given I have only this instrument named Sprt01
    And I list instruments
    When I follow "Sprt01"
    And I follow "Edit"
    And I fill in "Name" with "Sprt02"
    And I press "Update"
    Then I should see "Instrument was successfully updated."
    And I should see "Sprt02"
    And I should have 1 instrument

  Scenario: Destroy an instrument
    Given I have only this instrument named Sprt01
    And I list instruments
    When I follow "Sprt01"
    And I follow "Destroy"
    Then I should see "Instrument was successfully destroyed."
    And I should not see "Sprt01"
    And I should have 0 instruments
