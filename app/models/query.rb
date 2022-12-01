class Query < ApplicationRecord
  belongs_to :user

  validates :query, presence: true

  def update_global_count
    increment(:global_count)
  end
end
