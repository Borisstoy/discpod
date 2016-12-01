class EpisodesController < ApplicationController
	# without authentification, user 1 can access user 2 creation form
	# need for users authentification so we can't manually enter a URL and create episodes before signing in
	# forces redirection to login page
	# still, we want people to be able to see podcasts, e.g exception for show method
	before_action :authenticate_podcast!, except: [:show]
	before_filter :require_permission
	before_action :find_podcast
	before_action :find_episode, only: [:show, :edit, :update, :destroy]

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

	def edit
		
	end

	def update
		if @episode.update episode_params
			redirect_to podcast_episode_path(@podcast, @episode), notice: "Episode was updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@episode.destroy
		redirect_to root_path
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

	# method related to authentification
	def require_permission
		@podcast = Podcast.find(params[:podcast_id])
		if current_podcast != @podcast
			redirect_to root_path, notice: "Sorry, you're not allowed to view that page."
		end
	end
end
