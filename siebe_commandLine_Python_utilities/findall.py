import re

def main():
    """
    Find all matches for a given regex pattern in a text file
    """
    # Prompt the user for the path to the input file
    path = input('Enter the path to the input file: ').strip('"')

    # Prompt the user for the regex pattern to match
    pattern = input('Enter the regex pattern to match: ')

    # Set the number of words to include before and after each match
    before = after = 1000

    # Prompt the user for whether the search should be case-sensitive
    case_sensitive = input('Make the search case-sensitive? (y/n) ').lower() == 'y'

    # Set the regex flags based on whether the search is case-sensitive
    if case_sensitive:
        flags = re.MULTILINE
    else:
        flags = re.IGNORECASE | re.MULTILINE

    # Read the text from the input file
    with open(path, 'r', encoding='utf-8') as f:
        text = f.read()

    # Compile the regex pattern with the appropriate flags
    regex = re.compile(pattern, flags)

    # Find all matches in the text and their surrounding context
    matches = []
    for match in regex.finditer(text):
        start = max(0, match.start() - before)
        end = min(len(text), match.end() + after)
        context = text[start:end]
        matches.append((match.group(), context))

    # Print the matches
    if len(matches) == 0:
        print('No matches found.')
    else:
        print(f'{len(matches)} match(es) found:')
        for i, (match, context) in enumerate(matches):
            print(f'{i+1}. {match}')
            print(f'   {context}\n')

if __name__ == '__main__':
    # Call the main function
    main()
