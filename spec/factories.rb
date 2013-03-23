FactoryGirl.define do
  factory :instrument do
    name 'sprt01'
    description 'standard platinum resistance thermometer'
  end

  factory :measurement do
    timestamp Time.parse('2013-03-02 10:12:00')
    unit 'C'
    value '1.0'
    instrument
  end
end
