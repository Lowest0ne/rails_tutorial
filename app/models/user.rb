# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates_presence_of :name
  validates_length_of   :name, maximum: 50

  validates_presence_of   :email
  validates_format_of     :email, with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_uniqueness_of :email, case_sensitive: false

  before_save { email.downcase! }

  validates_presence_of :password
  validates_length_of   :password,  minimum: 6

  validates_presence_of :password_confirmation
  after_validation { self.errors.messages.delete(:password_digest) }


end
