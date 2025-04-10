-- Custom snippets for my personal website

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local extras = require 'luasnip.extras'
local rep = extras.rep

local get_filename_base = function()
  return vim.fn.expand '%:t:r'
end

ls.add_snippets('markdown', {
  -- Add figure
  s({ trig = 'fig', name = '[Hugo] Figure', desc = 'Insert a figure Hugo shortcode.' }, {
    t { '{{< figure', 'src="/images/' },
    f(get_filename_base, {}),
    t '/',
    i(1, 'URL'),
    t { '#center"', '' },
    t 'title="',
    i(2, 'Title'),
    t { '" ', 'caption="' },
    i(3, 'Caption'),
    t { '" ', 'link="/images/' },
    f(get_filename_base, {}),
    t '/',
    rep(1),
    t { '" ', 'target="_blank"', 'class="align-center" >}}' },
  }),

  -- Add quote with author, title, and link
  s({ trig = 'quo', name = '[Hugo] Quote', desc = 'Insert a blockquote Hugo shortcode.' }, {
    t { '{{< blockquote', 'author="' },
    i(1, 'Author'),
    t { '" ', 'link="' },
    i(2, 'Link'),
    t { '" ', 'title="' },
    i(3, 'Title'),
    t { '" >}}', '' },
    i(0, 'Quote'),
    t { '', '{{< /blockquote >}}' },
  }),

  -- Add Mermaid.js diagrams
  s({ trig = 'dia', name = '[Hugo] Mermaid.js Diagram', desc = 'Insert a Mermaid.js diagram.' }, {
    t { '{{< mermaid >}}', '' },
    i(0, 'Diagram'),
    t { '', '{{< /mermaid >}}' },
  }),

  -- Add raw HTML
  s({ trig = 'htm', name = '[Hugo] HTML', desc = 'Insert a raw HTML snippet.' }, {
    t { '{{< rawhtml >}}', '' },
    i(0, 'HTML'),
    t { '', '{{< /rawhtml >}}' },
  }),

  -- Add a Codapi sandbox
  s({ trig = 'codapi', name = '[Hugo] Codapi Sandbox', desc = 'Insert a Codapi sandbox.' }, {
    t { '{{< codapi', 'sandbox="' },
    i(1, 'python'),
    t { '" ', 'editor="' },
    i(2, 'basic'),
    t { '" >}}' },
  }),
})
