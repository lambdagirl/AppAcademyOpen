class ChallengesController < ApplicationController
    before_action :require_login!
    def new
      @challenge = Challenge.new
      render :new
    end

    def create 
      @challenge = Challenge.new(challenge_params)
      if @challenge.save
        redirect_to challenge_url(@challenge)
      else
        flash.now[:errors] = @challenge.errors.full_messages
      render :new
      end
    end

    def show
      @challenge = Challenge.find(params[:id])
      render :show
    end

    def index
      @challenges = Challenge.all
      render :index
    end

    def edit
      @challenge = Challenge.find(params[:id])
      render :edit
    end
    def update
      @challenge = Challenge.find(params[:id])
      if @challenge.update(challenge_params)
        redirect_to challenge_url(@challenge)
      else
        flash.now[:errors] = @challenge.errors.full_messages
        render :edit
      end
    end


    def destroy
      @challenge = Challenge.find(params[:id])
      @challenge.destroy
      redirect_to challenges_url

    end
    private
    def challenge_params
      params.require(:challenge).permit(:name)
    end
  end