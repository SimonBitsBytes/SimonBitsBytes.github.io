commit_random_dates() {
  for Y in {2023..2024}
  do
    for M in $(shuf -i 1-12 -n 1)
    do
      for D in $(shuf -i 1-31 -n 1)
      do
        num_commits=$(shuf -i 1-5 -n 1)
        for ((i=1; i<=$num_commits; i+=2))
        do
          git_commit_date="$Y-$(printf "%02d" $M)-$(printf "%02d" $D) 12:$(printf "%02d" $i):00"
          echo "Modified $i on $M/$D/$Y" > commit.md
          export GIT_COMMITTER_DATE="$git_commit_date"
          export GIT_AUTHOR_DATE="$git_commit_date"
          git add commit.md -f
          git commit --date="$git_commit_date" -m "$i on $M $D $Y"
        done
      done
    done
  done
  git push origin main
}

commit_random_dates
