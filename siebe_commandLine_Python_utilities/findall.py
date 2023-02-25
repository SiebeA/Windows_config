import argparse
import re

def main(pattern, input):
    """
    (command line able) Find all matches for a given regex pattern in a text file
    """
    with open(input, 'r',encoding="utf-8") as f:
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
            print("\n a text file with the results has been created in the same folder.\n")

if __name__ == '__main__':
    # Create an ArgumentParser object
    parser = argparse.ArgumentParser()

    # Add arguments to the parser
    parser.add_argument('--input', required=True, help='The path to the text file')
    parser.add_argument('--pattern', required=True, help='The regex pattern to match')

    # Parse the command-line arguments
    args = parser.parse_args()

    # Call the main function with the parsed arguments
    main(input=args.input, pattern=args.pattern)