#!/usr/bin/env python

"""
Pandoc filter to process code blocks with class "graphviz" into
graphviz-generated images.
"""

import os
import sys
from pandocfilters import toJSONFilter, Str, Para, Image



def coding(key, value, format, meta):
    if key == 'CodeBlock':
        [[ident, classes, keyvals], code] = value
        caption = "caption"
        for hello in keyvals:
             if hello[0] == 'path':
                 sys.stderr.write(hello[1])
                 filename = hello[1]
                 dir = os.path.dirname(filename)
                 try:
                        os.stat(dir)
                 except:
                        os.mkdir(dir)
                    
                 file_object = open(hello[1],"w")
                 file_object.write(code)
                 file_object.close();
        
if __name__ == "__main__":
    toJSONFilter(coding)
