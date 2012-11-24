class Patient < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :date_of_birth, :first_name, :gender, :health_id, :last_name, :phone
  
  has_secure_password
  has_many :appointments
  
  validates_presence_of :password, :on => :create
  validates :email, :date_of_birth, :first_name, :gender, :health_id, :last_name, :phone, :presence => true
  validates_inclusion_of :gender, :in => %[Male Female], :message => "is not an option", :allow_nil => true, :allow_blank => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid form for an email-address"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]\d{4}[-.]\d{4})$/, :message => "should be 11 digits (country code needed) and delimited with appropiate symbols"

  Gender_List = [['Male'], ['Female']]

end