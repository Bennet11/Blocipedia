class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :public_wikis, -> (wikis) { wikis ? all : where(private: false) }
  scope :private_wikis, -> (wikis) { wikis ? all : where(private: true) }

end
