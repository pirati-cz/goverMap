# import re
# regex = re.compile(r"^.*interfaceOpDataFile.*$", re.IGNORECASE)
# for line in some_file:
#     line = regex.sub("interfaceOpDataFile %s" % fileIn, line)
#     # do something with the updated line


import fileinput
import re
import csv
import sys
swap = True

# f = open('titleStrip_output','w')t


inFileName = sys.argv[1]
outFileName = 'titles_removed.csv'

inFile = open(inFileName,'r')
outFile = open(outFileName,'w')

reg = re.compile(r'([\u00c0-\u01ffa-zA-Z\'\-]+)\s([\u00c0-\u01ffa-zA-Z\'\-]+)\b(?!\.)')

try:
    reader = csv.DictReader(inFile)  # creates the reader object
    
    writer = csv.DictWriter(outFile,reader.fieldnames)

    for row in reader:   # iterates the rows of the file in orders

        name = row['Jméno']
        
        match = reg.search(name)

        if match == None:
          result = ""
        elif swap:
          result = " ".join(match.groups()[::-1])
        else:
          result = " ".join(match.groups())    # prints each row

        row['Jméno'] = result

        writer.writerow(row)

finally:
    inFile.close()      # closing
    outFile.close()
 
# with open('fileinput', newline='') as f:
#     reader = csv.reader(f, delimiter=':', quoting=csv.QUOTE_NONE)
#     for row in reader:

        

  
    

    # print(oldline.rstrip() + " >>> " + result)
    # f.write(result + '\n') 


# inFile.close()
# outFile.close()