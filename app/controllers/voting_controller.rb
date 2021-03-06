class VotingController < ApplicationController
  before_action :persist_vote_session , only: [:new]
  def new

  end

  def vote_for
    if session[:id_check].to_i == (params[:id_voted].to_i*params[:id_not_voted].to_i)
    @user1  = User.find(params[:id_voted])
    @user2  = User.find(params[:id_not_voted])

    ra = @user1.rating
    rb = @user2.rating

    eA = 1/(1+10**((rb-ra).to_f/400))
    eB = 1/(1+10**((ra-rb).to_f/400))

    @user1.rating = ra + (24 * (1.0 - eA)).to_i
    @user2.rating = rb + (24 * (0.0 - eB)).to_i


    @user1.update_attributes :rating => @user1.rating
    @user2.update_attributes :rating => @user2.rating

    redirect_to voting_new_url
    else
      flash[:danger] = "You are Blocked"
      redirect_to voting_new_url
    end

  end


  def persist_vote_session
    if params[:gender]
      session[:gender] = params[:gender]
    end
    @users = User.where(gender: session[:gender]).order("RANDOM()")
    session[:gender] ||= "Male" #shoudn't happen
    session[:id_check] = 0
  end
end
