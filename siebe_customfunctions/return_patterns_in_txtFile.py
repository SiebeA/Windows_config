
# write a regex that matche all sentences with a structure similar the the following example: El paseo es fácil porque es llano (The walk is easy because is plain) and print the sentences that match the regex without the parantheses.

import re

def main(pattern, text_file):
    with open(text_file, 'r',encoding="utf-8") as f:
        text = f.read()
        # enable global and multiline matching
        pattern = pattern
        regex = re.compile(pattern, re.MULTILINE)
        matches = regex.findall(text)

        # export to a text file
        with open('output.txt', 'w', encoding="utf-8") as f:
            for match in matches:
                f.write(match + '\n')

if __name__ == '__main__':
    # text_file = input("Enter the path to the text file:\n")
    main(pattern = r'^[A-Z].+\(.+\)$', text_file='input.txt')
