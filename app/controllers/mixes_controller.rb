class MixesController < ApplicationController
  before_action :set_mix, only: [:show, :edit, :update, :destroy]

  # GET /mixes
  # GET /mixes.json
  def index
    @mixes = Mix.all
  end

  # GET /mixes/1
  # GET /mixes/1.json
  def show
    @vid_array = []
    @mix.clips[1..-1].each do |clip|
      @vid_array << [clip.url, clip.start_time]
    end
  end

  # GET /mixes/new
  def new
    @mix = Mix.new
  end

  # GET /mixes/1/edit
  def edit
  end

  # POST /mixes
  # POST /mixes.json
  def create
    @mix = Mix.new(name: params['mix_name'], creator_id: session['user_id'])
    if @mix.save
      @mix.clips.create(order: 0, url: params['soundtrack_url'], start_time: params['soundtrack_start'], duration: 0)
      params['clips'].each do |clip_num, data|
        @mix.clips.create(order: clip_num, url: data[0], start_time: data[1], duration: data[2])
      end
      render js: "window.location = '/mixes/#{@mix.id}'"
    else
      render :404
    end
  end

  # PATCH/PUT /mixes/1
  # PATCH/PUT /mixes/1.json
  def update
    respond_to do |format|
      if @mix.update(mix_params)
        format.html { redirect_to @mix, notice: 'Mix was successfully updated.' }
        format.json { render :show, status: :ok, location: @mix }
      else
        format.html { render :edit }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixes/1
  # DELETE /mixes/1.json
  def destroy
    @mix.destroy
    respond_to do |format|
      format.html { redirect_to mixes_url, notice: 'Mix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mix
      @mix = Mix.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mix_params
      params.fetch(:mix, {})
    end
end
