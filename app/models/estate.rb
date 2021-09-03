class Estate < ApplicationRecord
  has_many :stations
  accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :all_blank
end
