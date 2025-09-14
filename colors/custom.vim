" Badbird theme for Neovim 
" Colors extracted from the original badbird VSCode theme
" Author: Improved configuration with better color contrast and text style distribution
" Version: 2.3

set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'badbird'

" ===== COLOR PALETTE =====
" Reorganized palette with better contrast and more distinct colors
let s:colors = {
  \ 'fg':           '#ebdeb2',
  \ 'bg':           '#1a1a1a',
  \ 'bg_light':     '#252525',
  \ 'bg_medium':    '#2a2a2a',
  \ 'bg_accent':    '#3a3a3a',
  \ 'bg_highlight': '#4a4a4a',
  \ 'sage':         '#869183',
  \ 'rust':         '#aa644d',
  \ 'orange':       '#d4a574',
  \ 'yellow':       '#89674a',
  \ 'purple':       '#7a6a71',
  \ 'dark_red':     '#864949',
  \ 'beige':        '#d7cdba',
  \ 'gray':         '#6a6a6a',
  \ 'gray_light':   '#8a8a8a',
  \ 'none':         'NONE'
\ }

" Helper function to set highlights
function! s:hi(group, fg, bg, attr)
  let l:fg = has_key(s:colors, a:fg) ? s:colors[a:fg] : a:fg
  let l:bg = has_key(s:colors, a:bg) ? s:colors[a:bg] : a:bg
  let l:attr = a:attr != '' ? ' gui=' . a:attr : ''
  execute 'highlight ' . a:group . ' guifg=' . l:fg . ' guibg=' . l:bg . l:attr
endfunction

" ===== BASIC HIGHLIGHTS =====
call s:hi('Normal',         'fg',           'bg',           '')
call s:hi('NormalFloat',    'fg',           'bg_light',     'italic')
call s:hi('NormalNC',       'beige',        'bg',           '')
call s:hi('Comment',        'purple',       'none',         'italic')
call s:hi('TSComment',      'purple',       'none',         'italic')
call s:hi('Conceal',        'purple',       'none',         'italic')

" ===== CURSOR =====
call s:hi('Cursor',         'bg',           'fg',           'bold')
call s:hi('lCursor',        'bg',           'fg',           'bold')
call s:hi('CursorIM',       'bg',           'fg',           'bold')
call s:hi('TermCursor',     'bg',           'fg',           '')
call s:hi('TermCursorNC',   'bg',           'purple',       '')
call s:hi('CursorLine',     'none',         'bg_light',     'NONE')
call s:hi('CursorColumn',   'none',         'bg_light',     'NONE')
call s:hi('ColorColumn',    'none',         'bg_light',     'NONE')
call s:hi('CursorLineNr',   'orange',       'none',         'bold')

" ===== CONSTANTS & LITERALS =====
call s:hi('Constant',       'dark_red',     'none',         'bold')
call s:hi('String',         'purple',       'none',         'italic')
call s:hi('Character',      'dark_red',     'none',         'bold')
call s:hi('Number',         'yellow',       'none',         'bold')
call s:hi('Float',          'yellow',       'none',         '')
call s:hi('Boolean',        'dark_red',     'none',         'bold')

" ===== IDENTIFIERS =====
call s:hi('Identifier',     'sage',         'none',         'italic')
call s:hi('Function',       'orange',       'none',         'bold')
call s:hi('Variable',       'fg',           'none',         '')

" ===== STATEMENTS =====
call s:hi('Statement',      'rust',         'none',         'bold')
call s:hi('Keyword',        'rust',         'none',         'bold')
call s:hi('Conditional',    'rust',         'none',         'bold')
call s:hi('Repeat',         'rust',         'none',         'bold')
call s:hi('Label',          'sage',         'none',         'italic')
call s:hi('Exception',      'dark_red',     'none',         'bold')
call s:hi('Operator',       'sage',         'none',         '')

