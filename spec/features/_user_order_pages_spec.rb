require 'rails_helper'

describe 'User creates an order' do
  before :each do
    visit root_path
    click_link 'Sign-In'
    click_link 'Sign up'
    fill_in 'user_email', with: 'useremail@aol.com'
    fill_in 'user_password', with: 'Password1'
    fill_in 'user_password_confirmation', with: 'Password1'
    click_button 'Sign up'
    click_link 'Place Order'
    click_button 'Start Order'
    click_link 'Add new Item'
  end

  it "Signed in user can create an order with burger" do
  click_link "Burger"
  check 'item_toppings_bacon'
  click_button 'Add Burger to Order'
  click_link 'Checkout'
  click_button 'Place Order'
  expect(page).to have_content 'All Orders for User'
  end

  it "Signed in user can create an order with pizza" do
    click_button "Pizzas"
    check 'pepperoni'
    click_button 'Add Pizza to Order'
    click_link 'Checkout'
    click_button 'Place Order'
    expect(page).to have_content 'All Orders for User'
  end

  it "Signed in user can create an order with salad" do
    click_link "Salads"
    check 'item_toppings_caesar'
    click_button 'Add Salad to Order'
    click_link 'Checkout'
    click_button 'Place Order'
    expect(page).to have_content 'All Orders for User'
  end

  it "Signed in user can create an order with apps_side" do
    click_link "Apps and sides"
    select 'mozzy sticks', from: 'item_app_side'
    click_button 'Add App to Order'
    click_link 'Checkout'
    click_button 'Place Order'
    expect(page).to have_content 'All Orders for User'
  end

  it "Signed in user can create an order with drink" do
    click_link "Drinks"
    select 'beer', from: 'item_drink_type'
    click_button 'Add Drink to Order'
    click_link 'Checkout'
    click_button 'Place Order'
    expect(page).to have_content 'All Orders for User'
  end
end