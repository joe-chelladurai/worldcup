

get_detailed_match_summary_from_advanced <- function(data) {

  data %>%
  select(Team, Gls, PK, Ast, Sh, SoT, Touches, Tkl, Int, Blocks, Cmp_Passes, Att_Passes, Cmp_percent_Passes) %>%
    rename(Assists = Ast,
           `Shots on Goal` = Sh,
           `Shots on Target` = SoT,
           Touches = Touches,
           Tackles = Tkl,
           `Completed Passes` = Cmp_Passes,
           `Attempted Passes` = Att_Passes,
           `Completion Rate` = Cmp_percent_Passes) %>%
    mutate(Goals = Gls + PK) %>% relocate(Goals, .after = Team) %>% select(-Gls, -PK) %>%
    t() %>% data.frame() %>% rownames_to_column("item") %>%
    row_to_names(1)
}