" ===== PREPROCESSOR =====
call s:hi('PreProc',        'sage',         'none',         'italic')
call s:hi('Include',        'sage',         'none',         'bold')
call s:hi('Define',         'sage',         'none',         'bold')
call s:hi('Macro',          'sage',         'none',         'italic')
call s:hi('PreCondit',      'sage',         'none',         'bold')

" ===== TYPES =====
call s:hi('Type',           'sage',         'none',         'bold')
call s:hi('StorageClass',   'rust',         'none',         'bold')
call s:hi('Structure',      'sage',         'none',         'bold')
call s:hi('Typedef',        'sage',         'none',         'bold')

" ===== SPECIAL =====
call s:hi('Special',        'orange',       'none',         'bold')
call s:hi('SpecialChar',    'dark_red',     'none',         'bold')
call s:hi('Tag',            'rust',         'none',         'bold')
call s:hi('Delimiter',      'gray_light',   'none',         'italic')
call s:hi('SpecialComment', 'purple',       'none',         'italic')
call s:hi('Debug',          'dark_red',     'none',         'bold')

" ===== DIFF =====
call s:hi('DiffAdd',        'purple',       '#1a2a1a',      'bold')
call s:hi('DiffChange',     'orange',       '#2a2a1a',      'italic')
call s:hi('DiffDelete',     'dark_red',     '#2a1a1a',      '')
call s:hi('DiffText',       'fg',           '#3a3a1a',      'bold')
call s:hi('diffAdded',      'sage',         'none',         'bold')
call s:hi('diffRemoved',    'dark_red',     'none',         '')
call s:hi('diffChanged',    'orange',       'none',         'italic')
call s:hi('diffFile',       'fg',           'none',         'bold')
call s:hi('diffNewFile',    'purple',       'none',         'bold')
call s:hi('diffLine',       'purple',       'none',         'italic')

" ===== DIRECTORY & FILES =====
call s:hi('Directory',      'sage',         'none',         'bold')

" ===== ERROR HANDLING =====
call s:hi('Error',          'beige',        'dark_red',     'bold')
call s:hi('ErrorMsg',       'dark_red',     'none',         'bold')
call s:hi('WarningMsg',     'orange',       'none',         'bold')
call s:hi('ModeMsg',        'sage',         'none',         'italic')
call s:hi('MoreMsg',        'sage',         'none',         'bold')

" ===== FOLDING =====
call s:hi('Folded',         'purple',       'bg_light',     'italic')
call s:hi('FoldColumn',     'purple',       'bg',           '')

" ===== INDENTATION =====
call s:hi('IndentBlanklineChar',          'bg_accent',    'none',         'NONE')
call s:hi('IndentBlanklineSpaceChar',     'bg_accent',    'none',         'NONE')
call s:hi('IndentBlanklineContextChar',   'bg_highlight', 'none',         '')
call s:hi('IndentBlanklineContextStart',  'none',         'none',         'underline')
execute 'highlight IndentBlanklineContextStart guisp=' . s:colors['bg_highlight']

" ===== LINE NUMBERS =====
call s:hi('LineNr',         'gray',         'none',         'italic')
call s:hi('LineNrAbove',    'gray',         'none',         'italic')
call s:hi('LineNrBelow',    'gray',         'none',         'italic')
call s:hi('SignColumn',     'none',         'none',         'NONE')

" ===== MATCHING =====
call s:hi('MatchParen',     'yellow',       'bg_highlight', 'bold')

" ===== MESSAGES =====
call s:hi('MsgArea',        'fg',           'bg',           'italic')
call s:hi('MsgSeparator',   'purple',       'bg_accent',    '')

" ===== NON-TEXT =====
call s:hi('NonText',        'bg_highlight', 'none',         'italic')
call s:hi('SpecialKey',     'purple',       'none',         'italic')
call s:hi('Whitespace',     'bg_accent',    'none',         'NONE')
call s:hi('EndOfBuffer',    'bg_highlight', 'none',         'italic')

