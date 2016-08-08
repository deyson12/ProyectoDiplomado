class Appointment < ApplicationRecord
  belongs_to :type_appointment
  belongs_to :user
  belongs_to :doctor
  belongs_to :estate
end
