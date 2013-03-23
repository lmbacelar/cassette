Given /^I have the following "(.*)" records$/ do |factory, table|
  table.hashes.each do |hash|
    FactoryGirl.create factory, hash
  end
end

Given /^I have the following "(.*?)" records for "(.*?)" named "(.*?)"$/ do |child, parent, parent_name, table|
  parent_klass = parent.capitalize.constantize
  table.hashes.each do |hash|
    hash[parent.to_sym] = parent_klass.find_by_name(parent_name)
    FactoryGirl.create child, hash
  end
end

Given /^I have one "(.*)" named "(.*)"$/ do |factory, name|
  FactoryGirl.create factory, name: name
end

Given /^I have no "(.*)"/ do |model|
  model.singularize.capitalize.constantize.delete_all
end

Given /^I have only one "(.*)" named "(.*)"$/ do |model, name|
  step "I have no \"#{model}\""
  step "I have one \"#{model}\" named \"#{name}\""
end

Then /^I should have (\d+) "(.*)"$/ do |count, model|
  expect(model.singularize.capitalize.constantize.count).to eq count.to_i
end
When /^I list "([^\"]*)"$/ do |model|
  visit eval("#{model}_path")
end

When /^I list "([^\"]*)" for "([^\"]*)" named "([^\"]*)"$/ do |children, parent, parent_name|
  parent_klass = parent.capitalize.constantize
  visit eval("#{parent}_#{children}_path(#{parent_klass.find_by_name(parent_name).id})")
end

Then /^I should see "(.*?)"$/ do |keyword|
  expect(page).to have_content keyword
end

Then /^I should not see "(.*?)"$/ do |keyword|
  expect(page).not_to have_content keyword
end

When /^I follow "(.*?)"$/ do |link|
  click_link link
end

When /^I follow "([^\"]*)" on the "([^\"]*)" element$/ do |link, element|
  within(".#{element}") do
    click_link link
  end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, text|
  fill_in field, with: text
end

When /^I press "(.*?)"$/ do |button|
  click_button button
end

Given /^I am on the page of "([^\"]*)" named "([^\"]*)"$/ do |model, name|
  visit eval("#{model}_path(model.capitalize.constantize.find_by_name(name).id)")
end
