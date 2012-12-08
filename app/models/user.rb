class User < ActiveRecord::Base
   
  # Includes default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :city, :gmaps, :latitude, :longitude
  attr_accessible :id
  
  after_create :assign_default_role

  def assign_default_role
    add_role(:user)
  end
  
  
  acts_as_gmappable

  def gmaps4rails_address
  # describes how to retrieve the address from model
    city
  end
  
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  rolify
end