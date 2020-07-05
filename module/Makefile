.PHONY: test check clean build dist

# must set! TODO for subdirectory
ENV_INFO_FOLDER := module
# must set! TODO set INFO_PACKAGE_NAME
ENV_INFO_PACKAGE_NAME := com.sinlov.makefile.module.demo
ENV_INFO_APP_SUFFIX := ""

# When using the subdirectory make independently, the Makefile parameters use the default configuration
ifeq (,$(ENV_TOP_DIR))
ENV_TOP_DIR := $(shell pwd)/..
ENV_CURRENT_DIR := $(shell pwd)
else
ENV_CURRENT_DIR := $(ENV_TOP_DIR)/$(ENV_INFO_FOLDER)
endif

# can chang this to rename binary name
ENV_INFO_APP_NAME := $(ENV_INFO_FOLDER)
ENV_INFO_APP_TAR_NAME := $(ENV_INFO_APP_NAME)-$(ENV_INFO_PACKAGE_NAME)-$(ENV_DIST_VERSION)$(ENV_INFO_APP_SUFFIX).tar.gz

clean$(ENV_INFO_FOLDER):
	@echo "=> $(ENV_INFO_FOLDER) clean start"
	@if [ -d $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_LOG) ]; \
	then echo "$(ENV_LOG_ALIAS_INFO) clean $(ENV_INFO_CLEAN_PATH_ALIAS_LOG) at $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_LOG)" && \
	rm -rf $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_LOG); \
	else echo "$(ENV_LOG_ALIAS_INFO) cleaned path: $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_LOG)";\
	fi
	@if [ -d $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_BUILD) ]; \
	then echo "$(ENV_LOG_ALIAS_INFO) clean $(ENV_INFO_CLEAN_PATH_ALIAS_BUILD) at $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_BUILD)" && \
	rm -rf $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_BUILD); \
	else echo "$(ENV_LOG_ALIAS_INFO) cleaned path: $(ENV_CURRENT_DIR)/$(ENV_INFO_CLEAN_PATH_ALIAS_BUILD)";\
	fi
	@echo "=> $(ENV_INFO_FOLDER) clean end"

$(ENV_INFO_FOLDER)Info:
	$(call print_root_set)
	@echo "=> $(ENV_INFO_FOLDER) Info start"
	@echo " ENV_ROOT_NAME         -> $(ENV_ROOT_NAME)"
	@echo " ENV_TOP_DIR           -> $(ENV_TOP_DIR)"
	@echo " ENV_CURRENT_DIR       -> $(ENV_CURRENT_DIR)"
	@echo " ENV_INFO_FOLDER       -> $(ENV_INFO_FOLDER)"
	@echo " ENV_INFO_PACKAGE_NAME -> $(ENV_INFO_PACKAGE_NAME)"
	@echo " ENV_INFO_APP_NAME     -> $(ENV_INFO_APP_NAME)"
	@echo " ENV_INFO_APP_TAR_NAME -> $(ENV_INFO_APP_TAR_NAME)"
	@echo "=> $(ENV_INFO_FOLDER) Info end"

help$(ENV_INFO_FOLDER): help$(ENV_INFO_FOLDER)Dist
	@echo "=> this is sub project [ $(ENV_INFO_FOLDER) ] help"
	@echo "~> make $(ENV_INFO_FOLDER)Info           -- show $(ENV_INFO_FOLDER) ENV_ info"
	@echo ""