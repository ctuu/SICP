import sys
import re

def calcBrackets(s):
    return len(re.findall(r'\(', s)) - len(re.findall(r'\)', s))

bracket = 0
inDefine = False
afterDefine = False


for line in sys.stdin:

    if line.startswith(';Val'):
        if not afterDefine:
            print(line)
        afterDefine = False

    if line.startswith(';Unbound variable'):
        print('PARSE ERROR')
        print(line)
        exit(0)

    if line.startswith(';Un'):
        print()

    if line.startswith(';'):
        continue

    if line.startswith('End of'):
        exit(0)

    if inDefine:
        if line.startswith('(define'):
            print('PARSE ERROR')
            exit(0)
        bracket += calcBrackets(line)
        inDefine = bracket != 0
        continue

    if line.startswith('(define'):
        bracket += calcBrackets(line)
        inDefine = bracket > 0
        suffix = '...' if bracket > 0 else ''
        print(f'{line[:-1]} {suffix}')
        afterDefine = True

    else:
        print(line, end='')
        afterDefine = False
