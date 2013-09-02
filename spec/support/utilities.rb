include ApplicationHelper
include UsersHelper

def valid_signin(user)
  fill_in "session_email", with: user.email
  fill_in "password",      with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

def link_title( goto_link, expect_title )
  click_link goto_link
  check_title( expect_title )
end

def check_title( title )
  page.should have_selector 'title', text: full_title(title)
end