" ===== POPUP MENU =====
call s:hi('Pmenu',          'fg',           'bg_medium',    'italic')
call s:hi('PmenuSbar',      'purple',       'bg',           'NONE')
call s:hi('PmenuSel',       'bg',           'sage',         'bold')
call s:hi('PmenuThumb',     'sage',         'bg_accent',    '')
call s:hi('PmenuKind',      'orange',       'bg_medium',    'italic')
call s:hi('PmenuKindSel',   'bg',           'sage',         'bold')
call s:hi('PmenuExtra',     'purple',       'bg_medium',    'italic')
call s:hi('PmenuExtraSel',  'bg_medium',    'sage',         'bold')

" ===== QUESTIONS =====
call s:hi('Question',       'orange',       'none',         'bold')

" ===== QUICKFIX =====
call s:hi('QuickFixLine',   'none',         'bg_medium',    '')
call s:hi('qfLineNr',       'purple',       'none',         'italic')
call s:hi('qfFileName',     'sage',         'none',         'bold')

" ===== SEARCH =====
call s:hi('Search',         'bg',           'orange',       'bold')
call s:hi('IncSearch',      'bg',           'yellow',       'bold')
call s:hi('CurSearch',      'bg',           'yellow',       'bold')
call s:hi('Substitute',     'bg',           'orange',       'bold')

" ===== SPELL CHECKING =====
call s:hi('SpellBad',       'none',         'none',         'undercurl')
call s:hi('SpellCap',       'none',         'none',         'undercurl')
call s:hi('SpellLocal',     'none',         'none',         'undercurl')
call s:hi('SpellRare',      'none',         'none',         'undercurl')
execute 'highlight SpellBad guisp=' . s:colors['dark_red']
execute 'highlight SpellCap guisp=' . s:colors['orange']
execute 'highlight SpellLocal guisp=' . s:colors['sage']
execute 'highlight SpellRare guisp=' . s:colors['purple']

" ===== STATUS LINE =====
call s:hi('StatusLine',     'fg',           'bg_accent',    'bold')
call s:hi('StatusLineNC',   'purple',       'bg_medium',    'italic')
call s:hi('WildMenu',       'bg',           'sage',         'bold')

" ===== TABS =====
call s:hi('TabLine',        'purple',       'bg_medium',    'italic')
call s:hi('TabLineFill',    'purple',       'bg',           'NONE')
call s:hi('TabLineSel',     'fg',           'bg_accent',    'bold')

" ===== TITLE =====
call s:hi('Title',          'orange',       'none',         'bold')

" ===== TODO =====
call s:hi('Todo',           'yellow',       'bg_accent',    'bold')

" ===== UNDERLINED =====
call s:hi('Underlined',     'sage',         'none',         'underline')

" ===== VERTICAL SPLIT =====
call s:hi('VertSplit',      'bg_highlight', 'none',         'NONE')
call s:hi('WinSeparator',   'bg_highlight', 'none',         'NONE')

" ===== VISUAL SELECTION =====
call s:hi('Visual',         'fg',           'bg_highlight', 'bold')
call s:hi('VisualNOS',      'fg',           'bg_highlight', 'italic')

" ===== WINDOW =====
call s:hi('WinBar',         'fg',           'bg_medium',    'bold')
call s:hi('WinBarNC',       'purple',       'bg_medium',    'italic')

" ===== TREESITTER HIGHLIGHTS =====
" Variables - Better differentiation
call s:hi('@variable',                  'purple',       'none',         'italic')
call s:hi('@variable.builtin',          'sage',         'none',         'bold')
call s:hi('@variable.parameter',        'purple',       'none',         'italic')
call s:hi('@variable.member',           'fg',           'none',         '')
call s:hi('@parameter',                 'purple',       'none',         'italic')
call s:hi('@property',                  'fg',           'none',         '')
call s:hi('@field',                     'fg',           'none',         '')

" Constants - More distinct styles
call s:hi('@constant',                  'dark_red',     'none',         'bold')
call s:hi('@constant.builtin',          'dark_red',     'none',         'bold')
call s:hi('@constant.macro',            'sage',         'none',         'bold')

