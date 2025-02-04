local M = {}

-- Tables
-- ======
--

M.gray0 = "#000000"
M.gray5 = "#111111"
M.gray10 = "#1b1b1b"
M.gray15 = "#262626"
M.gray20 = "#303030"
M.gray25 = "#3b3b3b"
M.gray30 = "#474747"
M.gray35 = "#525252"
M.gray40 = "#5e5e5e"
M.gray45 = "#6a6a6a"
M.gray50 = "#777777"
M.gray55 = "#848484"
M.gray60 = "#919191"
M.gray65 = "#9e9e9e"
M.gray70 = "#ababab"
M.gray75 = "#b9b9b9"
M.gray80 = "#c6c6c6"
M.gray85 = "#d4d4d4"
M.gray90 = "#e2e2e2"
M.gray95 = "#f1f1f1"
M.gray100 = "#ffffff"

M.red5 = "#480000"
M.red10 = "#550000"
M.red15 = "#620000"
M.red20 = "#700000"
M.red25 = "#7e000e"
M.red30 = "#8d0b19"
M.red35 = "#9c1f23"
M.red40 = "#ab2f2e"
M.red45 = "#ba3d39"
M.red50 = "#c94b44"
M.red55 = "#d85950"
M.red60 = "#e8665b"
M.red65 = "#f77468"
M.red70 = "#ff8274"
M.red75 = "#ff8f81"
M.red80 = "#ff9d8e"
M.red85 = "#ffab9b"
M.red90 = "#ffb9a8"
M.red95 = "#ffc8b6"

M.orange5 = "#410000"
M.orange10 = "#4c0000"
M.orange15 = "#580000"
M.orange20 = "#650800"
M.orange25 = "#721900"
M.orange30 = "#802600"
M.orange35 = "#8f3302"
M.orange40 = "#9e400f"
M.orange45 = "#ac4c1c"
M.orange50 = "#bb5928"
M.orange55 = "#ca6634"
M.orange60 = "#da7340"
M.orange65 = "#e9804c"
M.orange70 = "#f88d58"
M.orange75 = "#ff9b65"
M.orange80 = "#ffa972"
M.orange85 = "#ffb67f"
M.orange90 = "#ffc48c"
M.orange95 = "#ffd399"

M.yellow5 = "#300600"
M.yellow10 = "#371300"
M.yellow15 = "#401e00"
M.yellow20 = "#4b2900"
M.yellow25 = "#563400"
M.yellow30 = "#623f00"
M.yellow35 = "#6f4b00"
M.yellow40 = "#7d5600"
M.yellow45 = "#8b6200"
M.yellow50 = "#996f00"
M.yellow55 = "#a77b08"
M.yellow60 = "#b6881c"
M.yellow65 = "#c4952b"
M.yellow70 = "#d3a239"
M.yellow75 = "#e2b047"
M.yellow80 = "#f1bd54"
M.yellow85 = "#ffcb61"
M.yellow90 = "#ffd96e"
M.yellow95 = "#ffe77c"

M.rime5 = "#181600"
M.rime10 = "#201f00"
M.rime15 = "#242a00"
M.rime20 = "#2b3500"
M.rime25 = "#344100"
M.rime30 = "#3f4c00"
M.rime35 = "#4b5800"
M.rime40 = "#576400"
M.rime45 = "#647100"
M.rime50 = "#727d00"
M.rime55 = "#7f8a00"
M.rime60 = "#8d9717"
M.rime65 = "#9aa428"
M.rime70 = "#a8b237"
M.rime75 = "#b6bf45"
M.rime80 = "#c4cd52"
M.rime85 = "#d3db60"
M.rime90 = "#e1e96d"
M.rime95 = "#f0f87b"

M.green5 = "#001d00"
M.green10 = "#002500"
M.green15 = "#032f00"
M.green20 = "#033a00"
M.green25 = "#0c4600"
M.green30 = "#195200"
M.green35 = "#275e00"
M.green40 = "#346b00"
M.green45 = "#427800"
M.green50 = "#4f840b"
M.green55 = "#5c921d"
M.green60 = "#699f2c"
M.green65 = "#77ac3a"
M.green70 = "#84ba47"
M.green75 = "#92c854"
M.green80 = "#a0d661"
M.green85 = "#aee46f"
M.green90 = "#bcf27c"
M.green95 = "#caff8a"

M.cyan5 = "#002715"
M.cyan10 = "#002d1f"
M.cyan15 = "#00352a"
M.cyan20 = "#004035"
M.cyan25 = "#004d40"
M.cyan30 = "#005a4b"
M.cyan35 = "#006757"
M.cyan40 = "#007463"
M.cyan45 = "#00816f"
M.cyan50 = "#008f7b"
M.cyan55 = "#009c88"
M.cyan60 = "#00aa95"
M.cyan65 = "#00b8a2"
M.cyan70 = "#00c6b0"
M.cyan75 = "#00d5bd"
M.cyan80 = "#00e3cb"
M.cyan85 = "#00f2d9"
M.cyan90 = "#00ffe7"
M.cyan95 = "#00fff5"

