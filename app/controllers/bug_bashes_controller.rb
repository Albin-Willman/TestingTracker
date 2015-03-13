class BugBashesController < ApplicationController
  before_action :require_user
  before_action :set_bug_bash, only: [:show, :edit, :update, :destroy]

  # GET /bug_bashes
  def index
    @bug_bashes = BugBash.all
  end

  # GET /bug_bashes/1
  def show
  end

  # GET /bug_bashes/new
  def new
    @bug_bash = BugBash.new
  end

  # GET /bug_bashes/1/edit
  def edit
  end

  # POST /bug_bashes
  def create
    @bug_bash = BugBash.new(bug_bash_params)
    if @bug_bash.save
      redirect_to @bug_bash, notice: 'Bug bash was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bug_bashes/1
  def update
    if @bug_bash.update(bug_bash_params)
      redirect_to @bug_bash, notice: 'Bug bash was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bug_bashes/1
  def destroy
    @bug_bash.destroy
    redirect_to bug_bashes_url, notice: 'Bug bash was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug_bash
      @bug_bash = BugBash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_bash_params
      params.require(:bug_bash).permit(:name)
    end
end
