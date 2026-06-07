plot_wc_density <- function(data) {
  ggplot(data) +
    geom_sf(aes(fill = wc_pro_10000)) +
    labs(
      title = "Public toilets per 10,000 residents in Munich",
      fill = "WC per 10,000"
    )
}
