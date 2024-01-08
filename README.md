# ADM-HW5: Network Scholar: Graph-Based Analysis and Visualization of Academic Collaborations
This repository contains the source code, notebooks, and additional materials related to Assignment 5 of the "Algorithms for Data Mining" course (23/24) from the Data Science Master's program at Sapienza University of Rome. Below, you will find an overview of the contents of this repository.


## Description

In this assignment, the pivotal role of citation networks in mapping the evolution of knowledge within academic research will be explored. The significance of graph analysis will be emphasized, with a focus on the examination of these networks to identify influential works, trace idea development, and assess research impact. Additionally, the potential of graph analysis to uncover hidden patterns, predict emerging trends, and understand intricate relationships within citation networks will be investigated. The assignment is centered on a detailed investigation into citation realms, aiming to extract pertinent characteristics and insights from the interconnected nature of scholarly publications.

<p align="center">
<img src="https://filelist.tudelft.nl/Library/Themaportalen/Research%20Analytics/C12.png" width = 800>
</p>

The goal is to carry out the following tasks:

1. **Data Pre-processing:**
   - Identify the most connected component in the graph.
   - Select the top 10,000 papers with the highest number of citations.
   - Define nodes for both graphs based on selected papers and their authors.
   - Establish edges considering only the citation and collaboration relationships among the chosen papers and authors.

2. **Backend Implementation:**
   - Implement five functionalities for graph analysis.
     - Functionality 1: Examine graph features.
     - Functionality 2: Identify nodes' contribution using centrality measurements.
     - Functionality 3: Find the shortest ordered walk on the collaboration graph.
     - Functionality 4: Determine the minimum number of edges to disconnect graphs.
     - Functionality 5: Extract communities.

3. **Frontend Implementation:**
   - Visualize the results for each functionality.
     - Visualization 1: Display graph features, hubs, and distributions.
     - Visualization 2: Present nodes' centrality values.
     - Visualization 3: Visualize the shortest-ordered route.
     - Visualization 4: Display disconnected graph information.
     - Visualization 5: Show community extraction details.

4. **Bonus - PageRank on MapReduce:**
   - Implement the PageRank algorithm using the MapReduce paradigm.
   - Focus on the top 1,000,000 papers with the most citations.

5. **Command Line Question (CLQ):**
   - Use command line tools to answer specific questions related to the citation graph.
     - Identify important "connector" nodes.
     - Analyze the degree of citation variation among nodes.
     - Calculate the average length of the shortest path among nodes.

6. **Algorithmic Questions (AQ):**
   - Address the sports team selection scenario.
     - Define optimal skills required for the team.
     - Determine the maximum possible global score for Team Rome based on athlete skills.

For a detailed understanding of the assignment requirements and problems, refer to this [link](https://github.com/Sapienza-University-Rome/ADM/tree/master/2023/Homework_5).

## Dataset

This dataset is exclusively intended for research purposes. The citation data has been gathered from diverse sources such as DBLP, ACM, MAG (Microsoft Academic Graph), among others. The initial release comprises 629,814 papers and 632,752 citations, each paper being accompanied by details such as abstract, authors, year, venue, and title. Researchers can leverage this dataset for various purposes, including clustering with network and side information, exploring influence within the citation network, identifying highly influential papers, and conducting topic modeling analyses.

You can find the dataset used in this [link](https://www.kaggle.com/datasets/mathurinache/citation-network-dataset).

## Repo content

- **main (2).ipynb:** A comprehensive Jupyter notebook that presents a detailed analysis of the data. It includes a systematic breakdown of the analysis process, the resulting insights, and accompanying explanations to give a better understanding of the findings.
- **citation_graph.gml:**  A .gml file containing the citation graph.
- **collab_graph.gml:**  A .gml file containing the collaboration graph.
- **commandline_4.sh:** A PowerShell script that carries out the Command Line Task.


## Usage
- Clone the repo using the command 👉 **git clone https://github.com/cricro1304/ADM-HW5/tree/main** in a bash script terminal.
- Open the Jupyter Notebook using your desired IDE and start following the instructions there to replicate the results.

## Collaborators
- Hazem Aboulfotouh (aboulfotouh.2105193@studenti.uniroma1.it)
- Cristiano Perrone (perrone.2128080@studenti.uniroma1.it)
- Susanna Di Giammarco (digiammarco.1838403@studenti.uniroma1.it)
- Eldar Gabdulsattarov (egabdulsattarov@gmail.com)



