class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :private_wikis, -> (user) { where(private: true) }
  scope :public_wikis, -> (user) { where(private: false) }

  def public?
    self.private == false
  end

  def private?
    self.private == true
  end
end
