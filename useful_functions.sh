#######################################
# Functions                           #
#######################################

# Force release update in Github.
# Usage: force_git_release_update_to_commit {relase tag}
force_git_release_update_to_commit() {
    #do things with parameters like $1 such as
    git tag -f -m "Forcing minor update of docs" -a $1
    git push
    git push -f --tags
}

# Directly download files from onedrive using the "share link" 
# Usage: onelink 'https://1drv.ms/t/s!ApRqRchcfy5ngoUeuYHA65us-fYO-Q?e=LbC7AJ' {output file name}
onelink() {

  if [ ! -n "$2" ]; then
    name='outputfile'
  else
    name="$2"
  fi

  link=$(echo -n "$1"|base64|sed "s/=$//;s/\//\_/g;s/\+/\-/g;s/^/https:\/\/api\.onedrive\.com\/v1\.0\/shares\/u\!/;s/$/\/root\/content/" | head -n 1);
  link=\'${link}\'
  bash -c "wget -O ${name} ${link}" ;

}

# Check disk usage/mounted
checkdisk() { ps aux | grep fsck; }

# function to convert PAF to bed with sequences
paf2bedseq() {
  # order: PAF FASTA

  # create bed
  cut -f 6,8,9 $1 > paf2bedseq.bed

  # get fasta
  bedtools getfasta -fi $2 -fo paf2bedseq.fasta -bed paf2bedseq.bed

  # create final file
  seqkit fx2tab paf2bedseq.fasta | sed -e 's/:/\t/g' -e 's/-/\t/g' -e 's/ /\t/g'

  # clean env
  rm paf2bedseq.bed paf2bedseq.fasta
}
