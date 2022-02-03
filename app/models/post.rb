class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait
    CLICKBAIT_PATTERNS = [
        "Won't Believe",
        "Secret",
        "Top [number]",
        "Guess"
      ]
    
      def clickbait
        unless CLICKBAIT_PATTERNS.none?{ |pat| pat == title }
          errors.add(:title, "must be clickbait")
        end
    end
  


end
