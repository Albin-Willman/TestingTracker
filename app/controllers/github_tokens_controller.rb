class GithubTokensController < ApplicationController
  before_action :require_user
  before_action :set_github_token, only: [:show, :edit, :update, :destroy]

  # GET /github_tokens
  def index
    @github_tokens = GithubToken.all
  end

  # GET /github_tokens/1
  def show
    begin
      @repos = @github_token.github_client.repos.map { |r| r[:full_name] }
    rescue
      @repos = ['None, Bad access token']
    end
  end

  # GET /github_tokens/new
  def new
    @github_token = GithubToken.new
  end

  # GET /github_tokens/1/edit
  def edit
  end

  # POST /github_tokens
  def create
    @github_token = GithubToken.new(github_token_params)
    if @github_token.save
      redirect_to @github_token, notice: 'Github token was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /github_tokens/1
  def update
    if @github_token.update(github_token_params)
      redirect_to @github_token, notice: 'Github token was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /github_tokens/1
  def destroy
    @github_token.destroy
    redirect_to github_tokens_url, notice: 'Github token was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_github_token
      @github_token = GithubToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def github_token_params
      params.require(:github_token).permit(:access_token, :title)
    end
end
