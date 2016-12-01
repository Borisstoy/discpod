class Episode < ApplicationRecord
  # thanks to podcast:refernece in db migration
  belongs_to :podcast
end
