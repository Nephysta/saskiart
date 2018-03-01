class Theme
  def initialize
    info = ThemeService.compose
    @ideas = info[:ideas]
  end

  def attach_picture(picture)
    @ideas.each do |idea|
      idea.pictures << picture
      idea.save
    end
  end
end
