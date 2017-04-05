feature 'add tags' do
  xscenario 'to links' do
    # Tag.create(name: 'search', link_id: 'Makers Academy')
    visit('/links')
    click_button 'new'
    fill_in 'Title', with: 'Google'
    fill_in 'Link', with: 'www.google.com'
    fill_in 'Tag', with: 'search'
    click_button 'submit'
    within 'ul#links' do
      expect(page).to have_content('Google www.google.com search')
    end
  end
end
