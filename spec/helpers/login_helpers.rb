module LoginHelpers
  def successful_login user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def failed_login user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: ""
    click_button 'Log in'
  end
end
