top_districts <- function(data) {
  data %>%
    st_drop_geometry() %>%
    arrange(desc(wc_pro_10000)) %>%
    select(sb_name, bevolkerung, anzahl_wc, wc_pro_10000)
}
