from subprocess import PIPE, run
import os
import subprocess

def out(command):
    result = run(command, stdout=PIPE, stderr=PIPE, universal_newlines=True, shell=True)
    return result.stdout

b = out("ls")
folderList = str(b).split('\n')
folderList.remove('')
reportList = []
onErrorList = []
for folder in folderList:
    try:
        x = subprocess.check_output("cd {} && swift test".format(folder), shell=True, stderr=subprocess.STDOUT)
        output = x.decode("utf-8")
        translator = str.maketrans({chr(9): ''})
        output = output.translate(translator)
        arr = output.split("\n")
        if "" in arr: 
            arr.remove("")
        reportList.append(arr[-1])
    except subprocess.CalledProcessError as e:
        output = e.output.decode("utf-8")
        translator = str.maketrans({chr(9): ''})
        output = output.translate(translator)
        arr = output.split("\n")
        if "" in arr: 
            arr.remove("")
        reportList.append(arr[-1])
        onErrorList.append(folder)
totalTest = 0
totalFail = 0
for report in reportList:
    report = report.strip()
    reportInfo = report.split(" ")
    totalTest += int(reportInfo[1])
    totalFail += int(reportInfo[4])
success = totalTest - totalFail
average = ( success / totalTest ) * 100
print("Total package count: {}".format(len(folderList)))
print("Total test case: {}".format(totalTest))
print("Total failed test case: {}".format(totalFail))
if totalFail>0:
    print("\tPackages that fail the test!")
    print("\t{}\n".format(onErrorList))
print("Test Successful Rate: {:.2f}%".format(average))

