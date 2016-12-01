class Episode < ApplicationRecord
  # thanks to podcast:refernece in db migration
  belongs_to :podcast

  # taken paperclip functions from podcast.rb
  # added "episode" before thumbnail
  # ran migration: rails g generate paperclip podcast thumbnail
  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\z/
end
