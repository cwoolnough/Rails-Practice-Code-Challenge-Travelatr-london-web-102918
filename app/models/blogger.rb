class Blogger < ApplicationRecord
    has_many :posts
    has_many :destination, through: :posts

    validates :name, presence: true
    validates :name, uniqueness: true 

    validates :age, numericality: { greater_than: 0 } 
    validates :bio, length: { minimum: 30 }


    def total_likes
        likes = 0 
        self.posts.each do |post| 
            likes = likes + post.likes   
        end 
        likes
    end

    def most_likes
        self.posts.max_by do |post|
            post.likes
        end 
    end 

end
