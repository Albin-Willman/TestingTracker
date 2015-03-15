class IssuesController < ApplicationController
  before_action :require_user
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @feature = Feature.find_by(id: params[:feature_id])
    @issue.feature    = @feature
    @issue.test_suite = @feature ? @feature.test_suite : TestSuite.find_by(id: params[:test_suite_id])
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    if @issue.save
      redirect_to @issue, notice: 'Issue was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      redirect_to @issue, notice: 'Issue was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
    redirect_to issues_url, notice: 'Issue was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:feature_id, :test_suite_id, :title, :description_markdown)
    end
end
