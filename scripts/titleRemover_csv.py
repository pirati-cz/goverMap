#!/usr/bin/env python3

# import re
# regex = re.compile(r"^.*interfaceOpDataFile.*$", re.IGNORECASE)
# for line in some_file:
#     line = regex.sub("interfaceOpDataFile %s" % fileIn, line)
#     # do something with the updated line

import re
import csv
import sys


swap = True
col_name = 'Jméno'


def parse_args():
    try:
        inputName = sys.argv[1]
    except IndexError:
        print("Usage: %s <filename>" % sys.argv[0])
        sys.exit()

    pattern = '(.*)(\.csv)'
    result = re.search(pattern, sys.argv[1])

    if result == None:
        raise Exception("Wrong filename")

    outFileName = result.groups()[0] + '_removed.csv'

    return sys.argv[1], outFileName

filenames = parse_args()

inFile = open(filenames[0], 'r')
outFile = open(filenames[1], 'w')

reg = re.compile(r'([\u00c0-\u01ffa-zA-Z\'\-]+)\s([\u00c0-\u01ffa-zA-Z\'\-]+)\b(?!\.)')

try:
    reader = csv.DictReader(inFile)  # creates the reader object
    
    writer = csv.DictWriter(outFile,reader.fieldnames)

    for row in reader:   # iterates the rows of the file in orders

        name = row[col_name] #TODO make more general
        
        match = reg.search(name)

        if match == None:
          result = ""
        elif swap:
          result = " ".join(match.groups()[::-1])
        else:
          result = " ".join(match.groups())    # prints each row

        row[col_name] = result

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