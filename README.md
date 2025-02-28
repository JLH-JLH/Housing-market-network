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

