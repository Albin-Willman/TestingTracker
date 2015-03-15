class TestSuitesController < ApplicationController
  before_action :require_user
  before_action :set_test_suite, only: [:show, :edit, :update, :destroy]
  before_action :set_form_dependencies, only: [:edit, :new]

  # GET /test_suites
  def index
    @test_suites = TestSuite.all
  end

  # GET /test_suites/1
  def show
    @features = @test_suite.features
    @testers  = @test_suite.testers.includes(:user)
  end

  # GET /test_suites/new
  def new
    @test_suite = TestSuite.new
  end

  # GET /test_suites/1/edit
  def edit
  end

  # POST /test_suites
  def create
    @test_suite = TestSuite.new(test_suite_params)

    if @test_suite.save
      redirect_to @test_suite, notice: 'Test suite was successfully created.'
    else
      set_form_dependencies
      render :new
    end
  end

  # PATCH/PUT /test_suites/1]
  def update
    if @test_suite.update(test_suite_params)
      redirect_to @test_suite, notice: 'Test suite was successfully updated.'
    else
      set_form_dependencies
      render :edit
    end
  end

  # DELETE /test_suites/1
  def destroy
    @test_suite.destroy
    redirect_to test_suites_url, notice: 'Test suite was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_suite
      @test_suite = TestSuite.find(params[:id])
    end

    def set_form_dependencies
      @users = User.all
      @github_tokens = GithubToken.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_suite_params
      params.require(:test_suite).permit(:name, :description, :repo, :github_token_id, user_ids: [])
    end
end
