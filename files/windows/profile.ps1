function git_branch {
  Try {
    $branch="$(git rev-parse --abbrev-ref HEAD)"
    if ($branch.Length -gt 0) {
      Write-Host -ForegroundColor yellow -NoNewLine " ("
      Write-Host -ForegroundColor green -NoNewLine "$(git rev-parse --abbrev-ref HEAD)"
      Write-Host -ForegroundColor yellow -NoNewLine ")"
    }
  } Catch {}
}

function generate_prompt {
  $path="$(pwd)"
  $split=$path.Split("\")
  $sector=$split[0]
  $current_dir=$split[$split.Length - 1]
  $long_path=$path.Split(":")[1]

  Write-Host -NoNewLine -ForegroundColor white "[$(Get-Date -Format hh:mm)] "
  Write-Host -NoNewLine "$($sector[0]) "
  Write-Host -NoNewLine -ForegroundColor cyan "~ "
  Write-Host -ForegroundColor gray $long_path
  Write-Host -NoNewLine -ForegroundColor cyan "$current_dir"
  git_branch
  return " "
}

function Prompt() {
  generate_prompt
}
