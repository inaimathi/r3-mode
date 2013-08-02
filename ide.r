REBOL [
	Title: "Rebol IDE Toolkit"
	Date: 29-July-2013
	File: %ide.r
	Author: "Inaimathi"
	Email: leo.zovic@gmail.com
	License: http://www.gnu.org/licenses/gpl-3.0.html
]

ide: context [
	args: funct [word [any-type!]] [
		either error? res: try [
			argl: copy []
			refl: copy []
			ref: b: v: none
			parse (find spec-of get word any-word!) [
				any [string! | block!]
				any [
					set wd [refinement! (ref: true) | any-word!]
					(append/only either ref [refl] [argl] b: reduce [ wd ])
					any [set v block! | set v string! (b/2: v)]
				]
			]
			prin word
			prin " "
			print argl
			reduce [ word argl ] ]
		[ none ] [ res ]
	]
	arg-hint: funct [ block [block!] ] [
		foreach w block [
			prin mold w
			prin " :: "
			if res: args w 
			[ print mold res ]
			[ print " " ]
		] 
	]
	completions-in: funct ['word [any-type!]] [
		wd: get :word
		case [
			object? wd [ collect [ foreach [word val] wd [ keep word ]]]
		]
	]
	search-lib: funct [ type ] [
		ty: form type
		foreach [ word val ] lib [
			if ty = form type?/word :val [
				print word
			]
		]
	]
	symbol-group: funct [ label types ] [
		prin "R3IDE-NEW-KEYWORDS: "
		print label
		foreach t types [
			search-lib t
		] test
		none
	]
	types: funct [] [ symbol-group "types" [ datatype! typeset! ] ]	
	keywords: funct [] [ symbol-group "keywords" [ action! native! op!]]
	functions: funct [] [ symbol-group "functions" [ function! ] ]
	show-help: funct [ 'word ] [
		prin "R3IDE-HELP: "
		print word
		help :word
	]
	show-source: funct [ 'word ] [
		print "R3IDE-SOURCE"
		source :word
	]
	load: funct [ str ] [ 
		;; FAILED on failure
		;; SUCCESS + list of new bindings on success
		if error? try [ do to-file str ] [ print "FAILED LOAD"]
		;; do symbol pulling here
	] 
	;; autocomplete-dict -- generates a rebol-mode dict for auto-complete mode
]