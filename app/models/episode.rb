class Episode < ApplicationRecord
  # thanks to podcast:reference in db migration
  belongs_to :podcast

  # taken paperclip functions from podcast.rb
  # added "episode" before thumbnail
  # ran migration: rails g generate paperclip podcast thumbnail
  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\z/

  # adding mp3 to the episode DB
  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"] }, :file_name => { :matches => [/mp3\Z/]}
end
