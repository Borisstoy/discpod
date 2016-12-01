class PodcastsController < ApplicationController
	
	# for index, we need to loop through all episodes, using podcastS
	def index
		@podcasts = Podcast.all.order('created_at desc')
	end

	# for the show method, the use of singular sends us back to show 1 podcast
	def show
		@podcast = Podcast.find(params[:id])
		# need to find the episode as well
		@episodes = Episode.where(podcast_id: @podcast).order("created_at desc")
	end
end