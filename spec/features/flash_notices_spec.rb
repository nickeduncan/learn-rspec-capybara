require 'spec_helper'

describe "Flash Notices", js: true do
  before do
    # When an unauthenticated user visits
    # the edit_user_registration_path they
    # are redirected with a flash notice
    visit edit_user_registration_path
  end

  it "can be dismissed by the user" do
    # check that the flash message exists
    expect(page).to have_content("You need to sign in or sign up before continuing.")
    # click to close the flash message
    within('.alert') do
      find('.close').click
    end
    # check that the flash message is gone
    expect(page).to_not have_content("You need to sign in or sign up before continuing.")
  end
end
