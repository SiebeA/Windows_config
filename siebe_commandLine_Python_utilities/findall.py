import re

def main(pattern):
    """
    Find all matches for a given regex pattern in a text file
    """
    input_file = input("Enter the path to the input text file: ")
    
    with open(input_file, 'r', encoding="utf-8") as f:
        text = f.read()
        # enable global and multiline matching
        pattern = pattern
        regex = re.compile(pattern, re.MULTILINE)
        matches = regex.findall(text)

        # export to a text file
        with open('temp_findall.txt', 'w', encoding="utf-8") as f:
            for match in matches:
                print()
                print(match)
                f.write(match + '\n')
            print("\n A text file with the results has been created in the same folder.\n")

if __name__ == '__main__':
    pattern = input("Enter the regex pattern to match: ")
    main(pattern)
