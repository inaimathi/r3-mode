# r3-mode
###### REBOL3 editing mode for Emacs v 0.003

*This is a very preliminary release, put up only because it has slightly better highlighting than rebol.el when it comes to r3 code, and a couple of small useful features. There certainly errors, and under-construction features. Use at your own risk, and please be very aggressive about reporting any bugs.*

### New Stuff

- Help mode is now minimally highlighted and supports the help and source keys (`C-c C-h`/`C-c h` for help, `C-c C-s`/`C-c s` for source). I won't be doing buttoning because it was producing stupid results (such as buttonifying the word `if` regardless of context)
- the r3 REPL is now highlighted in the same manner as r3 code buffers
- `r3-help` now correctly selects words like `object?` and `map!` (it previously dropped punctuation)

### Installation

- clone this repository
- add the following to your `~/.emacs` file:


    (add-to-list 'load-path "/path/to/this/repo")
    (autoload 'r3-mode "r3-mode.el" "Major mode for REBOL3 development" t)
    (add-to-list 'auto-mode-alist '("\\.r$" . r3-mode)) ;; *.r files will be opened in r3-mode


- run `M-x customize-group r3` and change the variable `r3-rebol-command` to point at your `r3` interpreter

### Features

- `C-c C-h` or `C-c h`: display `help` on the word at point in a separate buffer
- `C-c C-s` or `C-c s`: display the source code for the word at point in a separate buffer
- `run-r3`: starts up an `r3` prompt as a comint buffer
- `C-c C-c`: evaluates the highlighted region into the running `r3` prompt

### Features under construction

- **Argument Hints** Currently dummied out; the mode will eventually offer argument hints in the minibuffer as you type.
- **Auto-editable `r3-source`**. When viewing source, editing and saving the source buffer will automatically evaluate the new code against the running `r3` interpreter
- **Jump-To-Definition** Self explanatory, I hope.

### License

This mode is released under the GNU GPL3. License can be found in the `COPYING` file, or [here](http://www.gnu.org/licenses/gpl-3.0.html)