" Modules
call s:hi('@module',                    'sage',         'none',         'bold')
call s:hi('@namespace',                 'sage',         'none',         '')

" Strings - Different shades for better visibility
call s:hi('@string',                    'purple',       'none',         'italic')
call s:hi('@string.regex',              'sage',         'none',         'italic')
call s:hi('@string.escape',             'dark_red',     'none',         'bold')
call s:hi('@string.special',            'orange',       'none',         '')

" Characters
call s:hi('@character',                 'dark_red',     'none',         'bold')
call s:hi('@character.special',         'orange',       'none',         '')

" Numbers - More visible
call s:hi('@number',                    'yellow',       'none',         'bold')
call s:hi('@number.float',              'yellow',       'none',         '')

" Booleans
call s:hi('@boolean',                   'dark_red',     'none',         'bold')

" Functions - Enhanced visibility
call s:hi('@function',                  'orange',       'none',         'bold')
call s:hi('@function.builtin',          'orange',       'none',         'bold')
call s:hi('@function.call',             'orange',       'none',         '')
call s:hi('@function.macro',            'sage',         'none',         'bold')
call s:hi('@function.method',           'orange',       'none',         '')
call s:hi('@function.method.call',      'orange',       'none',         '')
call s:hi('@constructor',               'sage',         'none',         'bold')

" Operators
call s:hi('@operator',                  'sage',         'none',         '')

" Keywords - More prominent
call s:hi('@keyword',                   'rust',         'none',         'bold')
call s:hi('@keyword.function',          'rust',         'none',         'bold')
call s:hi('@keyword.operator',          'rust',         'none',         'bold')
call s:hi('@keyword.return',            'dark_red',     'none',         'bold')
call s:hi('@keyword.exception',         'dark_red',     'none',         'bold')
call s:hi('@keyword.import',            'sage',         'none',         'bold')
call s:hi('@keyword.storage',           'rust',         'none',         'bold')
call s:hi('@keyword.repeat',            'rust',         'none',         'bold')
call s:hi('@keyword.conditional',       'rust',         'none',         'bold')

" Types - Better distinction
call s:hi('@type',                      'sage',         'none',         'bold')
call s:hi('@type.builtin',              'sage',         'none',         'bold')
call s:hi('@type.definition',           'sage',         'none',         'bold')
call s:hi('@type.qualifier',            'rust',         'none',         '')

" Attributes
call s:hi('@attribute',                 'yellow',       'none',         '')

" Control flow
call s:hi('@conditional',               'rust',         'none',         'bold')
call s:hi('@repeat',                    'rust',         'none',         'bold')
call s:hi('@label',                     'sage',         'none',         'italic')

" Punctuation - Better visibility
call s:hi('@punctuation.delimiter',     'sage',         'none',         '')
call s:hi('@punctuation.bracket',       'sage',         'none',         '')
call s:hi('@punctuation.special',       'sage',         'none',         '')

" Comments
call s:hi('@comment',                   'purple',       'none',         'italic')
call s:hi('@comment.documentation',     'purple',       'none',         'italic')
call s:hi('@comment.error',             'dark_red',     'none',         'italic')
call s:hi('@comment.warning',           'orange',       'none',         'italic')
call s:hi('@comment.todo',              'yellow',       'none',         'italic')
call s:hi('@comment.note',              'sage',         'none',         'italic')

" Tags (HTML/XML)
call s:hi('@tag',                       'rust',         'none',         'bold')
call s:hi('@tag.attribute',             'sage',         'none',         'italic')
call s:hi('@tag.delimiter',             'gray_light',   'none',         '')

