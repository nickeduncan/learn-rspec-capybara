require 'spec_helper'

describe "User Sessions" do
  let!(:user) { User.create(email: email, password: password, password_confirmation: password) }
  let(:email) { 'jill@example.com' }
  let(:password) { 'password' }

  before do
    visit root_path
    within('.navbar') { click_link('Sign in') }
  end

  context "failure" do
    before do
      # try to sign in without a password
    end

    it "displays an error message" do
      pending
    end

    it "shows the correct navigation links" do
      # should still see 'Sign in' and 'Sign up'
      # should not see 'Profile' or 'Sign out'
      pending
    end
  end

  context "success" do
    before do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end

    it "displays a welcome message" do
      expect(page).to have_content('Signed in successfully')
    end

    it "shows the correct navigation links" do
      # should not see 'Sign in' and 'Sign up'
      # should see 'Profile' or 'Sign out'
      within('.navbar') do
        expect(page).to have_link('Profile')
        expect(page).to have_link('Sign out')
        expect(page).not_to have_link('Sign up')
        expect(page).not_to have_link('Sign In')
      end
    end
  end
end
