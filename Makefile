.PHONY: test check clean build dist all

# for subdirectory parameters
ENV_TOP_DIR := $(shell pwd)

# set proejct main subdirectory TODO replace module
ENV_MAIN_MOUDLE_DIR := module

# must set! TODO set DIST_VERSION DIST_OS
ENV_DIST_VERSION := v1.0.0
ENV_DIST_OS := linux
ENV_DIST_ARCH := amd64

ENV_DIST_OS_DOCKER ?= linux
ENV_DIST_ARCH_DOCKER ?= amd64

# need open debug 1 is need 0 is default
ENV_NEED_DEBUG=1
# need open proxy 1 is need 0 is default
ENV_NEED_PROXY=1
# prototype: make_command(program, flags, msg, input)
define print_root_set
@if [ $(ENV_NEED_DEBUG) -eq 1 ]; \
	then echo " now open debug, ENV_NEED_DEBUG=1"; \
	else echo " now close debug, ENV_NEED_DEBUG="; \
fi
@if [ $(ENV_NEED_PROXY) -eq 1 ]; \
	then echo " now open proxy, ENV_NEED_PROXY=1"; \
	else echo " now close proxy, ENV_NEED_PROXY="; \
fi
endef

define print_function_when_debug
@if [ $(ENV_NEED_DEBUG) -eq 1 ]; \
	then echo " $(ENV_LOG_ALIAS_DEBUG) run task name -> $@ \n\
	$(ENV_LOG_ALIAS_DEBUG) program 0 -> $(0) \n\
	$(ENV_LOG_ALIAS_DEBUG) program 1 -> $(1) \n\
	$(ENV_LOG_ALIAS_DEBUG) program 2 -> $(2) \n\
	$(ENV_LOG_ALIAS_DEBUG) program 3 -> $(3) \n\
	$(ENV_LOG_ALIAS_DEBUG) program 4 -> $(4) \n\
	\n\
	"; \
fi
endef

ENV_LOG_ALIAS_INFO ?= INFO:
ENV_LOG_ALIAS_DEBUG ?= DEBUG:
ENV_LOG_ALIAS_WARN ?= WARN:

ENV_INFO_CLEAN_PATH_ALIAS_LOG := log
ENV_INFO_CLEAN_PATH_ALIAS_BUILD := build

# set include TODO replace module
include module/Makefile
include module/Dist.mk

init:
	@echo "-> just check env or init project folder or file"
	@echo ""

clean: clean$(ENV_MAIN_MOUDLE_DIR)
	@echo "-> just clean project folder or file"
	@echo ""

dev:
	@echo "-> just run dev when init success"
	@echo ""

helpRoot:
	@echo "=> this is root project help"
	@echo "~> make init  -- check env or init project folder of file"
	@echo "~> make dev   -- run dev when init success"
	@echo "~> make clean -- clean folder or file"
	@echo ""

help: help$(ENV_MAIN_MOUDLE_DIR) helpRoot
	@echo "    ... more info see makefile script ..."