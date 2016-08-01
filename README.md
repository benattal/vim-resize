vim-resize
==========

*Are you a vim user? Don't know what to use the arrow keys for?*
* **Download this plugin for smart window resizing using the arrow keys!**

## Usage
* use the arrow keys in normal mode to resize a vertical or horizontal split in the desired direction

## Configuration

### Mappings

By default, this plugin uses these mappings:

    nnoremap <silent> <c-left> :CmdResizeLeft<cr>
    nnoremap <silent> <c-down> :CmdResizeDown<cr>
    nnoremap <silent> <c-up> :CmdResizeUp<cr>
    nnoremap <silent> <c-right> :CmdResizeRight<cr>

If you want to set your own mappings, copy this line into your vimrc:

    let g:vim_resize_disable_auto_mappings = 1

and use the format above to customize them to your liking.
