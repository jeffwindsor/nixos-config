let
  seaFoam       = "#C7CCD1";    # custom lighter foreground
  fujiWhite     = "#DCD7BA";    # default foreground
  oldWhite      = "#C8C093";    # dark foreground, e.g. statuslines
  sumiInk0      = "#16161D";    # dark background, e.g. statuslines, floating windows
  sumiInk1      = "#1F1F28";    # default background
  sumiInk3      = "#363646";    # lighter background, e.g. colorcolumns and folds
  sumiInk4      = "#54546D";    # darker foreground, e.g. linenumbers, fold column
  waveBlue1     = "#223249";    # popup background, visual selection background
  waveBlue2     = "#2D4F67";    # popup selection background, search background
  winterGreen   = "#2B3328";    # diff add background
  winterYellow  = "#49443C";    # diff change background
  winterRed     = "#43242B";    # diff deleted background
  winterBlue    = "#252535";    # diff line background
  autumnGreen   = "#76946A";    # git add
  autumnRed     = "#C34043";    # git delete
  autumnYellow  = "#DCA561";    # git change
  samuraiRed    = "#E82424";    # diagnostic error
  roninYellow   = "#FF9E3B";    # diagnostic warning
  waveAqua1     = "#6A9589";    # diagnostic info
  dragonBlue    = "#658594";    # diagnostic hint
  fujiGray      = "#727169";    # comments
  springViolet1 = "#938AA9";    # light foreground
  oniViolet     = "#957FB8";    # statements and keywords
  crystalBlue   = "#7E9CD8";    # functions and titles
  springViolet2 = "#9CABCA";    # brackets and punctuation
  springBlue    = "#7FB4CA";    # specials and builtins
  lightBlue     = "#A3D4D5";    # not used!
  waveAqua2     = "#7AA89F";    # types
  springGreen   = "#98BB6C";    # strings
  boatYellow1   = "#938056";    # not used
  boatYellow2   = "#C0A36E";    # operators, regex
  carpYellow    = "#E6C384";    # identifiers
  sakuraPink    = "#D27E99";    # numbers
  waveRed       = "#E46876";    # standout specials 1, e.g. builtin variables
  peachRed      = "#FF5D62";    # standout specials 2, e.g. exception handling, returns
  surimiOrange  = "#FFA066";    # constants, imports, booleans
  katanaGray    = "#717C7C";    # deprecated
in {
  "ui.selection" = { bg = waveBlue2; };
  "ui.selection.primary" = { bg = waveBlue1; };
  "ui.background" = { fg = fujiWhite; bg = sumiInk1; };
  "ui.linenr" = { fg = sumiInk4; };
  "ui.linenr.selected" = { fg = roninYellow; };
  "ui.virtual.indent-guide" = sumiInk4;
  "ui.statusline" = { fg = oldWhite; bg = sumiInk0; };
  "ui.statusline.inactive" = { fg = fujiGray; bg = sumiInk0; };
  "ui.statusline.normal" = { fg = sumiInk0; bg = crystalBlue; modifiers = ["bold"]; };
  "ui.statusline.insert" = { fg = sumiInk0; bg = autumnGreen; };
  "ui.statusline.select" = { fg = sumiInk0; bg = oniViolet; };
  "ui.bufferline" = { fg = oldWhite; bg = sumiInk0; };
  "ui.bufferline.inactive" = { fg = fujiGray; bg = sumiInk0; };
  "ui.popup" = { fg = fujiWhite; bg = sumiInk0; };
  "ui.window" = { fg = fujiWhite; };
  "ui.help" = { fg = fujiWhite; bg = sumiInk1; };
  "ui.text" = fujiWhite;
  "ui.text.focus" = { fg = fujiWhite; bg = waveBlue1; modifiers = ["bold"]; };
  "ui.virtual" = waveBlue1;
  "ui.cursor" = { fg = waveBlue1; bg = fujiWhite; };
  "ui.cursor.primary" = { fg = waveBlue1; bg = seaFoam; };
  "ui.cursor.match" = { fg = seaFoam; modifiers = ["bold"]; };
  "ui.highlight" = { fg = fujiWhite; bg = waveBlue2; };
  "ui.menu" = { fg = fujiWhite; bg = sumiInk1; };
  "ui.menu.selected" = { fg = fujiWhite; bg = waveBlue1; };
  "ui.cursorline.primary" = { bg = sumiInk3; };
  "diagnostic" = { modifiers = ["underlined"]; };
  "error" = samuraiRed;
  "warning" = roninYellow;
  "info" = waveAqua1;
  "hint" = dragonBlue;
  "diff.plus" = autumnGreen;
  "diff.minus" = autumnRed;
  "diff.delta" = autumnYellow;
  "type" = waveAqua2;
  "constant" = surimiOrange;
  "constant.numeric" = sakuraPink;
  "constant.character.escape" = springBlue;
  "string" = springGreen;
  "string.regexp" = boatYellow2;
  "comment" = fujiGray;
  "variable" = fujiWhite;
  "variable.builtin" = waveRed;
  "variable.parameter" = carpYellow;
  "variable.other.member" = carpYellow;
  "label" = springBlue;
  "punctuation" = springViolet2;
  "punctuation.delimiter" = springViolet2;
  "punctuation.bracket" = springViolet2;
  "keyword" = oniViolet;
  "keyword.directive" = peachRed;
  "operator" = boatYellow2;
  "function" = crystalBlue;
  "function.builtin" = peachRed;
  "function.macro" = waveRed;
  "tag" = springBlue;
  "namespace" = surimiOrange;
  "attribute" = peachRed;
  "constructor" = springBlue;
  "module" = waveAqua2;
  "special" = peachRed;
  "markup.heading.marker" = fujiGray;
  "markup.heading.1" = { fg = surimiOrange; modifiers = ["bold"]; };
  "markup.heading.2" = { fg = carpYellow; modifiers = ["bold"]; };
  "markup.heading.3" = { fg = waveAqua2; modifiers = ["bold"]; };
  "markup.heading.4" = { fg = springGreen; modifiers = ["bold"]; };
  "markup.heading.5" = { fg = waveRed; modifiers = ["bold"]; };
  "markup.heading.6" = { fg = autumnRed; modifiers = ["bold"]; };
  "markup.list" = oniViolet;
  "markup.bold" = { modifiers = ["bold"]; };
  "markup.italic" = { modifiers = ["italic"]; };
  "markup.link.url" = { fg = springBlue; modifiers = ["underlined"]; };
  "markup.link.text" = crystalBlue;
  "markup.quote" = seaFoam;
  "markup.raw" = seaFoam;
}
