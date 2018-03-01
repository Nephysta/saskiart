class Theme
  def initialize(ideas: nil)
    @ideas = ideas || ThemeService.compose
  end

  def attach_picture(picture)
    @ideas.each do |idea|
      idea.pictures << picture
      idea.save
    end
  end

  def text
    "#{@ideas.map(&:text).join(' ')}.".capitalize
  end
end
