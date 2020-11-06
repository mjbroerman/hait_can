starwars %>%
  summarise(across(where(is.character), ~ length(unique(.x))))

imm_rel <- bind_cols(imm_trans[c("code", "occupation")], imm_trans %>%
            transmute(across(matches("\\d"), ~ ./ .[1])))

imm_rel[-1,] %>%
  pivot_longer(!c("code", "occupation"), names_to = "years", values_to = "relfreq") %>%
  separate(years, into = c("start_year", "end_year"), sep = "_", convert = TRUE) %>%
  ggplot(aes(x = end_year, y = relfreq, fill = occupation)) +
  geom_area() +
  theme(legend.position="top") +
  guides(fill = guide_legend(direction = "vertical"))


imm_trans[-1,] %>%
  pivot_longer(!c("code", "occupation"), names_to = "years", values_to = "relfreq") %>%
  separate(years, into = c("start_year", "end_year"), sep = "_")

imm_trans[-1,] %>%
  select(-"total")  %>%
  pivot_longer(!c("code", "occupation"), names_to = "years", values_to = "new_immigrants") %>%
  separate(years, into = c("start_year", "end_year"), sep = "_", convert = TRUE) %>%
  ggplot(aes(x = end_year, y = new_immigrants, fill = occupation)) +
  geom_area() +
  theme(legend.position="top") +
  guides(fill = guide_legend(direction = "vertical"))

tibble(uspopage)
library(gcookbook)
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area()

imm_trans[-1,] %>% # remove total transport occupations row
  select(-"total")  %>% # remove total years immigration column
  pivot_longer(!c("code", "occupation"),
               names_to = "years",
               values_to = "new_immigrants") %>%
  separate(years,
           into = c("start_year", "end_year"),
           sep = "_",
           convert = TRUE) %>%
  ggplot(aes(x = end_year, y = new_immigrants, fill = occupation)) +
  geom_area() +
  theme(legend.position="top") +
  guides(fill = guide_legend(title = "Transportation Occupations",
                             direction = "vertical"))
