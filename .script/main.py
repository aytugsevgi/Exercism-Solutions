from subprocess import PIPE, run
import os
import subprocess
# a = os.system('cd ~/Exercism/swift; for d in ./*/ ; do (cd "$d" && swift test && cd ..); done')
def out(command):
    result = run(command, stdout=PIPE, stderr=PIPE, universal_newlines=True, shell=True)
    return result.stdout
initPath = "~/Exercism/swift"
#b = subprocess.check_output("cd {} ;ls".format(initPath), shell=True)
b = out("cd {} ;ls".format(initPath))
c = str(b).split('\n')
c.remove('')
reportList = []
for folder in c:
    x = subprocess.check_output("cd {}/{} && swift test".format(initPath,folder), shell=True, stderr=subprocess.STDOUT)
    output = x.decode("utf-8")
    translator = str.maketrans({chr(9): ''})
    output = output.translate(translator)
    arr = output.split("\n")
    if "" in arr: 
        arr.remove("")
    reportList.append(arr[-1])
totalTest = 0
totalFail = 0
for report in reportList:
    report = report.strip()
    reportInfo = report.split(" ")
    totalTest += int(reportInfo[1])
    totalFail += int(reportInfo[4])
success = totalTest - totalFail
average = ( success / totalTest ) * 100
print("Test Successful Rate: {:.2f}%".format(average))