#!/bin/sh

mkdir -p /vscode-extensions-cache/stable /vscode-extensions-cache/insiders
chown -R "$_REMOTE_USER:$_REMOTE_USER" /vscode-extensions-cache

mkdir -p "$_REMOTE_USER_HOME/.vscode-server" "$_REMOTE_USER_HOME/.vscode-server-insiders"
chown "$_REMOTE_USER:$_REMOTE_USER" "$_REMOTE_USER_HOME/.vscode-server" "$_REMOTE_USER_HOME/.vscode-server-insiders"

ln -s -T /vscode-extensions-cache/stable "$_REMOTE_USER_HOME/.vscode-server/extensions"
ln -s -T /vscode-extensions-cache/insiders "$_REMOTE_USER_HOME/.vscode-server-insiders/extensions"
chown -h "$_REMOTE_USER:$_REMOTE_USER" "$_REMOTE_USER_HOME/.vscode-server/extensions" "$_REMOTE_USER_HOME/.vscode-server-insiders/extensions"