# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  private

    def validate_name_not_including_comma
      name.include? ","
    end
end
