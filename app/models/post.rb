class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true, allow_blank: false
    validates :content, length: {minimum: 100}

    def self.recent_posts
        self.order(created_at: :desc)
    end

    def get_blogger_obj_by_name(name)
        Blogger.find_by(name: name)
    end

    def like_post
        self.likes += 1
        self.save
    end

end
