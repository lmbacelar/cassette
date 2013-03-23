Feature: Manage instrument's measurements

  Scenario: View measurements of instrument
    Given I have one "instrument" named "sprt01"
    And I have the following "measurement" records for "instrument" named "sprt01"
      | timestamp           | value | unit |
      | 2013-03-02 11:01:00 | 273.1 | K    |
      | 2013-03-02 11:01:10 | 269.9 | K    |
    When I list "measurements" for "instrument" named "sprt01"
    Then I should see "sprt01"
    And I should see "2013-03-02"
    And I should see "11:01:00"
    And I should see "273.1"
    And I should see "K"
    And I should see "11:01:10"
    And I should see "269.9"

  Scenario: Add measurement to instrument
    Given I have one "instrument" named "sprt01"
    And I am on the page of "instrument" named "sprt01"
    When I follow "all" on the "measurements" element
    And I follow "New Measurement"
    And I fill in "Timestamp" with "2013-03-02 13:23:10"
    And I fill in "Value" with "1.1"
    And I fill in "Unit" with "ºC"
    And I press "Create"
    Then I should see "Measurement was successfully created."
    And I should see "sprt01"
    And I should see "2013-03-02"
    And I should see "13:23:10"
    And I should see "1.1"
    And I should see "ºC"


  Scenario: Remove readings from instrument
    Given I have one "instrument" named "sprt01"
    And I have the following "measurement" records for "instrument" named "sprt01"
      | timestamp           | value | unit |
      | 2013-03-02 11:01:00 | 273.1 | K    |
    And I am on the page of "instrument" named "sprt01"
    When I follow "all" on the "measurements" element
    And I follow "Destroy"
    Then I should have 0 "measurements"