" Text/Markup
call s:hi('@text',                      'purple',       'none',         'italic')
call s:hi('@text.strong',               'rust',         'none',         'bold')
call s:hi('@text.emphasis',             'orange',       'none',         'italic')
call s:hi('@text.underline',            'sage',         'none',         'underline')
call s:hi('@text.strike',               'purple',       'none',         '')
call s:hi('@text.title',                'rust',         'none',         'bold')
call s:hi('@text.literal',              'yellow',       'none',         'italic')
call s:hi('@text.uri',                  'sage',         'none',         'underline')
call s:hi('@text.math',                 'orange',       'none',         'italic')
call s:hi('@text.environment',          'sage',         'none',         'bold')
call s:hi('@text.environment.name',     'rust',         'none',         'bold')
call s:hi('@text.reference',            'orange',       'none',         'italic')
call s:hi('@text.todo',                 'yellow',       'none',         'bold')
call s:hi('@text.note',                 'sage',         'none',         'italic')
call s:hi('@text.warning',              'orange',       'none',         'bold')
call s:hi('@text.danger',               'dark_red',     'none',         'bold')

" ===== MARKDOWN SPECIFIC =====
call s:hi('@markup.heading',            'rust',         'none',         'bold')
call s:hi('@markup.heading.1',          'rust',         'none',         'bold')
call s:hi('@markup.heading.2',          'orange',       'none',         'bold')
call s:hi('@markup.heading.3',          'sage',         'none',         'bold')
call s:hi('@markup.heading.4',          'sage',         'none',         'bold')
call s:hi('@markup.heading.5',          'purple',       'none',         'bold')
call s:hi('@markup.heading.6',          'sage',         'none',         'bold')
call s:hi('@markup.strong',             'rust',         'none',         'bold')
call s:hi('@markup.italic',             'orange',       'none',         'italic')
call s:hi('@markup.strikethrough',      'purple',       'none',         '')
call s:hi('@markup.underline',          'sage',         'none',         'underline')
call s:hi('@markup.link.label',         'orange',       'none',         'italic')
call s:hi('@markup.link.url',           'sage',         'none',         'underline')
call s:hi('@markup.raw',                'yellow',       'none',         'italic')
call s:hi('@markup.raw.block',          'yellow',       'bg_light',     'italic')
call s:hi('@markup.list',               'rust',         'none',         'bold')
call s:hi('@markup.list.checked',       'purple',       'none',         'bold')
call s:hi('@markup.list.unchecked',     'purple',       'none',         'italic')
call s:hi('@markup.quote',              'purple',       'none',         'italic')

" ===== LSP DIAGNOSTICS =====
call s:hi('DiagnosticError',            'dark_red',     'none',         'bold')
call s:hi('DiagnosticWarn',             'orange',       'none',         'bold')
call s:hi('DiagnosticInfo',             'sage',         'none',         'italic')
call s:hi('DiagnosticHint',             'purple',       'none',         'italic')
call s:hi('DiagnosticOk',               'purple',       'none',         'bold')

call s:hi('DiagnosticSignError',        'dark_red',     'none',         'bold')
call s:hi('DiagnosticSignWarn',         'orange',       'none',         'bold')
call s:hi('DiagnosticSignInfo',         'sage',         'none',         'italic')
call s:hi('DiagnosticSignHint',         'purple',       'none',         'italic')
call s:hi('DiagnosticSignOk',           'purple',       'none',         'bold')

call s:hi('DiagnosticUnderlineError',   'none',         'none',         'undercurl')
call s:hi('DiagnosticUnderlineWarn',    'none',         'none',         'undercurl')
call s:hi('DiagnosticUnderlineInfo',    'none',         'none',         'undercurl')
call s:hi('DiagnosticUnderlineHint',    'none',         'none',         'undercurl')
call s:hi('DiagnosticUnderlineOk',      'none',         'none',         'undercurl')
execute 'highlight DiagnosticUnderlineError guisp=' . s:colors['dark_red']
execute 'highlight DiagnosticUnderlineWarn guisp=' . s:colors['orange']
execute 'highlight DiagnosticUnderlineInfo guisp=' . s:colors['sage']
execute 'highlight DiagnosticUnderlineHint guisp=' . s:colors['purple']
execute 'highlight DiagnosticUnderlineOk guisp=' . s:colors['purple']

