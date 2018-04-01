class User < ApplicationRecord
  devise :confirmable, :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
end
