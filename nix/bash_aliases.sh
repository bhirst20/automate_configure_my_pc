# Git
alias gst="git status"
alias gitdebug="git add .; git commit -m 'debugging'; git push"
alias gitfix="git add .; git commit -m 'general fixes'; git push"
alias gitsyntaxfix="git add .; git commit -m 'syntax fixes'; git push"
alias gitrelease="git add .; git commit -m 'Updated release notes'; git push"
alias gitreset="git reset"

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
