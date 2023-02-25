import re

def main(pattern):
    """
    Find all matches for a given regex pattern in a text file
    """
    input_file = input("Enter the path to the input text file: ")
    
    # Strip quotes from the input file path, if present
    input_file = input_file.strip("\"'")

    with open(input_file, 'r', encoding="utf-8") as f:
        text = f.read()
        # enable global and multiline matching
        pattern = pattern
        regex = re.compile(pattern, re.MULTILINE)
        matches = regex.findall(text)
        # only print unique matches
        matches = list(set(matches))

        # export to a text file
        with open('temp_findall.txt', 'w', encoding="utf-8") as f:
            for match in matches:
                start_index = text.find(match)
                end_index = start_index + len(match)
                context_start = max(start_index - 40, 0)
                context_end = min(end_index + 40, len(text))
                context = text[context_start:context_end]
                print()
                print("Match: ", match)
                print("Context: ", context)
                f.write("Match: " + match + '\n')
                f.write("Context: " + context + '\n\n')
            print("\nA text file with the results has been created in the same folder.\n")

if __name__ == '__main__':
    pattern = input("Enter the regex pattern to match: ")
    main(pattern)
