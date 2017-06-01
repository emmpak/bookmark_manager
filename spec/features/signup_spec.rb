feature 'User Signs up' do
  scenario 'signup' do
    visit '/users/new'
    fill_in 'email', with: "bob@gmail.com"
    fill_in 'password', with: '1234'
    fill_in 'password_confirmation', with: '1234'
    click_button 'Submit'
    expect(current_path).to eq ('/links')
    expect(page).to have_content('Welcome, bob@gmail.com')
    expect(User.count).to eq 1
  end

  scenario 'signup with mismatching passwords' do
    visit '/users/new'
    fill_in 'email', with: "bob@gmail.com"
    fill_in 'password', with: '1234'
    fill_in 'password_confirmation', with: '12345'
    click_button 'Submit'
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
    expect(User.count).to eq 0
  end

  scenario 'signup without an email' do
    visit '/users/new'
    fill_in 'password', with: '1234'
    fill_in 'password_confirmation', with: '1234'
    click_button 'Submit'
    expect(current_path).to eq('/users')
    expect(User.count).to eq 0
  end

  scenario 'signup with invalid email' do
    visit '/users/new'
    fill_in 'email', with: "bobgmail"
    fill_in 'password', with: '1234'
    fill_in 'password_confirmation', with: '1234'
    click_button 'Submit'
    expect(current_path).to eq('/users')
    expect(User.count).to eq 0
  end

  scenario 'signup with an existing email' do
    visit '/users/new'
    User.create(email: "bob@gmail.com")
    fill_in 'email', with: "bob@gmail.com"
    fill_in 'password', with: '1234'
    fill_in 'password_confirmation', with: '1234'
    click_button 'Submit'
    expect(current_path).to eq('/users')
    expect(page).to have_content('An account with this email already exists')
    expect(User.count).to eq 1
  end
end
