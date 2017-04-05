feature 'filters tags' do
  scenario 'User filters by bubbles' do
    visit('/links')
    click_button 'new'
    fill_in 'Title', with: 'Google'
    fill_in 'Link', with: 'www.google.com'
    fill_in 'Tag', with: 'search'
    click_button 'submit'
    click_button 'new'
    fill_in 'Title', with: 'Bubble Shooter'
    fill_in 'Link', with: 'http://www.shooter-bubble.com/'
    fill_in 'Tag', with: 'bubbles'
    click_button 'submit'
    visit('/tags/bubbles')
    expect(page).not_to have_content 'Google'
    expect(page).to have_content 'Bubble Shooter'
  end

  scenario 'User filters by search' do
    visit('/links')
    click_button 'new'
    fill_in 'Title', with: 'Google'
    fill_in 'Link', with: 'www.google.com'
    fill_in 'Tag', with: 'search ,engine'
    click_button 'submit'
    visit('/tags/search')
    expect(page).to have_content 'Google'
    visit('/tags/engine')
    expect(page).to have_content 'Google'
  end
end
