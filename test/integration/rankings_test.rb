require 'test_helper'          

class RankingTest < ActionDispatch::IntegrationTest 
  def test_ranking_create
    api_call(:post, '/api/v1/ranking', ranked_id: '4', target_id: 5, rank_change:6, tool:"bribe", token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Create new ranking, there are three tools you could use [bribe, suggest, force, joker]:
        curl -X POST http://wael.docpoint.com/api/v1/ranking -d 'ranked_id=4&target_id=5&rank_change=6&tool=bribe& token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_ranking_bribe_approve
    api_call(:get, '/api/v1/ranking/:id/bribe_approve', id:7, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Accept bribe:
        curl -X GET http://wael.docpoint.com/api/v1/ranking/7/bribe_approve -d 'token=9186e07efb64702bf76610f18522440b6785b946'"
      assert_response :success 
    end
  end

  def test_ranking_bribe_reject
    api_call(:get, '/api/v1/ranking/:id/bribe_reject', id:8, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Reject bribe:
        curl -X GET http://wael.docpoint.com/api/v1/ranking/8/bribe_reject -d 'token=9186e07efb64702bf76610f18522440b6785b946'"
      assert_response :success 
    end
  end

  def test_ranking_vote_yes
    api_call(:get, '/api/v1/ranking/:id/vote_yes', id:6, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Vote yes for a ranking:
        curl -X GET http://wael.docpoint.com/api/v1/ranking/6/vote_yes -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end

  def test_ranking_vote_no
    api_call(:get, '/api/v1/ranking/:id/vote_no', id:6, token: "2a25980982484222dc0ba9471611a9da6e51fad4") do |doc|
      doc.description = "Vote no for a ranking:
        curl -X GET http://wael.docpoint.com/api/v1/ranking/6/vote_no -d 'token=2a25980982484222dc0ba9471611a9da6e51fad4'"
      assert_response :success 
    end
  end
end
