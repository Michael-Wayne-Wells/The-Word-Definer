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
