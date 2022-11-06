#!/bin/bash

# workspace
echo -e "\n$hr\nVIRTUAL ENV\n$hr"
echo ${VIRTUAL_ENV}
ls -al ${VIRTUAL_ENV}

# workspace
echo -e "\n$hr\nWORKING DIRECTORY\n$hr"
echo ${WORKING_DIR}
ls -al ${WORKING_DIR}

if [["${WORKING_DIR}" != "${JEKYLL_SRC}"]];then
  # jekyll source
  echo -e "\n$hr\nJEKYLL DIRECTORY\n$hr"
  cd ${JEKYLL_SRC} && pwd
  chown -R $(whoami) .git/config
  git config --unset http.https://github.com/.extraheader
  git config --unset-all http.https://github.com/.extraheader
  git config --global --unset http.https://github.com/.extraheader
  git config --system --unset http.https://github.com/.extraheader
  ls -al .
fi

# pinned repos
# https://dev.to/thomasaudo/get-started-with-github-grapql-api--1g8b
echo -e "\n$hr\nPINNED  REPOSITORIES\n$hr"
AUTH="Authorization: bearer $JEKYLL_GITHUB_TOKEN"
curl -L -X POST "${GITHUB_GRAPHQL_URL}" -H "$AUTH" \
--data-raw '{"query":"{\n  user(login: \"'${GITHUB_REPOSITORY_OWNER}'\") {\n pinnedItems(first: 6, types: REPOSITORY) {\n nodes {\n ... on Repository {\n name\n }\n }\n }\n }\n}"'

# makefile
echo -e "\n$hr\nMAKEFILE\n$hr"
cat ${WORKING_DIR}/Makefile

# config file
echo -e "\n$hr\nJEKYLL CONFIG FILE\n$hr"
cat ${JEKYLL_CFG}

# Directory Setting
# remote_theme: eQ19/parser
# https://jekyllrb.com/docs/configuration/default/
# https://jekyllrb.com/docs/continuous-integration/github-actions/
# https://docs.github.com/en/actions/security-guides/encrypted-secrets
