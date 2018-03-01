class Theme
  def initialize
    info = ThemeService.compose
    @ideas = info[:ideas]
  end
end
