Given(/^I am on the homepage of www.MyRapName.com$/) do
	find('h1', :text => "Welcome to MyRapName.com")
end

When(/^I click suggest "(male|female)" rap name$/) do |text|
	if text == "male"
		click_button('Male')
	elsif text == "female"
		click_button('Female')
	end
end

When(/^I enter in a "(first name|last initial)"$/) do |nameType|
	if nameType == "first name"
		name = [*('A'..'Z')].sample(8).join 
		fill_in 'firstname', with: name
	elsif nameType == "last initial"
		lastInitial = [*('A'..'Z')].sample(1).join
		fill_in 'lastinitial', with: lastInitial
	end
end

When(/^I "(enable|disable)" the use nickname box$/) do |text|
	if text == "enable"
		check 'shorten'
	elsif text == 'disable'
		uncheck 'shorten'
	end
end

Then(/^I should be able to enter in a "(First Name|Last Initial)"$/) do |text|
	if text == "First Name"
		name = [*('A'..'Z')].sample(8).join
		assert(fill_in 'firstname', with: name)
	elsif text == "Last Initial"
		initial = [*('A'..'Z')].sample(1).join
		assert(fill_in 'lastinitial', with: initial)
	end
end

Then(/^I validate the input fields are present$/) do |text|
	if text == "First Name:"
		assert(page.has_field?('firstname', type: 'text'))
	elsif text == "Last Initial:"
		assert(page.has_field?('lastinitial', type: 'text'))
	elsif text == "Use Nickname:"
		assert(page.has_field?('shorten', type: 'checkbox'))
	end
end

Then(/^I am asked for a first name$/) do
	assert(page.has_content?('You must enter your first name.'))
end

Then(/^I see "(.*?)" new rap name$/) do |num|
	if num == "one"
		assert(page.find(:xpath, "//body//div//tr[1]"))
	elsif num == "two"
		assert(page.find(:xpath, "//body//div//tr[2]"))
	else 
		fail("Test cases only handle up to two rap names generated.")
	end
end

Then(/Then I should be redirected to "mymobname.com"$/) do |url|
	assert(url == URI.parse(current_url))
end
