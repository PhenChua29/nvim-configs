local options = {

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

  -- Turn of line wrap
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

  -- Always show the tabs on the top, even if there is just one tab
  showtabline = 2,

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
  
  -- =========== COPYING =========== 
  
  -- Using the register "*" for all yank, delete, change & put operations. Also for using the same register as the mouse's copy/paste function
  clipboard = "unnamed",

  -- =========== FILE FORMAT =========== 

  -- Ensure UTF-8 encoding
  fileencoding = "utf-8", 
  
  -- =========== INTERNAL BEHAVIORS =========== 
  
  -- Allowing undo even after closing the buffer and re-open it 
  undofile = true,

  -- Keep stuff on RAM only
  swapfile = false, 

  -- =========== SEARCHING =========== 
  
  -- Turn off highlight
  hlsearch = false,

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