class PollsController < ApplicationController

  def index
    @polls = Poll.all.order("created_at DESC")
  end

  def new
    @poll = polls.build
  end

  def show
    @poll = Poll.all.order("created_at DESC")
  end

end