M.sky5 = "#002540"
M.sky10 = "#002b4c"
M.sky15 = "#003558"
M.sky20 = "#004064"
M.sky25 = "#004c70"
M.sky30 = "#00597d"
M.sky35 = "#00658a"
M.sky40 = "#007297"
M.sky45 = "#007fa4"
M.sky50 = "#008db2"
M.sky55 = "#009ac0"
M.sky60 = "#00a8ce"
M.sky65 = "#00b6dc"
M.sky70 = "#00c4ea"
M.sky75 = "#00d2f8"
M.sky80 = "#00e0ff"
M.sky85 = "#00efff"
M.sky90 = "#00fdff"
M.sky95 = "#00ffff"

M.blue5 = "#001564"
M.blue10 = "#001f71"
M.blue15 = "#00297e"
M.blue20 = "#00338b"
M.blue25 = "#003e98"
M.blue30 = "#0049a6"
M.blue35 = "#0054b4"
M.blue40 = "#0060c2"
M.blue45 = "#006cd0"
M.blue50 = "#2279de"
M.blue55 = "#3985ec"
M.blue60 = "#4c92fb"
M.blue65 = "#5d9fff"
M.blue70 = "#6dadff"
M.blue75 = "#7dbaff"
M.blue80 = "#8cc8ff"
M.blue85 = "#9cd6ff"
M.blue90 = "#abe4ff"
M.blue95 = "#baf2ff"

M.purple5 = "#080057"
M.purple10 = "#1a0663"
M.purple15 = "#291270"
M.purple20 = "#371d7d"
M.purple25 = "#44298a"
M.purple30 = "#523497"
M.purple35 = "#5f40a5"
M.purple40 = "#6c4cb3"
M.purple45 = "#7a58c0"
M.purple50 = "#8864ce"
M.purple55 = "#9571dd"
M.purple60 = "#a37eeb"
M.purple65 = "#b18bfa"
M.purple70 = "#bf98ff"
M.purple75 = "#cea6ff"
M.purple80 = "#dcb3ff"
M.purple85 = "#ebc1ff"
M.purple90 = "#f9cfff"
M.purple95 = "#ffddff"

M.pink5 = "#430030"
M.pink10 = "#50003b"
M.pink15 = "#5e0046"
M.pink20 = "#6b0052"
M.pink25 = "#79005e"
M.pink30 = "#87006b"
M.pink35 = "#951877"
M.pink40 = "#a32a84"
M.pink45 = "#b23991"
M.pink50 = "#c0489e"
M.pink55 = "#cf56ac"
M.pink60 = "#dd63b9"
M.pink65 = "#ec71c7"
M.pink70 = "#fb7fd5"
M.pink75 = "#ff8de3"
M.pink80 = "#ff9bf2"
M.pink85 = "#ffa9ff"
M.pink90 = "#ffb7ff"
M.pink95 = "#ffc5ff"

-- Light theme
-- ===========
--

M.light = {}

M.light.black = M.gray20
M.light.red = M.red20
M.light.green = M.green20
M.light.yellow = M.yellow20
M.light.blue = M.blue20
M.light.magenta = M.ping20
M.light.cyan = M.cyan20
M.light.white = M.gray50

M.light.highlight_black = M.gray30
M.light.highlight_red = M.red30
M.light.highlight_green = M.green30
M.light.highlight_yellow = M.yellow30
M.light.highlight_blue = M.blue30
M.light.highlight_magenta = M.ping30
M.light.highlight_cyan = M.cyan30
M.light.highlight_white = M.gray95

M.light.emphasis_red = M.red25
M.light.emphasis_orange = M.orange25
M.light.emphasis_blue = M.blue25
M.light.emphasis_green = M.green25
M.light.emphasis_yellow = M.yellow25
M.light.emphasis_cyan = M.cyan25
M.light.emphasis_white = M.gray55

M.light.dim_black = M.gray10
M.light.dim_blue = M.blue10
M.light.dim_white = M.gray40

M.light.foreground = M.light.black
M.light.background = M.light.highlight_white

M.light.highlight_background = M.light.highlight_white

M.light.emphasis_foreground = M.light.highlight_black
M.light.emphasis_background = M.gray80

M.light.dim_foreground = M.light.dim_white

-- Dark theme
-- ==========
--

M.dark = {}

M.dark.black = M.gray5
M.dark.red = M.red65
M.dark.green = M.green85
M.dark.yellow = M.yellow85
M.dark.blue = M.blue85
M.dark.magenta = M.ping85
M.dark.cyan = M.cyan85
M.dark.white = M.gray95

M.dark.highlight_black = M.gray65
M.dark.highlight_red = M.red75
M.dark.highlight_green = M.green90
M.dark.highlight_yellow = M.yellow90
M.dark.highlight_blue = M.blue90
M.dark.highlight_magenta = M.ping90
M.dark.highlight_cyan = M.cyan95
M.dark.highlight_white = M.gray100

M.dark.emphasis_black = M.gray30
M.dark.emphasis_red = M.red80
M.dark.emphasis_orange = M.orange80
M.dark.emphasis_blue = M.blue80
M.dark.emphasis_green = M.green85
M.dark.emphasis_yellow = M.yellow85
M.dark.emphasis_cyan = M.cyan80
M.dark.emphasis_white = M.gray90

M.dark.dim_black = M.gray30
M.dark.dim_blue = M.blue50
M.dark.dim_white = M.gray50

M.dark.foreground = M.dark.highlight_white
M.dark.background = M.dark.black

M.dark.highlight_background = M.dark.highlight_black

M.dark.emphasis_foreground = M.dark.emphasis_white
M.dark.emphasis_background = M.dark.emphasis_black

M.dark.dim_foreground = M.dark.dim_white

return M
