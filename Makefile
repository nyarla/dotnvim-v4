all:
	@echo hi,

confirm:
	test -d /tmp/nvim/.config || mkdir -p /tmp/nvim/.config
	test -d /tmp/nvim/.local/share || mkdir -p /tmp/nvim/.local/share
	test -e /tmp/nvim/.config/nvim || ln -sf $(shell pwd) /tmp/nvim/.config/nvim
	env \
		XDG_CONFIG_HOME=/tmp/nvim/.config \
		XDG_DATA_HOME=/tmp/nvim/.local/share \
		nvim-run
