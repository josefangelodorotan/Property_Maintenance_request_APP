class Task < ApplicationRecord
  belongs_to :category

  attribute :completed, :boolean, default: false

end
