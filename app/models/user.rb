class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable ,:recoverable :trackable ,:recoverable , :registerable
  devise :database_authenticatable, :rememberable, :validatable 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me,:nome,:email
  # attr_accessible :title, :body, :email
end
