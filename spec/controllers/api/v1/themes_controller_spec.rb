require 'rails_helper'

RSpec.describe Api::V1::ThemesController, type: :controller do
  describe 'show' do
    it 'return a random theme' do
      ideas = []
      ideas << create(:idea, category: 'object')
      ideas << create(:idea, category: 'action')
      theme = Theme.new(ideas: ideas)

      get :show
      expect(JSON.parse(response.body)).to match(
        'id' => theme.id,
        'text' => theme.text
      )
    end
  end
end
