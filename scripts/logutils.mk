# logutils.mk
# Simple logger for custom C / C++ build system
#
#
# MIT License
#
# Copyright (c) 2026 IgorNk500
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

ifndef NO_LOGGER
log_cmd ?= echo

# $(1) - message
# $(2) - in
# $(3) - out
define log
	@$(log_cmd) " $(1)    $(2) > $(3)"
endef

# $(1) - message
# $(2) - target
define logsolo
	@$(log_cmd) " $(1)    $(2)"
endef

else # NO_LOGGER

# Simple props
define log
endef

define logsolo
endef

endif # NO_LOGGER


# $(1) - in
# $(2) - out
define log_cc # compile c
	$(call log,CC,$(1),$(2))
endef

# $(1) - in
# $(2) - out
define log_cxx # compile c++
	$(call log,CXX,$(1),$(2))
endef

# $(1) - in
# $(2) - out
define log_cs # compile c#
	$(call log,CS,$(1),$(2))
endef

# $(1) - in
# $(2) - out
define log_as # assemble
	$(call log,AS,$(1),$(2))
endef

# $(1) - in
# $(2) - out
define log_ld # link
	$(call log,LD,$(1),$(2))
endef

# $(1) - in
# $(2) - out
define log_gen # generate file (ex. from config)
	$(call log,GEN,$(1),$(2))
endef

# $(1) - target
define log_build # project build
	$(call logsolo,BUILD,$(1))
endef

# $(1) - target
define log_exec # execute program
	$(call logsolo,EXEC,$(1))
endef

# $(1) - in
# $(2) - out
define log_cp # copy
	$(call log,COPY,$(1),$(2))
endef

# $(1) - target
define log_rm # remove
	$(call logsolo,REMOVE,$(1))
endef

# $(1) - in
# $(2) - out
define log_mv # move
	$(call log,MOVE,$(1),$(2))
endef

# $(1) - target
define log_mkdir # mkdir
	$(call logsolo,MKDIR,$(1))
endef

# $(1) - target
define log_rmdir # rmdir
	$(call logsolo,RMDIR,$(1))
endef

##### LOGSOLO VERSION #####

# $(1) - out
define logsolo_cc # compile c
	$(call logsolo,CC,$(1))
endef

# $(1) - out
define logsolo_cxx # compile c++
	$(call logsolo,CXX,$(1))
endef

# $(1) - out
define logsolo_cs # compile c#
	$(call logsolo,CS,$(1))
endef

# $(1) - out
define logsolo_as # assemble
	$(call logsolo,AS,$(1))
endef

# $(1) - out
define logsolo_ld # link or project build
	$(call logsolo,LD,$(1))
endef

# $(1) - out
define logsolo_gen # generate file (ex. from config)
	$(call logsolo,GEN,$(1))
endef