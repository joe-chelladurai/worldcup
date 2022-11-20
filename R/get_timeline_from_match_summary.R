


get_timeline_from_match_summary <- function(data) {

  data %>%
    select(Team, Event_Time, Event_Type) %>%
    clean_names() %>%
    rename(time = event_time, event = event_type)

}
