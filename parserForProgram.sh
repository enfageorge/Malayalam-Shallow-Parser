#!/usr/bin/bash
#To be rewritten later
java StatisticalSandhiSplitter9 config >  temp.txt  #sandhi splitting
rm temp.txt
python3 featurise_test.py ../temp/tokens.txt ../temp/pos.test	#Feature extraction for POS tagging
sed '/^[\? |\. |\! ] \?/a \\n' ../../temp/pos.test > ../../temp/pos.test.sent
crf_test -m POS.model ../temp/pos.test.sent | cut -f 1,13 > ../temp/chunk.test #POS tagging and cleaning the output format
crf_test -m Chunk.model ../temp/chunk.test > ../temp/chunkedText #Chunking