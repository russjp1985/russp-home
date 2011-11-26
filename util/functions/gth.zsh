# Opens the git repository in the pwd in the browser
# Works for Github and GithubFI, not sure about anything else
function gth() {
    open `git remote -v | grep origin | head -n1 | awk '{print $2}' | sed 's/:/\//' | sed 's/git@/http:\/\//g' | sed 's/\.git//g'`
}
