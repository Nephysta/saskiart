require 'rails_helper'

RSpec.describe Api::V1::PicturesController, type: :controller do
  describe 'index' do
    context 'when there is no filters' do
      it 'return the pictures with a limit of 4' do
        pictures = create_list(:picture, 3)
        get :index
        expect(JSON.parse(response.body).count).to eq(3)

        create_list(:picture, 2)
        get :index
        expect(JSON.parse(response.body).count).to eq(4)
      end
    end

    context 'when there is a limit filter' do
      it 'return 2 the pictures with a limit of 2' do
        create_list(:picture, 6)
        get :index, params: { limit: 2 }
        expect(JSON.parse(response.body).count).to eq(2)
      end

      it 'return 4 the pictures with a limit of 5' do
        create_list(:picture, 6)
        get :index, params: { limit: 5 }
        expect(JSON.parse(response.body).count).to eq(4)
      end
    end

    context 'when there is an idea filter' do
      it 'return the corresponding picture when the idea match' do
        picture = create(:picture)
        ideas = create_list(:idea, 2)
        theme = Theme.new(ideas: ideas)
        theme.attach_picture(picture)

        get :index, params: { ideas: [ideas.first.id] }
        expect(JSON.parse(response.body).count).to eq(1)
      end

      it "doesn't return any pictures when the idea doesn't match" do
        picture = create(:picture)
        ideas = create_list(:idea, 2)
        theme = Theme.new(ideas: ideas)
        theme.attach_picture(picture)

        get :index, params: { ideas: 42 }
        expect(JSON.parse(response.body).count).to eq(0)
      end
    end
  end
end
