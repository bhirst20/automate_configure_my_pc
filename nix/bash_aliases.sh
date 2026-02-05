# Git
alias gst="git status"
alias gitreset="git reset"
alias gitrelease="git add .; git commit -m 'Updated release notes'; git push"

# AI-powered quick commits (uses Fabric/Ollama by default, add --claude for Claude)
# Requires: gitquick script in PATH
alias gitdebug="gitquick debug"
alias gitfix="gitquick fix"
alias gitsyntaxfix="gitquick syntax"

# Terraform
alias tfclean="rm -rf .terraform*; tfinit"
alias tfinit="terraform init; terraform plan"
alias tfplan="if [ ! -d .terraform ]; then terraform init; fi; terraform plan"
alias tfapply="if [ ! -d .terraform ]; then terraform init; fi; terraform apply;"
alias tfdestroy="terraform destory"

# General
alias myip='curl ipinfo.io/ip'
alias ll="ls -la"
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}
