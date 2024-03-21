### cdtree

Small package written in bash linux that helps me to check background of other projects.
Dependencies: UNIX tree, tr, column, grep, etc etc etc


How to use:

```bash
./cdtree target_directory output_directory
```

This will run some linux routines on the larget directory and store some textfiles with statistics in the output directory. For example, using it in this repository and storing the output in <i>tmp</i> directory: 

```bash
./cdtree . tmp
```

Leads to the files shown on the tmp directory, which are the following: 

* PROJECT_tree.tree: Full output of the tree command
* PROJECT_tree_files.csv: Textfile with the path to all files in the target directory
* STATS.txt: Some statistics of the target directory like number of files of the desired extensions, number of directories, etc. 
* T-*.csv: Text files with the full path of files grouped by extensions. 

To change file extensions to look just edit the script <i>remotedir_stats.sh</i>
