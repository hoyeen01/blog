class User < ApplicationRecord
    validates :first_name, :last_name, :email, :user_name, :password_digest, presence: true
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'is not valid'}
    validates :email, :user_name, uniqueness: true
    
    has_secure_password

    has_many :articles, dependent: :destroy

    def full_name
        return "#{first_name} #{last_name}"
      end
    
    def self.total_users
       return User.all.count
    end
end
