class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :breed, presence: true

  validate :date_of_birth_cannot_be_in_the_future
  validate :period_must_be_present
  validate :period_value

  def date_of_birth_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end

  def period_must_be_present
    if registered_at.present?
      if !period.present?
        errors.add(:period, "must be defined")
      end
    end
  end

  def period_value
    if period.present?
      if not RegistrationPeriod.find_by_length(period).present?
        errors.add(:period, "wrong value")
      end
    end
  end
end
