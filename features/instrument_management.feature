Feature: A metrologist can manage instruments

  Scenario: Instruments list
    Given I have the following "instrument" records
      | name   | description                     |
      | sprt01 | Standard Platinum Resistance 01 |
      | rtd01  | Resistance Thermal Detector 01  |
    When I list "instruments"
    Then I should see "sprt01"
    And I should see "Standard Platinum Resistance 01"
    And I should see "rtd01"
    And I should see "Resistance Thermal Detector 01"

  Scenario: Create valid instrument
    Given I have no "instruments"
    And I list "instruments"
    When I follow "New Instrument"
    And I fill in "Name" with "sprt01"
    And I fill in "Description" with "Standard Platinum Resistance 01"
    And I press "Create"
    Then I should see "Instrument was successfully created."
    And I should see "sprt01"
    And I should see "Standard Platinum Resistance 01"
    And I should have 1 "instrument"

  Scenario: Edit an instrument
    Given I have only one "instrument" named "sprt01"
    And I list "instruments"
    When I follow "sprt01"
    And I follow "Edit"
    And I fill in "Name" with "sprt02"
    And I press "Update"
    Then I should see "Instrument was successfully updated."
    And I should see "sprt02"
    And I should have 1 "instrument"

  Scenario: Destroy an instrument
    Given I have only one "instrument" named "sprt01"
    And I list "instruments"
    When I follow "sprt01"
    And I follow "Destroy"
    Then I should see "Instrument was successfully destroyed."
    And I should not see "sprt01"
    And I should have 0 "instruments"
