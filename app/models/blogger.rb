class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}
    validates :age, numericality: { only_integer: true, greater_than: 1, less_than: 121}

    def total_likes
        total_likes = 0
        self.posts.each do |post|

            total_likes += post.likes
        end
        total_likes
    end

    def most_liked
        self.posts.order(likes: :desc).first
    end

end
