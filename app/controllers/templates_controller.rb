class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  # GET /templates
  def index
    @templates = Template.all
  end

  # GET /templates/1
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  def create
    @template = Template.new(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /templates/1
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /templates/1
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:category, :score, template_fields_attributes: [:id, :question, :score, :_destroy])
    end
end
