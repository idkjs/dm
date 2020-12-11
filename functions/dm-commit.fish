function dm-commit --wraps='git commit -m (hostname).(date +%Y-%m-%d)' --description 'alias dm-commit=dm commit -m (hostname).(date +%Y-%m-%d)'
  set -l prefix (hostname).(date +%Y-%m-%d)
  dm commit -m "$prefix: $argv";
end
