
# add .exe
format := .exe

# define os
flags += -DWINDOWS

# create bin
bin:
	cmd /C "if not exist $(subst /,\,$(bin_path)) mkdir $(subst /,\,$(bin_path))"
