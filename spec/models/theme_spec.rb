require 'rails_helper'

RSpec.describe Theme, type: :service do
  subject { Theme }

  let!(:idea_object) { Idea.create(category: 'object', text: 'a panda') }
  let!(:idea_action) { Idea.create(category: 'action', text: 'eating ice-cream') }
  let!(:picture) { Picture.create(data: 'mypic') }

  describe '#initialize' do
    it 'works with ideas that has the same category' do
      second_idea_action = Idea.create(category: 'action', text: 'dancing with yo mama')
      theme = Theme.new(ideas: [idea_action, second_idea_action])
      expect(theme.instance_variable_get(:@ideas)).to include(idea_action)
      expect(theme.instance_variable_get(:@ideas)).to include(second_idea_action)
    end

    it 'works with a picture' do
      Theme.new(ideas: [idea_object, idea_action]).attach_picture(picture)
      theme = Theme.new(picture: picture)
      expect(theme.instance_variable_get(:@ideas)).to include(idea_action)
      expect(theme.instance_variable_get(:@ideas)).to include(idea_object)
    end
  end

  describe '#text' do
    it 'concatenate the texts given in one string' do
      expect(Theme.new(ideas: [idea_object, idea_action]).text).to eq('A panda eating ice-cream.')
    end
  end

  describe '#attach_picture' do
    it 'attach the picture given to its themes' do
      Theme.new(ideas: [idea_object, idea_action]).attach_picture(picture)
      expect(idea_object.pictures).to include(picture)
      expect(idea_action.pictures).to include(picture)
    end
  end
end
