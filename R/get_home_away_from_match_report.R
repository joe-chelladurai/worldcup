

get_home_away_from_match_report <- function(data) {
  data %>%
    select(Home_Team, Away_Team) %>%
    rename_with(~str_remove(., '_Team')) %>%
    t() %>% data.frame() %>%
    rownames_to_column("Home_Away") %>%
    rename(Team_Name = 2)
}