call s:hi('DiagnosticVirtualTextError', 'dark_red',     '#241a1a',      'italic')
call s:hi('DiagnosticVirtualTextWarn',  'orange',       '#242019',      'italic')
call s:hi('DiagnosticVirtualTextInfo',  'sage',         '#1a1e24',      'italic')
call s:hi('DiagnosticVirtualTextHint',  'purple',       '#211a20',      'italic')
call s:hi('DiagnosticVirtualTextOk',    'purple',       '#1a241e',      'italic')

call s:hi('DiagnosticFloatingError',    'dark_red',     'bg_medium',    'bold')
call s:hi('DiagnosticFloatingWarn',     'orange',       'bg_medium',    'bold')
call s:hi('DiagnosticFloatingInfo',     'sage',         'bg_medium',    'italic')
call s:hi('DiagnosticFloatingHint',     'purple',       'bg_medium',    'italic')
call s:hi('DiagnosticFloatingOk',       'purple',       'bg_medium',    'bold')

" ===== LSP SEMANTIC TOKENS =====
call s:hi('@lsp.type.class',            'sage',         'none',         'bold')
call s:hi('@lsp.type.decorator',        'yellow',       'none',         'italic')
call s:hi('@lsp.type.enum',             'sage',         'none',         'bold')
call s:hi('@lsp.type.enumMember',       'yellow',       'none',         '')
call s:hi('@lsp.type.function',         'orange',       'none',         'bold')
call s:hi('@lsp.type.interface',        'sage',         'none',         'bold')
call s:hi('@lsp.type.macro',            'sage',         'none',         'bold')
call s:hi('@lsp.type.method',           'orange',       'none',         '')
call s:hi('@lsp.type.namespace',        'sage',         'none',         '')
call s:hi('@lsp.type.parameter',        'purple',       'none',         'italic')
call s:hi('@lsp.type.property',         'fg',           'none',         '')
call s:hi('@lsp.type.struct',           'fg',           'none',         'bold')
call s:hi('@lsp.type.type',             'fg',           'none',         'bold')
call s:hi('@lsp.type.typeParameter',    'sage',         'none',         'italic')
call s:hi('@lsp.type.variable',         'purple',       'none',         'italic')

" ===== GIT SIGNS =====
call s:hi('GitSignsAdd',                'purple',       'none',         'bold')
call s:hi('GitSignsChange',             'orange',       'none',         'italic')
call s:hi('GitSignsDelete',             'dark_red',     'none',         '')
call s:hi('GitSignsAddNr',              'purple',       'none',         'bold')
call s:hi('GitSignsChangeNr',           'orange',       'none',         'italic')
call s:hi('GitSignsDeleteNr',           'dark_red',     'none',         '')
call s:hi('GitSignsAddLn',              'none',         '#1a2a1a',      'bold')
call s:hi('GitSignsChangeLn',           'none',         '#2a2a1a',      'italic')
call s:hi('GitSignsDeleteLn',           'none',         '#2a1a1a',      '')

" ===== TELESCOPE =====
call s:hi('TelescopeNormal',            'purple',       'bg',           'italic')
call s:hi('TelescopeBorder',            'bg_highlight', 'bg',           'NONE')
call s:hi('TelescopePromptBorder',      'rust',         'bg',           'bold')
call s:hi('TelescopeResultsBorder',     'sage',         'bg',           'italic')
call s:hi('TelescopePreviewBorder',     'orange',       'bg',           'bold')
call s:hi('TelescopePromptTitle',       'rust',         'bg',           'bold')
call s:hi('TelescopeResultsTitle',      'sage',         'bg',           'bold')
call s:hi('TelescopePreviewTitle',      'orange',       'bg',           'bold')
call s:hi('TelescopeSelection',         'purple',       'bg_accent',    'bold')
call s:hi('TelescopeSelectionCaret',    'rust',         'bg_accent',    'bold')
call s:hi('TelescopeMatching',          'yellow',       'none',         'bold')
call s:hi('TelescopePromptPrefix',      'rust',         'none',         'bold')

