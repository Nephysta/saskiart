require 'rails_helper'

RSpec.describe ThemeService, type: :service do
  subject { ThemeService }

  describe '#compose' do
    let!(:idea_object) { Idea.create(category: 'object', text: 'a panda') }
    let!(:idea_action) { Idea.create(category: 'action', text: 'eating ice-cream') }

    it 'return an hash with the correct keys and values' do
      expect(subject.compose).to eq([idea_object, idea_action])
    end
  end
end
