class Blog < ApplicationRecord 
    validates :title, presence: true, length: {in: 1..30}
    validates :content, presence: true, length: {in: 1..140}
end
