Given /^I have the following (.*) records$/ do |factory, table|
  table.hashes.each do |hash|
    FactoryGirl.create factory, hash
  end
end

Given /^I have one (.*) named (.*)$/ do |factory, name|
  FactoryGirl.create factory, name: name
end

Given /^I have no (.*)/ do |model|
  model.singularize.capitalize.constantize.delete_all
end

Given /^I have only one (.*) named (.*)$/ do |model, name|
  step "I have no #{model}"
  step "I have one #{model} named #{name}"
end

Then /^I should have (\d+) (.*)s?$/ do |count, model|
  expect(model.singularize.capitalize.constantize.count).to eq count.to_i
end
When /^I list (.*)$/ do |model|
  visit eval("#{model}_path")
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

When /^I follow the "([^\"]*)" link for "([^\"]*)"$/ do |link, cell_value|
  within "//*[.//text()='#{cell_value}' and .//a[text()='#{link}']]" do |scope|
    scope.click_link link
  end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, text|
  fill_in field, with: text
end

When /^I press "(.*?)"$/ do |button|
  click_button button
end

