# Carga las bibliotecas necesarias
library(readxl)
library(dplyr)

# Define la ruta de tu archivo Excel
ruta_excel <- "tu_archivo.xlsx"

# Lista de hojas en el archivo Excel
hojas <- c("1999", "2004", "2009", "2014", "2019")

# Leer y procesar cada hoja
for (hoja in hojas) {
  # Leer la hoja actual
  datos <- read_excel(ruta_excel, sheet = hoja)
  
  # Aplicar las condiciones a las variables QLue y PR
  datos <- datos %>%
    mutate_all(~ifelse(grepl("^QLue", .), ifelse(. > 1, ., "-"), 
                       ifelse(grepl("^PR", .), ifelse(. > 0.5, ., "-"), .)))
  
  # Guardar los datos procesados en un nuevo archivo Excel o sobrescribir el existente
  write.xlsx(datos, file.path("ruta_de_salida", paste0(hoja, "_procesado.xlsx")), row.names = FALSE)
}
