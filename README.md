Requirements

Users stories
•	Users, a.k.a, “Podcasts”, create an account, create podcast and episodes.
•	Other users can “explore” those podcats.
•	Thumbnails upload.
•	MP3 upload.
•	Set up Amazon S3 for file storage.
•	Set up CRUD
•	Authorized Users (AU) can create, edit, update, delete podcast / episode.
•	AU can only view other AU podcasts.

Features
•	pagination
•	devise
•	authentication
•	file upload

DATA

PODCASTS has_many :episodes
•	email
•	password
•	title
•	description
•	thumbnail
•	episodes count
•	links (itunes, stitcher, podbay)

EPISODES belongs_to :podcast
•	title
•	description
•	podcast_id
•	thumbnail
•	mp3 file

Pages
•	Welcome page 
•	Sign in
•	Sign up
•	Podcasts all
•	Podcast single
•	Podcast edit
•	Episode page
•	Episode new
•	Episode edit
•	Dashboard 
welcome#index
session#new
registration#new
podcast#index
podcast#show
podcast#edit
episode#show
episode#new
episode#edit
podcast#dashboard
