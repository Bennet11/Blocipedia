class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators

  scope :visible_to, -> (user) { user && ((user.role == "admin") || (user.role == "premium")) ? all : where(private: false) }
  scope :private_wikis, -> (user) { where(private: true) }
  def public?
    private == false
  end

  def private?
    private == true
  end
end
