module ThemeService
  class << self
    def compose
      ideas = random_ideas

      {
        ideas: ideas,
        text: format_ideas(ideas)
      }
    end

    private

    def random_ideas
      [
        Idea.where(category: 'object').order('RANDOM()').limit(1).first,
        Idea.where(category: 'action').order('RANDOM()').limit(1).first
      ]
    end

    def format_ideas(ideas)
      "#{ideas.map(&:text).join(' ')}.".capitalize
    end
  end
end
