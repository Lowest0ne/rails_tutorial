require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "should include the base title" do
      full_title("foo").should =~ /^Ruby on Rails Tutorial Sample App/
    end

    it "should not include a bar for the home page" do
      full_title("").should_not =~ /\|/
    end
  end

  describe "gavatar_for" do

    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: "foobar", password_confirmation: "foobar")
    end

    it "should allow specification of size" do
      gravatar_for(@user, { size: 256 } )
    end

    it "should have a default value for size" do
      gravatar_for( @user )
    end

  end

end
