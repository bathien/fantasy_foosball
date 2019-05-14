class DashboardsController < ApplicationController
 def home
   match_winners = Match.completed
                       .group(:winner_team_id)
                       .select('winner_team_id, count(id) as win_num')
   return if match_winners.nil? || match_winners[0]&.winner_team_id.nil?

   @result = {}
   match_winners.each do |match_winner|
     @result[match_winner.winner_team_name] =
       (match_winner.win_num.to_f / Match.by_team(match_winner.winner_team_id).size.to_f) * 100
   end
   @result = Hash[@result.sort_by{ |_, v| -v }]
  end
end
