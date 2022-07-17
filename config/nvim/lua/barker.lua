local action_state = require('telescope.actions.state') -- file lua/telescope/actions/state.lua
require('telescope').setup {
  defaults = {
    prompt_prefix = "> ", 
    mappings = {
      i = {
        ["<c-a>"] = function() print(vim.inspect(action_state.get_selected_entry())) end
      }
      }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')

local mappings = {

}
mappings.curr_buff = function() 
  require('telescope.builtin').current_buffer_fuzzy_find(
    {sorting_strategy='ascending'})
end
return mappings
