class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait


    def title_is_clickbait
            unless title&.include?("Won't Believe" || "Secret" || "Top 10" || "Guess")
                errors.add(:title, "Not clickbaity enough")
            end
    end
end
