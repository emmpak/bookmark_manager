feature 'add tags' do
  scenario 'to links' do
    visit('/links')
    click_button 'new'
    fill_in 'Title', with: 'Google'
    fill_in 'Link', with: 'www.google.com'
    fill_in 'Tag', with: 'search'
    click_button 'submit'
    within 'ul#links' do
      expect(page).to have_content('search')
    end
  end
end
