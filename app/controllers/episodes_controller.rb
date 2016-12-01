class EpisodesController < ApplicationController
	before_action :find_podcast
	before_action :find_episode, only: [:show]

	def new
		# in order to create an episode, we need to find the podcast
		# see private method
		@episode = @podcast.episodes.new
	end

	def create
		@episode = @podcast.episodes.new episode_params
		if @episode.save
			# goes to podcast and episode path, finds their id
			redirect_to podcast_episode_path(@podcast, @episode) 
		else
			render 'new'
		end
	end

	def show
		@episodes = Episode.where(podcast_id: @podcast).order("created_at desc").reject { |e| e.id == @episode.id }
		# reject method loops through all the loops
		# if current id == episode id, it rejects it
	end

	private

	def episode_params
		params.require(:episode).permit(:title, :description)
	end

	def find_podcast
		@podcast = Podcast.find(params[:podcast_id])
	end

	def find_episode
		@episode = Episode.find(params[:id])
	end
end
