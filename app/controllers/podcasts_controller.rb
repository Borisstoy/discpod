class PodcastsController < ApplicationController
	before_action :find_podcast, only: [:show, :dashboard]
	before_action :find_episode, only: [:show, :dashboard]

	# for index, we need to loop through all episodes, using podcastS
	def index
		@podcasts = Podcast.all.order('created_at desc').paginate(page: params[:page], :per_page => 12)
	end

	# for the show method, the use of singular sends us back to show 1 podcast
	def show
		# @podcast = Podcast.find(params[:id])
		# need to find the episode as well
		# @episodes = Episode.where(podcast_id: @podcast).order("created_at desc")
	end

	def dashboard
		# if signed in, we want users to go to dashboard
		# so we need to authenticate users
		# see routes
	end

	private

	def find_episode
		@episodes = Episode.where(podcast_id: @podcast).order("created_at desc").paginate(page: params[:page], :per_page => 5)
	end

	def find_podcast
		# if rails can't find a podcast
		if params[:id].nil?
			@podcast = current_podcast
		else
		@podcast = Podcast.find(params[:id])
		end
	end
end