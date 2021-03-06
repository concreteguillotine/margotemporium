require "rails_helper"

RSpec.feature "Users can sign in" do
    let!(:user) { FactoryBot.create(:user) }

    scenario "with valid credentials" do
        visit "/"
        click_link "Sign in"
        fill_in "Username", with: user.username
        fill_in "Password", with: "password"
        click_button "Log in"

        expect(page).to have_content "Signed in as #{user.username}"
    end
end