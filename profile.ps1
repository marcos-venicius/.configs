
function git_branch {
  Try {
    $branch="$(git rev-parse --abbrev-ref HEAD)"
    if ($branch.Length -gt 0) {
      Write-Host -ForegroundColor white -NoNewLine " at "
      Write-Host -ForegroundColor green -NoNewLine "$(git rev-parse --abbrev-ref HEAD) "
    }
  } Catch {}
}

function generate_prompt {
  $path="$(pwd)"
  $split=$path.Split("\")
  $sector=$split[0]
  $current_dir=$split[$split.Length - 1]
  $long_path=$path.Split(":")[1]

  Write-Host -NoNewLine "$($sector[0]) "
  Write-Host -NoNewLine -ForegroundColor cyan "~ "
  Write-Host -NoNewLine -ForegroundColor gray $long_path
  git_branch
  Write-Host -NoNewLine -ForegroundColor cyan "`n$current_dir"
  Write-Host -NoNewLine -ForegroundColor white " [$(Get-Date -Format hh:mm)] "
  return " - "
}

function Prompt() {
  generate_prompt
}

