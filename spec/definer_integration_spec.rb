require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add a word', {:type => :feature}) do
  it('adds word and returns to word list') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('word', :with => 'dialectics')
    click_on('Submit!')
    expect(page).to have_content('dialectics')
  end
end
describe('add a definition', {:type => :feature}) do
  it('adds a new definition for word and returns to word') do
    visit('/words')
    click_on('dialectics')
    fill_in("new_def", :with => "fighting words")
    click_on('Submit')
    expect(page).to have_content('fighting words')
  end
end
describe('update a definition', {:type => :feature}) do
  it("updates definition and returns to word") do
    visit('/words')
    click_on('dialectics')
    click_on('Edit/Delete')
    fill_in("new_def", :with => "boring words")
    click_on('Update!')
    expect(page).to have_content("boring words")
  end
end
describe('delete a definition', {:type => :feature}) do
  it('removes a definition from a word and returns to word') do
    visit('/words')
    click_on('dialectics')
    click_on('Edit/Delete')
    click_on('Delete definition!')
    expect(page).to have_content("You have not entered any definitions yet!")
  end
end
describe('search for word with partial match', {:type => :feature}) do
  it('returns words that are matches with inputed text') do
    visit('/words')
    fill_in('search', :with => "dia")
    click_on("Search")
    expect(page).to have_content("dialectics")
  end
end

describe('delete a word', {:type => :feature}) do
  it('deletes a word from wordlist and returns to wordlist page') do
    visit('/words')
    click_on('dialectics')
    click_on('Edit/Delete word')
    click_on('Delete word')
    expect(page).to have_content("You have not entered any words yet!")
  end
end
describe('update a word', {:type => :feature}) do
  it('deletes a word from wordlist and returns to wordlist page') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('word', :with => 'dialectics')
    click_on('Submit!')
    click_on('dialectics')
    click_on('Edit/Delete word')
    fill_in("new_name", :with => "doug-talk" )
    click_on('Update!')
    expect(page).to have_content("doug-talk")
  end
end
