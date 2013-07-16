class Feedback
  include ActiveModel::Conversion
  include ActiveModel::Validations

  ATTRIBUTES = [:email, :message]
  EMAIL_PATTERN = /\A([a-z0-9\-\_\.\+]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  attr_accessor *ATTRIBUTES

  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end
  end

  validates :email, :message, :presence => true
  validates_format_of :email, :with => EMAIL_PATTERN

  # Forms are never themselves persisted
  def persisted?
    false
  end

  def save
    if valid?
      AppMailer.contact_form(email, message).deliver
    else
      false
    end
  end
end
