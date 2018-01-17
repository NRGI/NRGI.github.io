mining <- c("DRC (mining)","Eritrea","Ethiopia","Ghana (mining)","Guinea","Liberia","Madagascar","Mali","Mauritania","Morocco",
  "Niger","Sierra Leone","South Africa","Tanzania (mining)","Tunisia (mining)","Zambia","Zimbabwe")

oil <- c("Algeria","Angola","Cameroon","Chad","Congo","Côte d'Ivoire","DRC (oil and gas)","Egypt","Equatorial Guinea","Gabon",
            "Ghana (oil and gas)",  "Libya","Mozambique","Nigeria","South Sudan","Sudan","Tanzania (oil and gas)","Tunisia (oil and gas)","Uganda")
#A simple function to input list of clean country names and get ISO2 or ISO3 codes



addISO <- function(ctr, type="ISO3") {
  
  gs_auth()
  iso <- gs_read(gs_key("1vzbrKpKJxtZvChn9FuS1JgPLJGeoRi24tXjgsrf5O9U"), ws="ISO")
  setDT(iso)
  
  new <- c()
  for(i in 1:length(ctr)){
    if(ctr[i] %in% iso$country) {
      new[i] <- iso[country==ctr[i]]$iso3
    }
    
    
    if(!ctr[i] %in% iso$country) {
      new[i] <- "No match"
      print(paste0("Look at: ", i, " - '", ctr[i],"'"))
    }
  }
  new
}
