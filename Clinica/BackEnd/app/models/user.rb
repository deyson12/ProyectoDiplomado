class User < ApplicationRecord
  belongs_to :type_identification
  belongs_to :estate
end
