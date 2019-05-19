class Pv < ApplicationRecord
  belongs_to :site
  validates :url, presence: true
end
