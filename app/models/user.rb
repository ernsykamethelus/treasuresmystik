class User < ActiveRecord::Base 
    #has_many crystals
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 
    has_secure_password
    has_many :crystals
end
