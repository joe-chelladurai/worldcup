

tab <- function(data, ...) {
  data %>% gt() %>%
    tab_options(
      heading.align = "left",
      column_labels.border.top.style = "none",
      table.border.top.style = "none",
      column_labels.border.bottom.style = "none",
      column_labels.border.bottom.width = 1,
      column_labels.border.bottom.color = "#334422",
      table_body.border.top.style = "none",
      table_body.border.bottom.color = "white",
      heading.border.bottom.style = "none",
      data_row.padding = px(1),
      row_group.padding = px(1),
      column_labels.font.size = px(12),
      ...
    ) %>%
    tab_style(
      style = cell_text(
        color = "darkgrey",
        font = google_font("Source Sans Pro"),
        transform = "uppercase"
      ),
      locations = cells_column_labels(everything())
    ) %>%
    tab_style(
      style = cell_text(
        font = google_font("Libre Franklin"),
        weight = 800
      ),
      locations = cells_title(groups = "title")
    ) %>%
    tab_style(
      style = cell_text(
        font = google_font("Source Sans Pro"),
        weight = 400
      ),
      locations = cells_body()
    )
}


