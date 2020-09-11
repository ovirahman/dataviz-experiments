library(cowplot)
library(colorblindr)
library(dviz.supp)


p1 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_OkabeIto() + ggtitle("Okabe Ito") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p2 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_brewer(type = "qual", palette = "Dark2") + ggtitle("ColorBrewer Dark2") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p3 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_hue() + ggtitle("ggplot2 hue") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
plot_grid(p1, p2, p3, ncol = 1)



###---sequential color scale

p1 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_brewer(type = "seq", palette = "Blues", direction = -1) + ggtitle("ColorBrewer Blues") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p2 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_discrete_sequential("Heat", rev = FALSE) + ggtitle("Heat") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p3 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_viridis_d() + ggtitle("Viridis") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
plot_grid(p1, p2, p3, ncol = 1)




#####--- diverging color scale

p1 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_discrete_divergingx(palette = "Earth") + ggtitle("CARTO Earth") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p2 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_brewer(type = "div", palette = "PiYG") + ggtitle("ColorBrewer PiYG") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p3 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_discrete_diverging("Blue-Red") + ggtitle("Blue-Red") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
plot_grid(p1, p2, p3, ncol = 1)



##########-accent scale

p1 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_manual(values = accent_OkabeIto) + ggtitle("Okabe Ito Accent") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p2 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_manual(values = c("gray60", "gray70","gray80", "gray90", "#C95C4F",   '#83A121', '#6B8AD5')) + ggtitle("Grays with accents") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
p3 <- gg_color_swatches(7, title_family = dviz_font_family) + 
    scale_fill_brewer(type = "qual", palette = "Accent") + ggtitle("ColorBrewer Accent") +
    theme(plot.margin = margin(7, 1.5, 7, 1.5))
plot_grid(p1, p2, p3, ncol = 1)


################---plot_grid
plot_grid <- function(..., label_fontfamily = dviz_font_family,
                      label_fontface = "plain", hjust = 0, vjust = 1) {
    cowplot::plot_grid(..., label_fontfamily = label_fontfamily,
                       label_fontface = label_fontface,
                       hjust = hjust, vjust = vjust)
}


###############- font
dviz_font_family <- "Myriad Pro"






####################-dviz.supp--- this function is from colorblindr
gg_color_swatches <- function(n = 10, xmargin = 0.2, ymargin = 0,
                              title = NULL, title_size = 14, title_family = "", title_face = "plain",
                              plot_margin = margin(title_size/2, title_size/2, title_size/2, title_size/2))
{
    tiles <- data.frame(xmin=(0:(n-1)+xmargin/2)/n,
                        xmax=((1:n)-xmargin/2)/n,
                        ymin=rep(0, n)+ymargin/2,
                        ymax=rep(1, n)-ymargin/2,
                        fill=factor(1:n))
    
    # code to appease CRAN check
    xmax <- xmin <- ymax <- ymin <- fill <- NULL
    
    ggplot() +
        geom_rect(data=tiles, aes(xmin=xmin, xmax=xmax, ymin=ymin, ymax=ymax, fill=fill)) +
        scale_x_continuous(limits = c(.99*xmargin/(2*n), 1-.99*xmargin/(2*n)), expand = c(0, 0)) +
        scale_y_continuous(limits = c(0, 1), expand = c(0, 0)) +
        ggtitle(title) +
        cowplot::theme_nothing() +
        theme(plot.margin = plot_margin,
              plot.title = element_text(family = title_family,
                                        face = title_face,
                                        size = title_size,
                                        margin = margin(b = title_size/2),
                                        hjust = 0, vjust = 0.5))
}




##### example map sequential

texas_crs <- "+proj=aea +lat_1=27.5 +lat_2=35 +lat_0=18 +lon_0=-100 +x_0=1500000 +y_0=6000000 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
# -110, -93.5 transformed using texas_crs
texas_xlim <- c(558298.7, 2112587)
texas_income %>% st_transform(crs = texas_crs) %>%
    ggplot(aes(fill = estimate)) + 
    geom_sf(color = "white") + 
    coord_sf(xlim = texas_xlim, datum = NA) +
    theme_dviz_map() + 
    scale_fill_distiller(
        palette = "Blues", type = 'seq', na.value = "grey60", direction = 1,
        name = "annual median income (USD)",
        limits = c(18000, 90000),
        breaks = 20000*c(1:4),
        labels = c("$20,000", "$40,000", "$60,000", "$80,000"),
        guide = guide_colorbar(
            direction = "horizontal",
            label.position = "bottom",
            title.position = "top",
            ticks = FALSE,
            barwidth = grid::unit(3.0, "in"),
            barheight = grid::unit(0.2, "in")
        )
    ) +
    theme(
        legend.title.align = 0.5,
        legend.text.align = 0.5,
        legend.justification = c(0, 0),
        legend.position = c(0.02, 0.1)
    )






###################--- packages
remotes::install_github("wilkelab/cowplot")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")
remotes::install_github("clauswilke/colorblindr")
remotes::install_github("clauswilke/dviz.supp")