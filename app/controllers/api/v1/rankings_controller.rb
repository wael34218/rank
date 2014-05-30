class Api::V1::RankingsController < Api::V1::ApiApplicationController

  def create
    @ranking = Ranking.new(ranking_params)
    @ranking.subject_id = @account.id
    if @ranking.save
      render 'show'
    else
      @message = @ranking.errors.full_messages
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def vote_yes
    @ranking = Ranking.find(params[:id])
    @ranking.vote_yes!(@account.id)
    render 'show'
  end

  def vote_no
    @ranking = Ranking.find(params[:id])
    @ranking.vote_no!(@account.id)
    render 'show'
  end

  def bribe_approve
    @ranking = Ranking.find(params[:id])
    if @ranking.target_id == @account.id
      @ranking.approve!
      render 'show'
    else
      @message = "You cant approve this ranking, its not for you mate!"
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  def bribe_reject
    @ranking = Ranking.find(params[:id])
    if @ranking.target_id == @account.id
      @ranking.reject!
      render 'show'
    else
      @message = "You cant reject this ranking, its not for you mate!"
      render 'api/v1/error', :status => :unprocessable_entity
    end
  end

  private

  def ranking_params
    params.permit(:tool, :ranked_id, :rank_change, :target_id)
  end

end
