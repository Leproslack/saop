class TemplateFieldsController < ApplicationController
  before_action :set_template_field, only: [:show, :edit, :update, :destroy]

  # GET /template_fields
  # GET /template_fields.json
  def index
    @template_fields = TemplateField.all
  end

  # GET /template_fields/1
  # GET /template_fields/1.json
  def show
  end

  # GET /template_fields/new
  def new
    @template_field = TemplateField.new
  end

  # GET /template_fields/1/edit
  def edit
  end

  # POST /template_fields
  # POST /template_fields.json
  def create
    @template_field = TemplateField.new(template_field_params)

    respond_to do |format|
      if @template_field.save
        Template.calculate_total_score(@template)
        format.html { redirect_to @template_field, notice: 'Template field was successfully created.' }
        format.json { render :show, status: :created, location: @template_field }
      else
        format.html { render :new }
        format.json { render json: @template_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template_fields/1
  # PATCH/PUT /template_fields/1.json
  def update
    respond_to do |format|
      if @template_field.update(template_field_params)
        Template.calculate_total_score(@template)
        format.html { redirect_to @template_field, notice: 'Template field was successfully updated.' }
        format.json { render :show, status: :ok, location: @template_field }
      else
        format.html { render :edit }
        format.json { render json: @template_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_fields/1
  # DELETE /template_fields/1.json
  def destroy
    @template_field.destroy
    Template.update_score_after_destroy(Template.find(params[:id]), @template_field.score)
    respond_to do |format|
      format.html { redirect_to template_fields_url, notice: 'Template field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_field
      @template_field = TemplateField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_field_params
      params.require(:template_field).permit(:question, :score, :template_id, :id)
    end
end
