"""
This script searches for matches of a given regex pattern in a text file.
The matches can be optionally saved to a file or run in the terminal.

Usage:
python script.py OR $findall in terminal
"""


def main(path=None, pattern=None, save=False, case_sensitive=False, after = None): # with none as default, you can call the function without arguments
    import re
    if not path:
        path = input('Enter the path to the input file: ')
    # strip both single and double quotes from the path
    path = path.strip("'" + '"')

    # Prompt the user for the regex pattern to match
    if not pattern:
        pattern = input('Enter the regex pattern to match: ')

    if not save:
    # Prompt the user for whether to save the matches to a file later on if answer is 'y' true else false
        save = input('Do you want to save the matches to a file? (y/n) ').lower() == 'y'

    # ask an integer for the number of characters before and after the match to be saved
    after = input('How many characters before and after the match do you want to save? (integer) ')
    after = int(after)
    before = after

    # Prompt the user for whether the search should be case-sensitive
    case_sensitive = input('Make the search case-sensitive? (y/n) ').lower() == 'y'

    # Set the regex flags based on whether the search is case-sensitive
    if case_sensitive:
        flags = re.MULTILINE
    else:
        flags = re.IGNORECASE | re.MULTILINE


    # Read the text from the input file
    with open(path, 'r', encoding='utf-8') as f:
        # read the text and strip too-many newlines: 2 for one and 1 for none:
        text = f.read().replace('\n\n', '\n').strip('\n')


    # Compile the regex pattern with the appropriate flags
    regex = re.compile(pattern, flags)

    # Find all matches in the text and their surrounding context
    matches = []
    for match in regex.finditer(text):
        start = max(0, match.start() - before)
        end = min(len(text), match.end() + after)
        context = text[start:end]
        # Colorize the matched text within the context output
        match_start = match.start() - start
        match_end = match.end() - start
        # colour the context if not saved to file for nice terminal colouring
        if not save:
            # ANSI escape sequences for colorizing output
            COLOR_RED = '\033[91m'
            COLOR_RESET = '\033[0m'
            context = context[:match_start] + COLOR_RED + context[match_start:match_end] + COLOR_RESET + context[match_end:]
        else:
            context = context[:match_start] + context[match_start:match_end] + context[match_end:]
        matches.append((match.group(), context))

    # Print the matches if save is not true
    if not save:
        if len(matches) == 0:
            print('No matches found.')
        else:
            print(f'{len(matches)} match(es) found:')
            for i, (match, context) in enumerate(matches):
                print(f'{i+1}. {match}')
                print(f'   {context}\n')

    # remove the 0th element of all because it is the match itself and it will be prefixing the context that already contains the match
    for i in range(len(matches)):
        matches[i] = matches[i][1]



    if save:
        print('Saving matches to file...')

        filename = path.split('\\')[-1]
        path = "C:\\Users\\Siebe\Desktop\\pattern=={pattern}--original==filename.txt".format(pattern=pattern)
        with open(path, 'w', encoding='utf-8') as f:
            for match in matches:
                # substitute a pattern in the match:
                match = match.replace('Kirillov', '***Kirillov*** ')
                f.write(f'{match}\n----\n')
    


if __name__ == '__main__':
    help(__name__)

    # DEBUG:
    # path = 'C:\\Users\\Siebe\\Calibre Library\\Unknown\\book philosophical fiction Dostoevsk (10)\\book philosophical fiction Dost - Unknown.txt'
    # pattern = 'Kirillov'
    # save = True
    # case_sensitive = True

    # main(path, pattern, save, case_sensitive) # DEBUG
    main()