#== tender https://github.com/jacoborus/tender.vim
# red     blue    green   yellow  white   gray    black
# f43753  b3deef  c9d05c  d3b987  ffffff  999999  323232
# c5152f  73cef4  9faa00  ffc24b  eeeeee  666666  1d1d1d
# 79313c  44778d  6a6b3f  715b2f  bbbbbb  444444  0b0b0b

#== from palette
# blue4      : '#335261'
# blue5      : '#293b44'
# green4     : '#464632'
# highlighted: '#ffffff'
# text       : '#eeeeee'
# pearl      : '#dadada'
# gandalf    : '#bbbbbb'
# shadow     : '#323232'
# bg         : '#282828'
# dark       : '#202020'

{ ... }: {
  slug = "tender-bright";
  name = "Tender Bright";
  author = "Jeff Windsor (https://github.com/jeffwindsor)";
  colors = {
    base00 = "#0b0b0b";  # black  3   # base00 - Default Background
    base01 = "#323232";  # black  1   # base01 - Lighter Background (Used for status bars, line number and folding marks)
    base02 = "#444444";  # gray   3   # base02 - Selection Background
    base03 = "#999999";  # gray   1   # base03 - Comments, Invisibles, Line Highlighting
    base04 = "#999999";  # gray   1   # base04 - Dark Foreground (Used for status bars)
    base05 = "#eeeeee";  # white  2   # base05 - Default Foreground, Caret, Delimiters, Operators
    base06 = "#79313c";               # base06 - Light Foreground (Not often used)
    base07 = "#79313c";               # base07 - Light Background (Not often used)
    base08 = "#f43753";  # red    1   # base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "#73cef4";  # blue   2   # base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "#ffc24b";  # yellow 2   # base0A - Classes, Markup Bold, Search Text Background
    base0B = "#c9d05c";  # green  1   # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "#44778d";  # blue   3   # base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "#b3deef";  # blue   1   # base0D - Functions, Methods, Attribute IDs, Headings
    base0E = "#d3b987";  # yellow 1   # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "#6a6b3f";  # green  3   # base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
  };
}

