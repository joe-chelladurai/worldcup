

get_tables <- function(url) {

  fb_match_report(url) %>% get_scores_from_match_report() %>%
    tab() %>% gtsave("scores.png")

  fb_match_summary(url) %>%
    get_timeline_from_match_summary() %>%
    group_by(team) %>%
    tab() %>% gtsave("timeline.png")

  fb_match_shooting(url) %>%
    left_join(get_home_away_from_match_report(fb_match_report(url)), by = "Home_Away") %>%
    select(Team_Name, Minute, Player, Outcome, Distance) %>%
    group_by(Team_Name) %>%
    tab() %>% gtsave("attempts.png")

  fb_advanced_match_stats(match_url = url, stat_type = "summary", team_or_player = "team") %>%
    get_detailed_match_summary_from_advanced() %>%
    tab() %>% gtsave("summary.png")


}
