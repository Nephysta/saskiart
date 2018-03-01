module ThemeService
  class << self
    def compose
      random_ideas
    end

    private

    def random_ideas
      [
        Idea.where(category: 'object').order('RANDOM()').limit(1).first,
        Idea.where(category: 'action').order('RANDOM()').limit(1).first
      ]
    end
  end
end
