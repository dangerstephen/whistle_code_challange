require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  describe "POST#create" do
    it "creates a Dog" do
      expect do
        post :create, dog: { name: "Barkley",
        image_src: "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Common-dog-behaviors-explained.jpg?itok=FSzwbBoi"
       }
      end.to change { Dog.count }.by 1

      expect(Dog.last.name).to eq "Barkley"
    end

    it "returns 201 and renders the Dog attributes" do
      post :create, dog: {
        name: "Barkley",
        image_src: "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Common-dog-behaviors-explained.jpg?itok=FSzwbBoi",
        bio: "Woof"
    }
      expect(response.status).to eq 201

      response_json = JSON.parse(response.body)
      expect(response_json["id"]).to be_present
      expect(response_json["name"]).to eq "Barkley"
      expect(response_json["image_src"]).to eq "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Common-dog-behaviors-explained.jpg?itok=FSzwbBoi"
      expect(response_json["bio"]).to eq "Woof"

    end
  end
end
