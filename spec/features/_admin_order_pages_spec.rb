require 'rails_helper'

describe 'User creates an order' do

  before :each do
    visit root_path
    click_link 'Sign-In'
    fill_in 'user_email', with: 'meemaw@gnf.com'
    fill_in 'user_password', with: 'Password1'
    click_button 'Log in'
  end
  
  it 'Shows the admin all orders made' do
    visit root_path
    click_link 'All Orders'
    save_and_open_page
    expect(page).to have_content 'ORDER num.'
  end
end