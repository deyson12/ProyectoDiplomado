class Doctor < ApplicationRecord
  belongs_to :estate
  belongs_to :clinic
  belongs_to :level_doctor
end
