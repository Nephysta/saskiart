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

  describe 'create' do
    context 'when the correct parameters are provided' do
      it 'create a picture and link it to ideas' do
        ideas = create_list(:idea, 2)
        ideas_ids = ideas.map { |idea| idea.id }
        theme = Theme.new(ideas: ideas)

        expect {
          post :create, params: { image: 'data:image/png;base64,toto', ideas: ideas_ids.to_json }
        }.to change { Picture.count }.by(1)

        expect(JSON.parse(response.body)['theme']).to eq(theme.text)
      end
    end

    context 'when the picture received is not a base64 encoded string' do
      it 'raise an error' do
        ideas = create_list(:idea, 2)
        ideas_ids = ideas.map { |idea| idea.id }

        expect {
          post :create, params: { image: 'data:image/png;base64,toto€', ideas: ideas_ids.to_json }
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
