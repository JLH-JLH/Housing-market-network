# Housing-market-network

# (1) MVGC Analysis for Housing Market Network

## Overview
This repository contains MATLAB code for performing **Multivariate Granger Causality (MVGC) analysis** on the log returns of housing price indices across different cities. The results are stored as a **Granger causality matrix**, which identifies causal relationships between housing markets.

## System Requirements
- **MATLAB** (Tested on MATLAB 2024a)
- **Dependencies**:
  - [MVGC Toolbox for MATLAB](https://users.sussex.ac.uk/~lionelb/MVGC/html/mvgchelp.html)
  - Statistics and Machine Learning Toolbox
  - Signal Processing Toolbox

## Installation Guide
1. **Install MATLAB** (2024a or later recommended).
2. **Download and install the MVGC Toolbox** from:  
   [MVGC Toolbox](https://users.sussex.ac.uk/~lionelb/MVGC/html/mvgchelp.html).
3. Ensure the **Statistics and Machine Learning Toolbox** and **Signal Processing Toolbox** are installed in MATLAB.
4. Place the dataset **CSV files** in the directory specified in the script (`C:/Users/aidan/OneDrive/Desktop/Centrality metrics/MVGC`).
5. Update the `folder` variable in the script if needed.

### Typical Installation Time
- MATLAB and required toolboxes: **5-10 minutes**
- MVGC Toolbox installation: **2-5 minutes**

## Usage
### Running the MVGC Analysis
1. Store the CSV files containing **time series housing price indices** in the appropriate folder.
2. Update the `folder` variable in the script if necessary.
3. Run the MATLAB script.

### Expected Output
- The script will:
  - Load CSV files from the specified directory.
  - Compute **log returns** for each city's housing price index.
  - Normalize the log returns.
  - Estimate the optimal **model order** for Granger causality analysis.
  - Compute the **MVGC matrix**.
  - Save the **MVGC results** as a CSV file (`MVGC_results.csv`).

### Expected Run Time
- Using the provided data, the expected run time is 0.52 seconds.

## File Descriptions
- **`MVGC_analysis.m`** - MATLAB script for MVGC computation.
- **Input CSV Files** - Contain housing price index time series data for different cities.
- **Output File (`MVGC_results.csv`)** - Granger causality matrix (rows: "from" city, columns: "to" city).

## Example Output Format (MVGC Matrix)
|   | City A | City B | City C |
|---|--------|--------|--------|
| **City A** | 0.00   | 0.32   | 0.15   |
| **City B** | 0.25   | 0.00   | 0.08   |
| **City C** | 0.12   | 0.20   | 0.00   |

# (2) Centrality Metrics Analysis Using `igraph` in R

## Overview
This repository contains an **R script** for computing various **centrality metrics** from directed graphs using the `igraph` package. The script reads **node and arc data**, constructs graphs, calculates centrality metrics, and saves the results as CSV files.

## System Requirements
- **R Version:** Tested on R 4.3.2
- **Required R Packages:**
  - `igraph` (will be installed automatically if not found)
- **Operating System Compatibility:**
  - Windows, macOS, Linux (tested on Windows 11)

## Installation Guide
1. **Install R and RStudio (optional)**
   - Download R from: [https://cran.r-project.org/](https://cran.r-project.org/)
   - (Optional) Download RStudio from: [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
   
2. **Ensure the `igraph` package is installed**
   - The script **automatically checks and installs `igraph`** if it is missing.

3. **Prepare the input files**
   - Store the **`Node.csv`** and **Arc files (`Arc_*.csv`)** in the working directory.

4. **Set the working directory in the script**
   - Modify the `setwd("C:/path/to/your/data")` line to match your file location.

### Typical Installation Time
- Installing R and RStudio: **5-10 minutes**
- Installing the `igraph` package: **Less than 1 minute**

---

## Usage
### Running the Centrality Analysis
1. **Ensure the working directory is set correctly** in the script.
2. **Place the input files (`Node.csv` and `Arc_*.csv`) in the directory**.
3. **Run the script in RStudio or directly in R**.

### Expected Output
- The script reads multiple **Arc CSV files** and performs **centrality metric calculations** for each graph.
- The computed metrics include:
  - **In-Degree Centrality** (`InDegree`)
  - **Out-Degree Centrality** (`OutDegree`)
  - **Eigenvector Centrality** (`Eigenvector`)
  - **Hub Score** (`Hub`)
  - **Authority Score** (`Authority`)
- The results are saved as CSV files with the naming format:
