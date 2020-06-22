.PHONY: test check clean build dist

ENV_INFO_DIST_APP_PATH := $(ENV_CURRENT_DIR)/dist/$(ENV_INFO_FOLDER)
ENV_INFO_DIST_PATH_ALIAS_DEV := dev
ENV_INFO_DIST_PATH_ALIAS_TEST := test
ENV_INFO_DIST_PATH_ALIAS_PROD := prod

# prototype: make_command(program, flags, msg, input)
define parse_dist_path
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
@if [ -z $(2) ]; \
then echo "$(ENV_LOG_ALIAS_WARN) task $@ , will mkdir default folder" && \
	echo $(2); \
else echo $(1)/$(2)/$(ENV_DIST_VERSION); \
fi
endef

define clean_dist_path
@if [ $(ENV_NEED_DEBUG) -eq 1 ]; \
	then echo " $(ENV_LOG_ALIAS_DEBUG) run task name -> $@ \n\
	$(ENV_LOG_ALIAS_DEBUG) program 0 -> $(0) \n\
	$(ENV_LOG_ALIAS_DEBUG) program 1 -> $(1) \n\
	$(ENV_LOG_ALIAS_DEBUG) program 2 -> $(2) \n\
	\n\
	"; \
fi
@if [ -z $(2) ]; \
then echo "$(ENV_LOG_ALIAS_WARN) task $@ , will clean full dist folder" && \
	if [ -d $(1) ]; \
	then echo "$(ENV_LOG_ALIAS_INFO) clean at path: $(1)" && rm -rf $(1); \
	else echo "$(ENV_LOG_ALIAS_WARN) clean empty folder: $(1)"; \
	fi \
else \
	echo "will clean folder by env [ $(2) ], path: $(1)/$(2)/$(ENV_DIST_VERSION)" && \
	if [ -d $(1)/$(2)/$(ENV_DIST_VERSION) ]; \
	then echo "$(ENV_LOG_ALIAS_INFO) clean at path: $(1)/$(2)/$(ENV_DIST_VERSION)" && rm -rf $(1)/$(2)/$(ENV_DIST_VERSION); \
	else echo "$(ENV_LOG_ALIAS_WARN) clean empty folder: $(1)/$(2)/$(ENV_DIST_VERSION)"; \
	fi \
fi
endef

# prototype: make_command(program, flags, msg, input)
define check_dist_path
@if [ $(ENV_NEED_DEBUG) -eq 1 ]; \
then echo " $(ENV_LOG_ALIAS_DEBUG) run task name -> $@ \n\
$(ENV_LOG_ALIAS_DEBUG) program 0 -> $(0) \n\
$(ENV_LOG_ALIAS_DEBUG) program 1 -> $(1) \n\
$(ENV_LOG_ALIAS_DEBUG) program 2 -> $(2) \n\
$(ENV_LOG_ALIAS_DEBUG) program 3 -> $(3) \n\
$(ENV_LOG_ALIAS_DEBUG) program 4 -> $(4) \n\
\n\
can use as blow \n\
$#$(foreach n, $3, $n) \n\
$# @$(1) -o $@ $(3) $(2)  \n\
"; \
fi
@if [ -z $(2) ]; \
then echo "$(ENV_LOG_ALIAS_WARN) task $@ , will mkdir default folder" && \
	if [ -d $(1) ]; \
	then echo "$(ENV_LOG_ALIAS_INFO) check pass at path: $(1)"; \
	else echo "$(ENV_LOG_ALIAS_INFO) just mkdir at $(1)" && mkdir -p $(1); \
	fi \
else \
	echo "will mkdir folder by env [ $(2) ], path: $(1)/$(2)/$(ENV_DIST_VERSION)" && \
	if [ -d $(1)/$(2)/$(ENV_DIST_VERSION) ]; \
	then echo "$(ENV_LOG_ALIAS_INFO) check pass at path: $(1)/$(2)/$(ENV_DIST_VERSION)"; \
	else echo "$(ENV_LOG_ALIAS_INFO) just mkdir at $(1)/$(2)/$(ENV_DIST_VERSION)" && mkdir -p $(1)/$(2)/$(ENV_DIST_VERSION); \
	fi \
fi
endef

$(ENV_INFO_FOLDER)DistCleanAll:
	$(call clean_dist_path,$(ENV_INFO_DIST_APP_PATH))

$(ENV_INFO_FOLDER)DistCleanDev:
	$(call clean_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_DEV))

$(ENV_INFO_FOLDER)DistCleanTest:
	$(call clean_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_TEST))

$(ENV_INFO_FOLDER)DistCleanProd:
	$(call clean_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_PROD))

$(ENV_INFO_FOLDER)DistCheckPath:
	$(call check_dist_path,$(ENV_INFO_DIST_APP_PATH),"",'base' $@,$^)

$(ENV_INFO_FOLDER)DistCheckPathDev:
	$(call parse_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_DEV))
	$(call check_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_DEV))

$(ENV_INFO_FOLDER)DistCheckPathTest:
	$(call parse_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_TEST))
	$(call check_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_TEST))

$(ENV_INFO_FOLDER)DistCheckPathProd:
	$(call parse_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_PROD))
	$(call check_dist_path,$(ENV_INFO_DIST_APP_PATH),$(ENV_INFO_DIST_PATH_ALIAS_PROD))

$(ENV_INFO_FOLDER)DistInfo:
	$(call print_root_set)
	@echo "=> $(ENV_INFO_FOLDER) dist info start"
	@echo " ENV_TOP_DIR             -> $(ENV_TOP_DIR)"
	@echo " ENV_CURRENT_DIR         -> $(ENV_CURRENT_DIR)"
	@echo " ENV_INFO_FOLDER         -> $(ENV_INFO_FOLDER)"
	@echo " ENV_INFO_PACKAGE_NAME   -> $(ENV_INFO_PACKAGE_NAME)"
	@echo " ENV_INFO_APP_NAME       -> $(ENV_INFO_APP_NAME)"
	@echo " ENV_INFO_APP_TAR_NAME   -> $(ENV_INFO_APP_TAR_NAME)"
	@echo " ENV_INFO_DIST_APP_PATH  -> $(ENV_INFO_DIST_APP_PATH)"
	@echo " ENV_INFO_DIST_PATH_ALIAS_DEV  -> $(ENV_INFO_DIST_PATH_ALIAS_DEV)"
	@echo " ENV_INFO_DIST_PATH_ALIAS_TEST -> $(ENV_INFO_DIST_PATH_ALIAS_TEST)"
	@echo " ENV_INFO_DIST_PATH_ALIAS_PROD -> $(ENV_INFO_DIST_PATH_ALIAS_PROD)"
	@echo "=> $(ENV_INFO_FOLDER) dist info end"

help$(ENV_INFO_FOLDER)Dist:
	@echo "=> this is sub project [ $(ENV_INFO_FOLDER) ] dist help"
	@echo "~> make $(ENV_INFO_FOLDER)DistInfo         -- show $(ENV_INFO_FOLDER) dist ENV_ info"
	@echo "~> make $(ENV_INFO_FOLDER)DistCheckPath    -- check $(ENV_INFO_FOLDER) dist path"
	@echo "~> make $(ENV_INFO_FOLDER)DistCleanAll     -- clean $(ENV_INFO_FOLDER) dist path"
	@echo ""