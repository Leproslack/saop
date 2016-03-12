class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]


  def get_media_for_category
    @poll.cat1 = poll_params.select{|k, v| k =~ /^a1.*/}.values.inject(0){|sum,x| sum.to_f + x.to_f }/3*100/5
    @poll.cat2 = poll_params.select{|k, v| k =~ /^a2.*/}.values.inject(0){|sum,x| sum.to_f + x.to_f }/2*100/5
    @poll.cat3 = poll_params.select{|k, v| k =~ /^a3.*/}.values.inject(0){|sum,x| sum.to_f + x.to_f }/1*100/5
    @poll.poll_rate = poll_params.select{|k, v| k =~ /^a.*/}.values.inject(0){|sum,x| sum.to_f + x.to_f }/6*100/5
  end
  # GET /polls
  # GET /polls.json

  def index
    @polls = Poll.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)
    get_media_for_category


    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    get_media_for_category

    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:name, :a11, :a12, :a13, :a21, :a22, :a31, :ac11, :ac12,:ac13,:ac21,:ac22,:ac31)
    end
end
