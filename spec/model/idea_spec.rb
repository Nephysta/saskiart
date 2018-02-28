require 'rails_helper'

RSpec.describe Idea, type: :model do
  it 'is valid with valid attributes' do
    expect(
      Idea.new(category: 'object', text: 'a tester')
    ).to be_valid
  end

  it 'is not valid without a text' do
    expect(
      Idea.new(category: 'object')
    ).to_not be_valid
  end

  it 'is not valid without a category' do
    expect(
      Idea.new(text: 'a tester')
    ).to_not be_valid
  end

  it 'is not valid without a category and a text' do
    expect(
    Idea.new(gender: "none")
    ).to_not be_valid
  end
end
