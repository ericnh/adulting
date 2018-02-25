class RulebooksController < ApplicationController
  before_action :set_rulebook, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:current]

  # GET /rulebooks
  # GET /rulebooks.json
  def index
    @rulebooks = Rulebook.all.order(id: :desc)
  end

  # GET /rulebooks/1
  # GET /rulebooks/1.json
  def show
    @markdown_text = Markdown.new(@rulebook.markdown_text).to_html
  end

  def current
    @rulebook = Rulebook.last
    if @rulebook
      @markdown_text = Markdown.new(@rulebook.markdown_text).to_html
    else
      @rulebook = Rulebook.new
      @markdown_text = "<p>There was a problem fetching the latest rulebook</p>"
    end
      render "show"
  end

  # GET /rulebooks/new
  def new
    @rulebook = Rulebook.new
  end

  # GET /rulebooks/1/edit
  def edit
    @rulebook = Rulebook.find(params[:id])
  end

  # POST /rulebooks
  # POST /rulebooks.json
  def create
    @rulebook = Rulebook.new(rulebook_params)

    respond_to do |format|
      if @rulebook.save
        format.html { redirect_to @rulebook, notice: 'Rulebook was successfully created.' }
        format.json { render :show, status: :created, location: @rulebook }
      else
        format.html { render :new }
        format.json { render json: @rulebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rulebooks/1
  # PATCH/PUT /rulebooks/1.json
  def update
    respond_to do |format|
      if params[:id].to_i == Rulebook.last.try(:id)
        @rulebook = Rulebook.new
      end
      if @rulebook.update(rulebook_params.except(:id))
        format.html { redirect_to @rulebook, notice: 'Rulebook was successfully updated.' }
        format.json { render :show, status: :ok, location: @rulebook }
      else
        format.html { render :edit }
        format.json { render json: @rulebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rulebooks/1
  # DELETE /rulebooks/1.json
  def destroy
    @rulebook.destroy
    respond_to do |format|
      format.html { redirect_to rulebooks_url, notice: 'Rulebook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rulebook
      @rulebook = Rulebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rulebook_params
      params.require(:rulebook).permit(:major_version, :minor_version, :markdown_text)
    end
end
