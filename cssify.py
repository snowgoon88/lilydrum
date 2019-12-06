#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# In order to display a scrollable menu on the right of the nodes.
#
# Extract info from index.html,
# make changes in node*.html, and cours.css. 
# and also to index.html and cours.html to access all nodes in one.

head_start = """<DIV ID="wrapper">\n
\n
<DIV ID="musique">\n"""

foot_start = """Une version PDF du document entier est disponible <A HREF="cours.pdf">ICI</A>.\n

</DIV><!--musique-->\n
\n
<DIV ID="menu">\n
<H2>Menu</H2>
"""

foot_end = """</DIV><!--menu-->\n
\n
</DIV><!--wrapper-->\n
\n
"""


import glob


# ***************************************************************** insert_start
def insert_start( lines, msg_l ):
    """
    Insert 'msg' after "<!--End of Navigation Panel-->"
    """

    ## Read line by line
    new_lines = []
    for idx in range(len(lines)):
        line = lines[idx]
        new_lines.append( line )
        if line.startswith( "<!--End of Navigation Panel-->" ):
            for ml in msg_l:
                new_lines.append( ml )

    return new_lines

# ******************************************************************* insert_end
def insert_end( lines, msg_l ):
    """
    Insert 'msg' before "</BODY>"
    """

    ## Read line by line
    new_lines = []
    for idx in range(len(lines)):
        line = lines[idx]
        if line.startswith( "</BODY>" ):
            for ml in msg_l:
                new_lines.append( ml )
        new_lines.append( line )

    return new_lines

# ***************************************************************** extract_menu
def extract_menu( lines ):
    """
    Extract everything between "<UL" and "</UL>"
    """
    menu = []
    menu_detected = False
    for line in lines:
        if menu_detected:
            menu.append( line )
        if line.startswith( "<UL" ):
            menu_detected = True
            menu.append( line )
        if line.startswith( "</UL>" ):
            menu_detected = False

    return menu



# ******************************************************************************
# ************************************************************************ alter
def alter_node( filename, menu ):
    fhtml = open( filename )
    old_lines = fhtml.readlines()
    fhtml.close()
    
    msg_start = [ head_start ]
    msg_end = [ foot_start ]
    msg_end.extend( menu )
    msg_end.append( foot_end )
    
    new_html = insert_start( old_lines, msg_start )
    new_html = insert_end( new_html, msg_end )
    
    fout = open( filename, "w" )
    fout.writelines( new_html )
    fout.close()
def alter_all_nodes( menu ):
    all_files = glob.glob( 'docs/node*.html' )
    for filename in all_files:
        print( "Making changes to {}".format(filename ))
        alter_node( filename, menu )
        
# ******************************************************************************
    

if __name__ == '__main__':
    fhtml = open( "docs/index.html" )
    lines_html = fhtml.readlines()
    menu = extract_menu( lines_html )

    # #print( menu )
    # alter_node10( menu )

    alter_all_nodes( menu )
    
    
