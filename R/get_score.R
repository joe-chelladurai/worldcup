



get_score <- function(id) {
  match_result <- fotmob_get_league_matches(league_id = 77)

  a <- id

  home_df <- match_result %>%
    mutate(id = as.numeric(id)) %>%
    filter(id == a) %>%
    pull(home) %>%
    mutate(home_away = "home")

  away_df <- match_result %>%
    mutate(id = as.numeric(id)) %>%
    filter(id == a) %>%
    pull(away) %>%
    mutate(home_away = "away")

  teams <- bind_rows(home_df, away_df) %>%
    select(name, home_away)

  score <- match_result %>%
    mutate(id = as.numeric(id)) %>%
    filter(id == a) %>%
    pull(status) %>%
    select(scoreStr) %>%
    separate(scoreStr, into = c("home", "away")) %>%
    t() %>%
    data.frame() %>%
    rownames_to_column("home_away") %>%
    rename(score = 2)

  left_join(teams, score, by = "home_away")
}



