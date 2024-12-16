local options = {
  -- =========== NAVIGATION =========== 
  
  -- Enable smart indentation so that the new line is automatically indented, not just 
  -- copied indentation from the previous line
  smartindent = true,

  -- =========== LINTING =========== 
  
  -- Change auto indent space length
  shiftwidth = 2,

  -- Use space instead of tab character
  expandtab = true,

  -- Change number of space that a tab character shows (for displaying files with tabs obviously)
  tabstop = 2,  
 
  -- =========== APPEARANCE =========== 
  
  -- Ensure that there are always n lines above/below the cursor when scrolling up/down 
  scrolloff = 6,

  -- Ensure that there are always n chracters to the left/right of the cursor when scrolling left/right
  sidescrolloff = 10,

  -- Turn off line wrap
  wrap = false,
  
  -- Hightlight current cursor position with a line
  cursorline = true,
  
  -- Always show the sign column so that text doesn't move when the sign column appears
  signcolumn = "yes",

  -- Enable true color for better colorscheme support 
  termguicolors = true,

  -- Line number
  number = true,

  -- I don't have to calculate the number of line I need to jump anymore 🙂
  relativenumber = true,

  -- Hide the tab line that shows file path on the top left  
  showtabline = 0,

  -- Making the suggestion menu in command mode a little taller
  pumheight = 20,
  
  -- Turn off the mode text. E.g. -- INSERT --
  showmode = false,

  -- New window position will always be below on the current one when doing :split
  splitbelow = true,

  -- New window position will always be on the right of the current buffer when doing :vsplit
  splitright = true,

  -- Make the :split window's content stay at one place when I move the border between them using cursor
  splitkeep = "screen",

  -- Enable custom Obsidian ui
  conceallevel = 1, 
  
  -- Makes splits windows have a nice divider 
  laststatus = 3,

  -- Hide cmd at the bottom unless it is used
  cmdheight = 0,
   
  -- =========== COPYING =========== 

  -- Use the same clipboard as system clipboard
  clipboard = "unnamedplus",

  -- =========== FILE FORMAT =========== 

  -- Ensure UTF-8 encoding
  fileencoding = "utf-8", 
  
  -- =========== INTERNAL BEHAVIORS =========== 
  
  -- Allowing undo even after closing the buffer and re-open it 
  undofile = true,

  -- Keep stuff on RAM only
  swapfile = false, 

  -- =========== SEARCHING =========== 
  
  -- Turn on highlight
  hlsearch = true,

  -- For comfortably searching without needing to touch the Shift key
  ignorecase = true,

  -- Turn on case-sensitive search when I type upper case characters
  smartcase = true,

  
  -- =========== WISHLIST =========== 
  -- Auto save
}

-- Enabling the configs
for k, v in pairs(options) do
  vim.opt[k] = v
end
 
-- =========== NETRW =========== 
local netrw_options = {
  -- Let netrw always refresh directory listing so that the keybind <C-l> won't be needed anymore
  netrw_fastbrowse = 0,

  -- Remove netrw banner at the top
  netrw_banner = 0, 
}

for k, v in pairs(netrw_options) do
	vim.g[k] = v
end
