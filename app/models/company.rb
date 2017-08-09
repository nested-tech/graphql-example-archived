class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :catch_phrase, presence: true
end
