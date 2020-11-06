starwars %>%
  summarise(across(where(is.character), ~ length(unique(.x))))

bind_cols(imm_trans[c("code", "occupation")], imm_trans %>%
            transmute(across(matches("\\d"), ~ ./ .[1]))) %>%




