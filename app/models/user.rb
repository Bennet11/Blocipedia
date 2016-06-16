class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis, dependent: :destroy

  after_initialize :default_role

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  private

  def default_role
    self.role ||= 'standard'
  end
end
