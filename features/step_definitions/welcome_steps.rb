Given("I am on home page") do
  visit root_path
end

When("I click the link {string}") do |string|
  click_button(string)
end

Then("I fill in {string} with {string}") do |string, string2|
  fill_in(string, with: string2)
end

Then("Also I fill in {string} with {string}") do |string, string2|
  fill_in(string, with: string2)
end

When("I click the {string}") do |string|
  click_button(string)
end

Then("I should see the title {string}") do |string|
  find_field(string).value
end