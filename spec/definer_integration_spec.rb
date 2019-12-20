require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a a new word', {:type => :feature}) do
  it('adds word and returns to word list') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('word', :with => 'dialectics')
    click_on('Submit!')
    expect(page).to have_content('dialectics')
  end
end
describe('add a a new definition', {:type => :feature}) do
  it('adds word and returns to word list') do
    visit('/words')
    click_on('dialectics')
    fill_in("new_def", :with => "fighting words")
    click_on('Submit')
    expect(page).to have_content('fighting words')
  end
end
describe('add a a new definition', {:type => :feature}) do
  it('adds word and returns to word list') do
    visit('/words')
    click_on('dialectics')
    click_on('Edit/Delete')
    fill_in("new_def", :with => "boring words")
    click_on('Update!')
    expect(page).to have_content("boring words")
  end
end
describe('add a a new definition', {:type => :feature}) do
  it('adds word and returns to word list') do
    visit('/words')
    click_on('dialectics')
    click_on('Edit/Delete')
    click_on('Delete definition!')
    expect(page).to have_content("You have not entered any words yet!")
  end
end
