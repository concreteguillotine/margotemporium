require "rails_helper"

RSpec.feature "Users can vote on Margot posts" do
    let(:user) { FactoryBot.create(:user) }
    let(:post_1) { FactoryBot.create(:post, name: "Chi Ball") }
    let(:post_2) { FactoryBot.create(:post, name: "Dragonmode") }


    before do
        login_as(user)

        visit post_path(post_1)
        within(".votes") do
            find("img[src*='votebtn.png']").click
        end
    end

    scenario "by clicking a link" do

        within(".votes") do
            expect(page).to have_content "1 vote!"
        end
    end

    scenario "posts with the most votes show up at the top" do

        visit "/"

        within(".hof") do
            expect(page).to have_content "Chi Ball"
            expect(page).to have_content "with 1 vote!"
            expect(page).not_to have_content "Dragonmode"
        end
    end

    scenario "clicking the button again takes the vote away" do

    find("img[src*='unvotebtn.png']").click

    within(".votes") do
        expect(page).to have_content "0 votes!"
    end
        
    end
end