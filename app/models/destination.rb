class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts


    def ave_age        
        ## Get Blogger IDs
            all_blogger_ids = []

            self.posts.each do |post|
                all_blogger_ids << post.blogger_id
            end
            all_blogger_ids = all_blogger_ids.uniq
        
        ## Get Bloggers from IDs
            all_bloggers = []

            all_blogger_ids.each do |id|
                all_bloggers << Blogger.find(id)
            end

        ## Get Ages from Bloggers
            ages = []

            all_bloggers.each do |blogger|
                ages << blogger.age
            end

        ## Get Average Age from Age
            ages.sum / ages.count
    end

    def most_liked
        self.posts.order(likes: :desc).first
    end

end
