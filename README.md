# Grid for mural conservation monitoring

This repository is part of the PhD thesis:

Multifaceted approach to contemporary outdoor mural conservation: condition, interventions, and environmental context in Italian Painted Villages

by Aurora Cairoli

## What this tool does

This project is a simple support tool for monitoring the condition of outdoor mural paintings.

Its purpose is to generate an optimized grid over an image of the mural so that the surface is divided into cells. Once the grid is applied, the user can visually inspect each cell and mark the type of degradation present.

This tool does not calculate percentages or evaluate the degradation automatically.

The calculations are performed after the grid has been applied, following the methodology explained in the thesis.

## Why this is useful

The grid helps the observer:

- divide the mural into comparable units;
- identify the position of each degradation form;
- record the extent of deterioration in a systematic way;
- support visual monitoring over time.

## What is not included

This repository does not contain:

- automatic degradation detection;
- automatic percentage calculation;
- a database or statistical analysis tool.

The grid is only the visual support for the analysis. The final calculations are made manually by the user according to the method described in the thesis.

## Repository contents

- Input/: place the mural images here
- Output/: the processed images with the grid will be saved here
- AddGrid.bat: Windows script that applies the grid to the images

## Installation

This repository is designed for Windows users only.

You do not need to know how to code to use it.

To install and set up the project:

1. Download the repository from GitHub:
   https://github.com/auroracairoli-lab/mural-conservation-grid/archive/refs/heads/main.zip
2. Extract the ZIP file to a folder on your computer.
3. Open the extracted folder.
4. Install ImageMagick, which is required because the script uses it to draw the grid.
   Download it here:
   https://imagemagick.org/script/download.php

## How to use it

1. Open the extracted repository folder.
2. Make sure the Input folder exists.
3. Copy the image or images you want to analyse into the Input folder.
4. Supported formats are: .jpg, .jpeg, and .png.
5. Double-click AddGrid.bat or run it from the command prompt.
6. The script will process the images and save the grid versions in the Output folder.

## Output

The output files are images with the grid applied. These images are then used for manual assessment of degradation forms cell by cell.

After that, the user can calculate the percentage of cells affected by each degradation form by comparing the number of marked cells with the total number of cells.

## Author

Aurora Cairoli

Ca' Foscari University of Venice
