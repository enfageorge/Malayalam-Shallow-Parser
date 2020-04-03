import sys
from polyglot.text import Text

inp_file = open(sys.argv[1],"r").read()
out_file = sys.argv[2]

tokenised = Text(inp_file)

with open(out_file, 'w') as file_handler:
    for item in tokenised.sentences:
        file_handler.write("{}\n".format(item))



