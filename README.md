# Shellgame

## Table of Contents
* [Installation](#installation)
* [Limitations](#limitations)
* [Usage](#usage)
* [Submissions](#submissions)

## Installation
Clone the shellgame repo:
   - `git clone https://github.com/petehwu/shellgame.gitt` (HTTPS)
   - `git clone git@github.com:petehwu/shellgame.git` (SSH)

## Limitations and caveats
1.  you should issue the git clone command from your home directory, otherwise the code will not work correctly.  
2. The comparison is done by issuing a command to the sh shell and capturing the output in a file, then issuing the same command to your shell and capturing the output, then performing a diff on the 2 files to check for differences.  This means that your prompt character has to be the same as the prompt for sh('$' by default) othewise diff will show that as a difference.  
3. I added a sort step before diff to sort the output files because I noticed some differences in display order.  Not sure if this is right or not.

##Usage
1. Change your directory to shell game `cd shellgame`
2. Start the test suite: `./init.sh [github username of simple_shell repo]`
3. The test will dispaly Pass/Fail twice, the first one is checking for expected output(stdout), the second pass/fail is for checking expected error(stderr)

## Submissions
Before adding test cases, follow this procedure so that the master branch doesn't get corrupted:
1. Check which branch you're currently on (`git branch`). An asterisk/star (`*`) will indicate which branch you're on.
2. If you're on a branch other than master, checkout to master (`git checkout master`).
3. Pull the most updated verison of master before adding your test cases (`git pull origin master`).
4. Checkout a branch for the case(s) you want to add (`git checkout -b [test-case]`).
5. Add your test case(s) to the directory related to the specific task.
6. Add and commit your change(s).
7. Push that branch, not to master (`git push origin [test-case]`).
8. Open a pull request on Github.
9. Slack the sf-0517 channel with the link to the pull request and have someone merge to master for you.
10. Delete the branch you committed and pushed after merging to master.

## Credits
Thanks to everyone who contributed! The contributors are listed in the [AUTHORS](https://github.com/srinitude/shellgame/blob/master/AUTHORS) page.
