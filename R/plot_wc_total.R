plot_wc_total <- function(data) {
  ggplot(data) +
    geom_sf(aes(fill = anzahl_wc)) +
    labs(
      title = "Number of public toilets in Munich",
      fill = "Number of WC"
    )
}
