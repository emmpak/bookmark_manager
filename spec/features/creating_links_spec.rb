feature 'add links' do
  scenario "adds the site's address and title" do
    visit('/links')
    click_button 'new'
    fill_in 'Link', with: 'www.google.com'
    fill_in 'Title', with: 'Google'
    click_button 'submit'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