" ===== NVIM-TREE =====
call s:hi('NvimTreeNormal',             'purple',       'bg',           'italic')
call s:hi('NvimTreeNormalNC',           'purple',       'bg',           'italic')
call s:hi('NvimTreeWinSeparator',       'bg_highlight', 'bg',           'NONE')
call s:hi('NvimTreeFolderName',         'dark_red',     'none',         'bold')
call s:hi('NvimTreeOpenedFolderName',   'sage',         'none',         'bold')
call s:hi('NvimTreeEmptyFolderName',    'purple',       'none',         'italic')
call s:hi('NvimTreeFolderIcon',         'yellow',       'none',         'bold')
call s:hi('NvimTreeFileName',           'purple',       'none',         'italic')
call s:hi('NvimTreeExecFile',           'purple',       'none',         'bold')
call s:hi('NvimTreeSpecialFile',        'orange',       'none',         'bold')
call s:hi('NvimTreeSymlink',            'sage',         'none',         'italic')
call s:hi('NvimTreeImageFile',          'purple',       'none',         'italic')
call s:hi('NvimTreeMarkdownFile',       'purple',       'none',         'italic')
call s:hi('NvimTreeIndentMarker',       'bg_highlight', 'none',         'NONE')
call s:hi('NvimTreeGitDirty',           'orange',       'none',         'italic')
call s:hi('NvimTreeGitStaged',          'purple',       'none',         'bold')
call s:hi('NvimTreeGitMerge',           'dark_red',     'none',         'bold')
call s:hi('NvimTreeGitRenamed',         'orange',       'none',         'italic')
call s:hi('NvimTreeGitNew',             'purple',       'none',         'bold')
call s:hi('NvimTreeGitDeleted',         'dark_red',     'none',         '')
call s:hi('NvimTreeGitIgnored',         'gray',         'none',         'italic')
" Neo-tree
call s:hi('NeoTreeNormal',              'purple',       'bg',           'italic')
call s:hi('NeoTreeNormalNC',            'purple',       'bg',           'italic')
call s:hi('NeoTreeDirectoryName',       'gray',         'none',         'bold')
call s:hi('NeoTreeDirectoryIcon',       'sage',         'none',         'bold')
call s:hi('NeoTreeFileName',            'fg',           'none',         'italic')
call s:hi('NeoTreeFileIcon',            'purple',       'none',         'bold')
call s:hi('NeoTreeModified',            'orange',       'none',         'italic')
call s:hi('NeoTreeGitAdded',            'sage',         'none',         'bold')
call s:hi('NeoTreeGitDeleted',          'rust',         'none',         '')
call s:hi('NeoTreeGitModified',         'orange',       'none',         'italic')
call s:hi('NeoTreeGitConflict',         'beige',        'none',         'bold')
call s:hi('NeoTreeGitUntracked',        'purple',       'none',         'italic')
call s:hi('NeoTreeGitIgnored',          'gray',         'none',         'italic')
call s:hi('NeoTreeGitUnstaged',         'orange',       'none',         'italic')
call s:hi('NeoTreeGitStaged',           'sage',         'none',         'bold')

" ===== TERMINAL COLORS =====
if has('nvim')
  let g:terminal_color_0  = s:colors['bg']
  let g:terminal_color_1  = s:colors['dark_red']
  let g:terminal_color_2  = s:colors['purple']
  let g:terminal_color_3  = s:colors['yellow']
  let g:terminal_color_4  = s:colors['sage']
  let g:terminal_color_5  = s:colors['purple']
  let g:terminal_color_6  = s:colors['sage']
  let g:terminal_color_7  = s:colors['purple']
  let g:terminal_color_8  = s:colors['gray']
  let g:terminal_color_9  = s:colors['rust']
  let g:terminal_color_10 = s:colors['sage']
  let g:terminal_color_11 = s:colors['orange']
  let g:terminal_color_12 = s:colors['sage']
  let g:terminal_color_13 = s:colors['purple']
  let g:terminal_color_14 = s:colors['sage']
  let g:terminal_color_15 = s:colors['beige']
endif

