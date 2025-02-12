# **Embedded Systems Design: Deriche Smoothing**

## ☰ Contents  
  - [**_1. Project Description_**](#1-project-description)  
  - [**_2. Project Overview_**](#2-project-overview)  
  - [**_3. Basic Structure_**](#3-basic-structure)  
    - [**_Part 1 - Algorithm Implementation, Loop Transformations/Optimizations_**](#part1)  
    - [**_Part 2 - Memory Hierarchy_**](#part2)  
    - [**_Part 3 - Data Reusability_**](#part3)  
    - [**_Presentation_**](#presentation)

## 1. Project Description
This repository contains projects completed for the 9th-semester '**_Embedded Systems Design_**' course at DUTH EECE, from October 2024 to February 2025.

**_Professor_: *Ioannis Vourkas***

## 2. Project Overview
We optimized the Deriche Smoothing algorithm (for image processing) in **C** by applying the parameters from [Wikipedia](https://en.wikipedia.org/wiki/Deriche_edge_detector). The optimization involved **loop transformations**, exploring **memory hierarchies**, and enhancing **data reusabilit**y. Execution cycles and other cycle-related metrics were measured using the *Armulator* and *AXD Debugger* from the *ARM Development Suite*.

The following images display the results of applying the Deriche smoothing filter with varying smoothing parameters:
 Smoothing Parameter a = 1 | Smoothing Parameter a = 2 | Smoothing Parameter a = 3 | 
:-------------------------:|:-------------------------:|:-------------------------:
![](Results/a=1.png)  |  ![](Results/a=2.png) |  ![](Results/a=4.png)

## 3. Basic Structure
The project is divided into **3** parts:

 <details>  
	 <summary>
		<h3>
			<div id='part1'/>
				Part 1 - Algorithm Implementation, Loop Transformations/Optimizations
		</h3>
	</summary>
        
  In the first part of the project we assume ideal memory and we
  - Implement the **Deriche Smoothing Filter**
  - Test Different **Loop transformations**
    Loop Tilling was the optimization technique with the best metrics.
   </details>

  
  <details>  
  	<summary>
  		<h3>
			<div id='part2'/>
				Part 2 - Memory Hierarchy
				</h3>
	</summary>
        
  Building on the best version from Part 1, we implement different memory hierarchies and measure the trade-offs between memory size, speed, and execution time:
  - Adjust memory size based on ZI data.
  - Experiment with varying read/write access times.
  - Use SRAM, DRAM, and separate ZI data into frequently and infrequently accessed variables.
  
  Memory configurations were implemented using: `scatter.txt`, `memory.map`, and `stack.c`.
</details>

<details>
	<summary>
		<h3>
			<div id='part3'/>
				Part 3 - Data Reusability
		</h3>
	</summary>

 We introduce buffers to reduce memory calls and decrease   `total`, `waiting`, and `true idle` cycles by temporarily storing parts of large arrays:
  - Use the current line buffer technique.
  - Apply the block buffer technique.
  - Combine both techniques (current line and block buffers).
  - Place buffers in the fastest available memory.
  </details>
  
  ### **Presentation**
  A brief presentation summarizing the topics covered in Part 1, Part 2, and Part 3, along with the conclusions.
