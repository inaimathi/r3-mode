# r3-mode
###### REBOL3 editing mode for Emacs v 0.001

*This is a very preliminary release, put up only because it has slightly better highlighting than rebol.el when it comes to r3 code, and a couple of small useful features. There certainly errors, and under-construction features. Use at your own risk, and please be very aggressive about reporting any bugs.*

### Installation

- clone this repository
- add it to your load path `(add-to-list 'load-path "/path/to/this/repo")`
- add `(require 'r3-mode)` to your `~/.emacs` file
- run `M-x customize-group r3` and change the variable `r3-rebol-command` to point at your `r3` interpreter
- *optionally* add `(add-to-list 'auto-mode-alist '("\\.r$" . r3-mode))` to your `~/.emacs` file to associate `.r` files withi this mode
- when editing REBOL3 code, run `r3-mode`

### Features

- `C-c C-h` or `C-c h`: display `help` on the word at point in a separate buffer
- `C-c C-s` or `C-c s`: display the source code for the word at point in a separate buffer
- `run-r3`: starts up an `r3` prompt as a comint buffer
- `C-c C-c`: evaluates the highlighted region into the running `r3` prompt

### Features under construction

- **Argument Hints** Currently dummied out; the mode will eventually offer argument hints in the minibuffer as you type.
- **Auto-editable `r3-source`**. When viewing source, editing and saving the source buffer will automatically evaluate the new code against the running `r3` interpreter
- **Jump-To-Definition** Self explanatory, I hope.
- **Highlighted REPL** Special highlighting modes for the in-Emacs REPL
- **Fancy Docs** Special highligting for the `*r3-help*` buffer, and in-buffer links to other help entries

### License

This mode is released under the GNU GPL3. License can be found in the `COPYING` file, or [here](http://www.gnu.org/licenses/gpl-3.0.html)
