class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :email, :on => :create
  attr_accessible :name, :password, :password_confirmation, :email

  has_many :sent_cards,
           class_name: 'Postcard',
           foreign_key: "sender_id"
  has_many :received_cards,
           class_name: 'Postcard',
           foreign_key: "receiver_id"
end
