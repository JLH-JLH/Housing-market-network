# Load required package
if (!require("igraph")) {
  install.packages("igraph", dependencies = TRUE)
}
library(igraph)

# Set working directory
setwd("C:/Users/aidan/OneDrive/Desktop/Central metrics")

# Load node data
node_data <- read.csv("Node.csv")

# List all Arc data files
arc_files <- list.files(pattern = "Arc_.*\\.csv")

# Process each Arc data file
for (arc_file in arc_files) {
  # Load Arc data
  arc_data <- read.csv(arc_file)
  
  # Create graph
  g <- graph_from_data_frame(d = arc_data, vertices = node_data, directed = TRUE)
  
  # Compute centrality metrics
  in_degree_centrality <- strength(g, mode = "in", weights = E(g)$Weight)
  out_degree_centrality <- strength(g, mode = "out", weights = E(g)$Weight)
  eigenvector_centrality <- eigen_centrality(g, directed = TRUE, weights = E(g)$Weight)$vector
  hub_score <- hub_score(g, weights = E(g)$Weight)$vector
  authority_score <- authority_score(g, weights = E(g)$Weight)$vector
  
  # Compile results into a dataframe
  results <- data.frame(
    Label = V(g)$Label,
    InDegree = in_degree_centrality,
    OutDegree = out_degree_centrality,
    Eigenvector = eigenvector_centrality,
    Hub = hub_score,
    Authority = authority_score
  )
  
  # Generate output filename
  output_file <- paste0(tools::file_path_sans_ext(arc_file), "_centrality_metrics.csv")
  
  # Save results to CSV
  write.csv(results, output_file, row.names = FALSE)
  
  cat(paste("Centrality metrics for", arc_file, "saved to", output_file, "\n"))
}
