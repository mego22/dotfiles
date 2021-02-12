# All the good stuff is in ~/.profile.d
for FILE in `ls ~/.profile.d`; do
  source ~/.profile.d/${FILE}
done

if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

if [ -f ~/.profile_work ]; then
  source ~/.profile_work
fi
