from subprocess import PIPE, run
import os
import subprocess
import sys, getopt

class bcolors:
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    BOLD = '\033[1m'
    OKCYAN = '\033[96m'
    UNDERLINE = '\033[4m'
    ENDC = '\033[0m'
def out(command):
    result = run(command, stdout=PIPE, stderr=PIPE, universal_newlines=True, shell=True)
    return result.stdout

def runTests(path):
    pathCommand = ""
    if path != "":
        pathCommand = "cd {} &&".format(path) 
    b = out("{} ls".format(pathCommand))
    folderList = str(b).split('\n')
    folderList.remove('')
    reportList = []
    testFaileds = []
    compilingError = []
    packageCount = 0
    for folder in folderList:
        try:
            x = subprocess.check_output("{} cd {} && swift test".format(pathCommand,folder), shell=True, stderr=subprocess.STDOUT)
            output = x.decode("utf-8")
            translator = str.maketrans({chr(9): ''})
            output = output.translate(translator)
            arr = output.split("\n")
            if "" in arr: 
                arr.remove("")
            reportList.append(arr[-1])
            packageCount += 1
        except subprocess.CalledProcessError as e:
            output = e.output.decode("utf-8")
            translator = str.maketrans({chr(9): ''})
            output = output.translate(translator)
            arr = output.split("\n")
            if "" in arr: 
                arr.remove("")
            if "Compiling" in arr[0] and not("Executed" in arr[-1]):
                compilingError.append(folder)
                packageCount += 1
            elif "root manifest not found" in output:
                continue
            elif "Not a directory" in output:
                continue
            elif "can't cd" in output:
                continue
            else:
                reportList.append(arr[-1])
                testFaileds.append(folder)
                packageCount += 1

    totalTest = 0
    totalFail = 0
    for report in reportList:
        report = report.strip()
        reportInfo = report.split(" ")
        totalTest += int(reportInfo[1])
        totalFail += int(reportInfo[4])

    # displaying the results on terminal
    success = totalTest - totalFail
    average = ( success / totalTest ) * 100
    print(bcolors.OKCYAN + "Total package count: {}".format(packageCount) + bcolors.ENDC)
    print(bcolors.OKCYAN + "Total test case: {}".format(totalTest) + bcolors.ENDC)
    if len(compilingError)>0:
        print(bcolors.FAIL + "Total compiling error: {}".format(len(compilingError)) + bcolors.ENDC)
        print(bcolors.FAIL + "\t-Packages that fail on compile! (These packages are not included in the test rate)" + bcolors.ENDC)
        print(bcolors.FAIL + "\t{}\n".format(compilingError) + bcolors.ENDC)
    print(bcolors.WARNING + "Total failed test case: {}".format(totalFail) + bcolors.ENDC)
    if totalFail>0:
        print(bcolors.WARNING + "\t-Packages that fail the test!" + bcolors.ENDC)
        print(bcolors.WARNING + "\t{}\n".format(testFaileds) + bcolors.ENDC)
    rateColor = bcolors.OKGREEN
    if average<80.0 and average>=70.0:
        rateColor = bcolors.WARNING
    elif average<70.0:
        rateColor = bcolors.FAIL
    print(rateColor + "Test Successful Rate: {:.2f}%".format(average) + bcolors.ENDC)


arg = ""
if len(sys.argv)>1:
    arg = sys.argv[1]

runTests(arg)

    
