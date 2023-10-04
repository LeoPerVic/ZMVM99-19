# Carga las bibliotecas necesarias
ch
library(readxl)
library(dplyr)
library(openxlsx)

# Define la ruta de tu archivo Excel

datos <- read_xlsx("C:\\Users\\rpm0a\\OneDrive\\Documentos\\RepTemplates\\ZMVM99-19\\Bases\\1999.xlsx")


# Aplicar las condiciones a las variables QLue y PR

datos <- datos %>%
  mutate_at(vars(starts_with("QL")), ~ifelse(. > 1, ., "-")) %>%
  mutate_at(vars(starts_with("PR")), ~ifelse(. > 0.5, ., "-"))

# Guardar los datos procesados en un nuevo archivo Excel

write.xlsx(datos, "C:\\Users\\rpm0a\\OneDrive\\Documentos\\RepTemplates\\ZMVM99-19\\Productos\\1999_2.xlsx")
