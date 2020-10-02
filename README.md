# Progress Files

> Intention of this project was to automate the making of the progress report files that would contain scores and question by question analysis for the assignment for a particular student.


## Shell scripting

> Created a ```.sh``` script to automate the process.

### C++
#### Running the script

```bash
$ git clone https://github.com/vinamramunot-tech/TA_scripts.git
$ cd TA_scripts
$ vim student_list.txt (to edit list)
$ chmod +x makingFiles.sh (to give permission for execution)
```

### C and Unix
#### Running the scripts

# Cleaning Ignored Files
```markdown
<!-- Remove the files from the index (not the actual files in the working copy) -->
$ git rm -r --cached .

<!-- Add these removals to the Staging Area... -->
$ git add .

<!-- ...and commit them! -->
$ git commit -m "Clean up ignored files"
```
