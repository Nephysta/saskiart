require 'rails_helper'

RSpec.describe Picture, type: :model do
  it 'is valid with valid attributes' do
    expect(
      Picture.new(data: 'data:image/png;base64,imagedechatonmignon')
    ).to be_valid
  end

  it 'is not valid without data' do
    expect(
      Idea.new()
    ).to_not be_valid
  end
end
