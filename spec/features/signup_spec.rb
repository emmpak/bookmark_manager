feature 'User Signs up' do
  scenario 'signup' do
    visit '/users/new'
    fill_in 'email', with: "bob@gmail.com"
    fill_in 'password', with: '1234'
    click_button 'Submit'
    expect(current_path).to eq ('/links')
    expect(page).to have_content('Welcome, bob@gmail.com')
    expect(User.count).to eq 1
  end
end
