class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  before_validation :assign_role
  validates :email, presence: true
  validates :name, presence: true

  def assign_role
    self.role = Role.find_by_name('User') if self.role.nil? end

  def superuser?
    self.role.name == "Superuser" if !self.role.blank?
  end

  def user?
    self.role.name == "User" if !self.role.blank?
  end
end
