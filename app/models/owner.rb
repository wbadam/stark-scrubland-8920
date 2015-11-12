class Owner < ActiveRecord::Base

  belongs_to :user

  has_many :dogs, :dependent => :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :postal_address, presence: true

end
