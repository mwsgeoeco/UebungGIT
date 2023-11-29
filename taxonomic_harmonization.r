###  Übung 5
###  Datum: 22.11.2023
### Taxonomic harmonization

# was ist "Taraxacum dens leonis" für eine Art? 
  
# wir überprüfen das mit Taxize
library(taxize)
  
leo <- "Taraxacum dens leonis"

check_names<-gnr_resolve(leo) # gibt es die Art?

check_names # passt nicht gut

leo <- "Taraxacum dens-leonis"

check_names<-gnr_resolve(leo) # gibt es die Art?

check_names # passt gut

get_gbifid(leo) # gibt es die Art bei GBIF? Ja!


check_names <- classification(leo, db='gbif') # wie ist der offizielle Name?
check_names

# Taraxacum officinale !

# gibt es dazu Trait Daten? 

library("TR8")

available_traits()

my_traits<-c("h_max","le_area","leaf_mass","li_form_B", "strategy")

retrieved_traits <- tr8(species_list = "Taraxacum officinale", download_list = my_traits, allow_persistent=F)

retrieved_traits # leider keine traits


#############################################################
# ok, wie sieht es für einen richtigen Datensatz aus
#############################################################

veg_names <- read.csv("veg_names_taxo_harmo.csv", header = F)
veg_names <- as.vector(veg_names$V1)

# Beispiel Lychnis flos-cuculi
veg_names[56] # Bindestrich nicht vergessen



check_names<-gnr_resolve("Lychnis flos-cuculi") 
check_names # die Art gibts

get_gbifid("Lychnis flos-cuculi") # gibt die Art bei GBIF? Ja

classification("Lychnis flos-cuculi", db='gbif') # Aha - der offizielle Name ist Silene flos-cuculi


### wir lesen die Traits aus
retrieved_traits <- tr8(species_list = "Silene flos-cuculi", download_list = my_traits, allow_persistent=F)
retrieved_traits



