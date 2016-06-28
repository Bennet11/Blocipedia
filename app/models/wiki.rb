class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :public_wikis, -> (user) { where(private: false) }
  scope :private_wikis, -> (user) { where(private: true) }

  def public?
    private == false
  end

  def private?
    private == true
  end
end
