


get_scores_from_match_report <- function(data) {

  team_one <- data %>%
    select(starts_with(c("Home"))) %>%
    rename_with(~str_remove(., 'Home_')) %>% clean_names() %>%
    mutate(team_number = 1) %>% t() %>% data.frame() %>% rownames_to_column("item")

  team_two <- data %>%
    select(starts_with(c("Away"))) %>%
    rename_with(~str_remove(., 'Away_')) %>% clean_names() %>%
    mutate(team_number = 2) %>% t() %>% data.frame() %>% rownames_to_column("item")

  left_join(team_one, team_two, by = "item") %>%
    filter(!str_detect(item, c("goals", "x_g")))  %>%
    filter(!str_detect(item, c("number"))) %>%
    row_to_names(row_number = 1) %>%
    filter(team == "score") %>%
    select(-team) %>% mutate_all(as.numeric) %>%
    pivot_longer(cols = c(1:2), names_to = "team", values_to = "score")
}
