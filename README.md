# Exercism-Solutions with Swift Test Automation
 
This script automating your swift unit tests. 
Script handle the terminal outputs, it shows you compiling errors, failed tests, which packages encountered errors and average test success results.

## Applying a script on any new push:

```yml
name: CI
 on:
   push:
     branches: [ main ]
     
 jobs:
   build:
     runs-on: ubuntu-latest
     steps:
       # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
       - uses: actions/checkout@v2
       # You can run script like this
       - name: Run Script
         run: python3 .script/main.py

```
## If your package files are in a specific path. (No need if it's directly in your repository)
You can specify which file it is under as parameters. Example path for "swift/mySolutions".
```yml
name: CI
 on:
   push:
     branches: [ main ]
     
 jobs:
   build:
     runs-on: ubuntu-latest
     steps:
       # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
       - uses: actions/checkout@v2
       # You can run script like this
       - name: Run Script
         run: python3 .script/main.py swift/mySolutions

```

## Output results will be like these.

![Screen Shot 2021-04-26 at 12 59 26](https://user-images.githubusercontent.com/33103753/116068942-7cda0b80-a693-11eb-8f67-18b105f59794.png)

If your tests has any fail or compiling error.

![Screen Shot 2021-04-26 at 12 54 48](https://user-images.githubusercontent.com/33103753/116068923-764b9400-a693-11eb-84c7-6c8be1115cee.png)




