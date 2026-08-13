# Grid for Conservation Monitoring of Outdoor Murals

This repository is part of the PhD thesis:

Multifaceted approach to contemporary outdoor mural conservation: condition, interventions, and environmental context in Italian Painted Villages

by Aurora Cairoli

This script was developed for the monitoring and assessment of the state of conservation of outdoor mural paintings. The goal is to apply a grid over an image of the painted surface so that each cell can be visually annotated according to a specific degradation form. The resulting dataset allows the user to quantify the extent of each degradation type by calculating:

Number of cells affected by a given degradation form / Total number of cells

This method supports systematic condition assessment and comparison across mural surfaces.

## Project purpose

The application of the grid is used for monitoring the state of conservation of outdoor mural paintings. After the grid is applied, the user obtains an image where each cell can be marked with a certain degradation form. The percentage of damaged cells for each degradation category is then calculated relative to the total number of cells in the image.

This workflow is useful for:

- documenting mural condition;
- identifying recurring degradation patterns;
- comparing conservation states across different surfaces;
- supporting quantitative analysis in the context of mural heritage monitoring.

## Repository contents

- Input/: place the original images here
- Output/: generated grid images are saved here
- AddGrid.bat: Windows batch script that overlays the grid on each image

## Requirements

This project requires ImageMagick to be installed and available in the system PATH.

Download ImageMagick here:
https://imagemagick.org/script/download.php

## How to use it

1. Install ImageMagick and make sure the magick command is available in your PATH.
2. Place one or more image files (.jpg, .png, .jpeg) in the Input folder.
3. Run AddGrid.bat.
4. The script processes the images and saves the grid-overlaid versions in the Output folder.

## Output

Each processed image is exported with a grid applied. The generated output can then be used for manual conservation assessment, where each cell is evaluated and assigned a degradation form. The percentage of cells with a given degradation condition is then calculated against the total cell count.

## Author

Aurora Cairoli
Ca' Foscari University of Venice

## Notes

The script is designed for a Windows environment and uses a batch file to automate the grid generation process with ImageMagick commands.