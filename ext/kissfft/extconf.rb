require 'mkmf'

if(have_library("m"))
	create_makefile("kissfft/kissfft")
end
