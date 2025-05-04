oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\spaceship.omp.json" | Invoke-Expression
Set-Alias njs "node index.js"
Set-Alias nrd "npm run dev"
Set-Alias y "yarn"
Set-Alias yd "yarn dev"
function project {
  cd "d:\Project"
}